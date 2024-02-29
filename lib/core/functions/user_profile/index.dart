// ignore_for_file: constant_identifier_names

import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image/image.dart' as img;
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:rcp/core/ioc.dart';
import 'package:rcp/core/services/storage_service.dart';

part 'index.freezed.dart';
part 'index.g.dart';

const user_profile_update = 'user_profile_update';
const user_profile_get = 'user_profile_get';

@freezed
abstract class UserProfileUpdateInput with _$UserProfileUpdateInput {
  const factory UserProfileUpdateInput({
    @JsonKey(name: 'username') required String username,
    @JsonKey(name: 'full_name') String? fullName,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
  }) = _UserProfileUpdateInput;

  factory UserProfileUpdateInput.fromJson(Map<String, dynamic> json) =>
      _$UserProfileUpdateInputFromJson(json);
}

@freezed
abstract class UserProfile with _$UserProfile {
  const UserProfile._();
  const factory UserProfile({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'username') required String username,
    @JsonKey(name: 'full_name') String? fullName,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _UserProfile;

  String get safeName => fullName ?? username;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}

extension UserProfileFunctions on SupabaseClient {
  Future<UserProfile> userProfileUpdate({
    required UserProfileUpdateInput body,
  }) async {
    try {
      final input = body.toJson();
      input.removeWhere((key, value) => value == null);
      final res = await functions.invoke(user_profile_update, body: input);
      var profile = UserProfile.fromJson(res.data);

      if (profile.avatarUrl != null) {
        try {
          final signedUrl = await storage
              .from(StorageServie.avatarsBucketId)
              .createSignedUrl(profile.avatarUrl!, 60 * 60 * 24 * 365 * 10);
          profile = profile.copyWith(avatarUrl: signedUrl);
        } catch (e) {
          locator.logger.error(e);
        }
      }
      return profile;
    } catch (e) {
      locator.logger.error(e);
      rethrow;
    }
  }

  Future<UserProfile> userProfileGet() async {
    try {
      final res = await functions.invoke(user_profile_get);
      if (res.data == null) {
        throw FunctionException(status: 404);
      }
      var profile = UserProfile.fromJson(res.data);

      if (profile.avatarUrl != null) {
        try {
          final signedUrl = await storage
              .from(StorageServie.avatarsBucketId)
              .createSignedUrl(profile.avatarUrl!, 60 * 60 * 24 * 365 * 10);
          profile = profile.copyWith(avatarUrl: signedUrl);
        } catch (e) {
          locator.logger.error(e);
        }
      }

      return profile;
    } catch (e) {
      locator.logger.error(e);
      rethrow;
    }
  }

  Future<Uint8List> _compress(Uint8List pngBytes) async {
    final pngImage = img.decodeImage(pngBytes);
    final pngImageResized = img.copyResize(pngImage!, width: 400);
    return img.encodeJpg(pngImageResized, quality: 60);
  }

  Future<UserProfile> userRawProfileGet() async {
    try {
      final res = await functions.invoke(user_profile_get);
      var profile = UserProfile.fromJson(res.data);
      return profile;
    } catch (e) {
      locator.logger.error(e);
      rethrow;
    }
  }

  Future<UserProfile> userProfileUpdateAvatar({
    required PlatformFile file,
  }) async {
    try {
      if (file.bytes == null) {
        throw const StorageException(
          'File has no data!',
          statusCode: '4001',
        );
      }

      // Get raw data to access avatar file path
      final currentProfile = await userRawProfileGet();
      final userId = currentProfile.userId;

      final filePath = '$userId/${userId.hashCode.toString()}';

      // Remove old image
      // for now we only accept one image
      try {
        await storage.from(StorageServie.avatarsBucketId).remove([filePath]);
      } catch (e) {
        locator.logger.error(e);
      }

      // upload new image
      final compresssedFile = await _compress(file.bytes!);
      await storage.from(StorageServie.avatarsBucketId).uploadBinary(
            filePath,
            compresssedFile,
          );

      // update profile with new image
      final updateProfile = UserProfileUpdateInput(
        username: currentProfile.username,
        fullName: currentProfile.fullName,
        avatarUrl: filePath,
      );

      return await userProfileUpdate(body: updateProfile);
    } catch (e) {
      locator.logger.error(e);
      rethrow;
    }
  }
}
