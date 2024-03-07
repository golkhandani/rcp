import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:image/image.dart' as img;
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:rcp/core/functions/extentions.dart';
import 'package:rcp/core/functions/models/api_response.dart';
import 'package:rcp/core/functions/models/user_profile/index.dart';
import 'package:rcp/core/functions/models/user_username_is_available/index.dart';
import 'package:rcp/core/functions/single_domain_functions.dart';
import 'package:rcp/core/ioc.dart';
import 'package:rcp/core/models/shopping_list_model.dart';
import 'package:rcp/core/services/storage_service.dart';

class UsersFunctions extends SingleDomainFunctions {
  final _logger = locator.console('UsersFunctions');

  UsersFunctions(SupabaseClient supabaseClient)
      : super(
          'users',
          supabaseClient,
        );

  Future<UserProfile2> userRawProfileGet() async {
    try {
      final functionName = getfnName('me');
      final res = await supabaseClient.functions.get(functionName);

      final parsed = ApiResponse.tryParse<UserProfile2>(
        res.data,
        UserProfile2.fromJson,
      );

      return parsed.doc!;
    } on FunctionException catch (e) {
      final res = ApiResponse.tryParseError(e.details);
      _logger.error("${e.details}");
      throw res.error!;
    } catch (e) {
      _logger.error(e);
      throw ApiError.unknown();
    }
  }

  Future<UserProfile2> userProfileGet() async {
    try {
      final functionName = getfnName('me');
      final res = await supabaseClient.functions.get(functionName);

      final parsed = ApiResponse.tryParse<UserProfile2>(
        res.data,
        UserProfile2.fromJson,
      );

      var profile = parsed.doc!;

      if (profile.avatarUrl != null) {
        try {
          final signedUrl = await supabaseClient.storage
              .from(StorageServie.avatarsBucketId)
              .createSignedUrl(profile.avatarUrl!, 60 * 60 * 24 * 365 * 10);
          profile = profile.copyWith(avatarUrl: signedUrl);
        } catch (e) {
          _logger.error(e);
        }
      }

      return profile;
    } on FunctionException catch (e) {
      final res = ApiResponse.tryParseError(e.details);
      _logger.error("${e.details}");
      throw res.error!;
    } catch (e) {
      _logger.error(e);
      throw ApiError.unknown();
    }
  }

  Future<UserProfile2> userProfileUpdate({
    required UserProfileUpdateInput body,
  }) async {
    try {
      final input = body.toJson();
      input.removeWhere((key, value) => value == null);

      final functionName = getfnName('me');

      final res = await supabaseClient.functions.put(functionName, body: input);
      final parsed = ApiResponse.tryParse<UserProfile2>(
        res.data,
        UserProfile2.fromJson,
      );

      var profile = parsed.doc!;

      if (profile.avatarUrl != null) {
        try {
          final signedUrl = await supabaseClient.storage
              .from(StorageServie.avatarsBucketId)
              .createSignedUrl(profile.avatarUrl!, 60 * 60 * 24 * 365 * 10);
          profile = profile.copyWith(avatarUrl: signedUrl);
        } catch (e) {
          _logger.error(e);
          rethrow;
        }
      }
      return profile;
    } on FunctionException catch (e) {
      final res = ApiResponse.tryParseError(e.details);
      _logger.error("${e.details}");
      throw res.error!;
    } catch (e) {
      _logger.error(e);
      throw ApiError.unknown();
    }
  }

  Future<Uint8List> _compress(Uint8List pngBytes) async {
    final pngImage = img.decodeImage(pngBytes);
    final pngImageResized = img.copyResize(pngImage!, width: 400);
    return img.encodeJpg(pngImageResized, quality: 60);
  }

  Future<UserProfile2> userProfileUpdateAvatar({
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
        await supabaseClient.storage
            .from(StorageServie.avatarsBucketId)
            .remove([filePath]);
      } catch (e) {
        locator.logger.error(e);
      }

      // upload new image
      final compresssedFile = await _compress(file.bytes!);
      await supabaseClient.storage
          .from(StorageServie.avatarsBucketId)
          .uploadBinary(
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
    } on FunctionException catch (e) {
      final res = ApiResponse.tryParseError(e.details);
      _logger.error("${e.details}");
      throw res.error!;
    } catch (e) {
      _logger.error(e);
      throw ApiError.unknown();
    }
  }

  Future<void> userDelete() async {
    try {
      final functionName = getfnName('me');
      await supabaseClient.functions.delete(functionName);
    } catch (e) {
      locator.logger.error(e);
      rethrow;
    }
  }

  // profile check
  Future<UserUsernameIsAvailableOutout> userUsernameIsAvailable({
    required UserUsernameIsAvailableInput body,
  }) async {
    try {
      final functionName = getfnName('username_is_available');
      final res = await supabaseClient.functions.get(
        functionName,
        query: body.toJson(),
      );
      return UserUsernameIsAvailableOutout.fromJson(res.data);
    } catch (e) {
      locator.logger.error(e);
      return const UserUsernameIsAvailableOutout(isAvailable: false);
    }
  }
}
