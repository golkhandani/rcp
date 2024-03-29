/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/comming_soon.jpeg
  AssetGenImage get commingSoon =>
      const AssetGenImage('assets/images/comming_soon.jpeg');

  /// File path: assets/images/list_is_empty.jpeg
  AssetGenImage get listIsEmpty =>
      const AssetGenImage('assets/images/list_is_empty.jpeg');

  /// File path: assets/images/login_bg.jpeg
  AssetGenImage get loginBg =>
      const AssetGenImage('assets/images/login_bg.jpeg');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/logo_complete.jpg
  AssetGenImage get logoComplete =>
      const AssetGenImage('assets/images/logo_complete.jpg');

  /// File path: assets/images/profile_placeholder.jpg
  AssetGenImage get profilePlaceholder =>
      const AssetGenImage('assets/images/profile_placeholder.jpg');

  /// File path: assets/images/shopping_item_1.jpeg
  AssetGenImage get shoppingItem1 =>
      const AssetGenImage('assets/images/shopping_item_1.jpeg');

  /// File path: assets/images/shopping_item_2.jpeg
  AssetGenImage get shoppingItem2 =>
      const AssetGenImage('assets/images/shopping_item_2.jpeg');

  /// File path: assets/images/shopping_item_3.jpeg
  AssetGenImage get shoppingItem3 =>
      const AssetGenImage('assets/images/shopping_item_3.jpeg');

  /// File path: assets/images/shopping_item_4.jpeg
  AssetGenImage get shoppingItem4 =>
      const AssetGenImage('assets/images/shopping_item_4.jpeg');

  /// File path: assets/images/shopping_list_1.jpeg
  AssetGenImage get shoppingList1 =>
      const AssetGenImage('assets/images/shopping_list_1.jpeg');

  /// File path: assets/images/shopping_list_2.jpeg
  AssetGenImage get shoppingList2 =>
      const AssetGenImage('assets/images/shopping_list_2.jpeg');

  /// File path: assets/images/shopping_list_3.jpeg
  AssetGenImage get shoppingList3 =>
      const AssetGenImage('assets/images/shopping_list_3.jpeg');

  /// File path: assets/images/shopping_list_4.jpeg
  AssetGenImage get shoppingList4 =>
      const AssetGenImage('assets/images/shopping_list_4.jpeg');

  /// List of all assets
  List<AssetGenImage> get values => [
        commingSoon,
        listIsEmpty,
        loginBg,
        logo,
        logoComplete,
        profilePlaceholder,
        shoppingItem1,
        shoppingItem2,
        shoppingItem3,
        shoppingItem4,
        shoppingList1,
        shoppingList2,
        shoppingList3,
        shoppingList4
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
