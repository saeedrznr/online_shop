/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImgGen {
  const $AssetsImgGen();

  $AssetsImgBackgroundGen get background => const $AssetsImgBackgroundGen();
  $AssetsImgIconGen get icon => const $AssetsImgIconGen();
}

class $AssetsImgBackgroundGen {
  const $AssetsImgBackgroundGen();

  /// File path: assets/img/background/background.png
  AssetGenImage get background =>
      const AssetGenImage('assets/img/background/background.png');

  /// File path: assets/img/background/des1.png
  AssetGenImage get des1 =>
      const AssetGenImage('assets/img/background/des1.png');

  /// File path: assets/img/background/des2.png
  AssetGenImage get des2 =>
      const AssetGenImage('assets/img/background/des2.png');

  /// File path: assets/img/background/des3.png
  AssetGenImage get des3 =>
      const AssetGenImage('assets/img/background/des3.png');

  /// List of all assets
  List<AssetGenImage> get values => [background, des1, des2, des3];
}

class $AssetsImgIconGen {
  const $AssetsImgIconGen();

  /// File path: assets/img/icon/apple.png
  AssetGenImage get apple => const AssetGenImage('assets/img/icon/apple.png');

  /// File path: assets/img/icon/back.png
  AssetGenImage get back => const AssetGenImage('assets/img/icon/back.png');

  /// File path: assets/img/icon/facebook.png
  AssetGenImage get facebook =>
      const AssetGenImage('assets/img/icon/facebook.png');

  /// File path: assets/img/icon/google.png
  AssetGenImage get google => const AssetGenImage('assets/img/icon/google.png');

  /// File path: assets/img/icon/next.png
  AssetGenImage get next => const AssetGenImage('assets/img/icon/next.png');

  /// File path: assets/img/icon/progress1.png
  AssetGenImage get progress1 =>
      const AssetGenImage('assets/img/icon/progress1.png');

  /// File path: assets/img/icon/progress2.png
  AssetGenImage get progress2 =>
      const AssetGenImage('assets/img/icon/progress2.png');

  /// File path: assets/img/icon/progress3.png
  AssetGenImage get progress3 =>
      const AssetGenImage('assets/img/icon/progress3.png');

  /// File path: assets/img/icon/progress4.png
  AssetGenImage get progress4 =>
      const AssetGenImage('assets/img/icon/progress4.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        apple,
        back,
        facebook,
        google,
        next,
        progress1,
        progress2,
        progress3,
        progress4
      ];
}

class Assets {
  Assets._();

  static const $AssetsImgGen img = $AssetsImgGen();
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
