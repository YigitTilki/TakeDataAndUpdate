/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/adminIcon.png
  AssetGenImage get adminIcon =>
      const AssetGenImage('assets/icons/adminIcon.png');

  /// File path: assets/icons/changeLanguageIcon.png
  AssetGenImage get changeLanguageIcon =>
      const AssetGenImage('assets/icons/changeLanguageIcon.png');

  /// File path: assets/icons/logOutIcon.png
  AssetGenImage get logOutIcon =>
      const AssetGenImage('assets/icons/logOutIcon.png');

  /// File path: assets/icons/manageDeviceIcon.png
  AssetGenImage get manageDeviceIcon =>
      const AssetGenImage('assets/icons/manageDeviceIcon.png');

  /// File path: assets/icons/noProfilePhotoIcon.png
  AssetGenImage get noProfilePhotoIcon =>
      const AssetGenImage('assets/icons/noProfilePhotoIcon.png');

  /// File path: assets/icons/notificationSettingsIcon.png
  AssetGenImage get notificationSettingsIcon =>
      const AssetGenImage('assets/icons/notificationSettingsIcon.png');

  /// File path: assets/icons/overheatIcon.png
  AssetGenImage get overheatIcon =>
      const AssetGenImage('assets/icons/overheatIcon.png');

  /// File path: assets/icons/phoneIcon.png
  AssetGenImage get phoneIcon =>
      const AssetGenImage('assets/icons/phoneIcon.png');

  /// File path: assets/icons/settingsIcon.svg
  SvgGenImage get settingsIcon =>
      const SvgGenImage('assets/icons/settingsIcon.svg');

  /// File path: assets/icons/starsIcon.svg
  SvgGenImage get starsIcon => const SvgGenImage('assets/icons/starsIcon.svg');

  /// File path: assets/icons/updateProfileIcon.png
  AssetGenImage get updateProfileIcon =>
      const AssetGenImage('assets/icons/updateProfileIcon.png');

  /// File path: assets/icons/usersIcon.png
  AssetGenImage get usersIcon =>
      const AssetGenImage('assets/icons/usersIcon.png');

  /// File path: assets/icons/versionControlIcon.png
  AssetGenImage get versionControlIcon =>
      const AssetGenImage('assets/icons/versionControlIcon.png');

  /// List of all assets
  List<dynamic> get values => [
        adminIcon,
        changeLanguageIcon,
        logOutIcon,
        manageDeviceIcon,
        noProfilePhotoIcon,
        notificationSettingsIcon,
        overheatIcon,
        phoneIcon,
        settingsIcon,
        starsIcon,
        updateProfileIcon,
        usersIcon,
        versionControlIcon
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/profilePhoto.png
  AssetGenImage get profilePhoto =>
      const AssetGenImage('assets/images/profilePhoto.png');

  /// File path: assets/images/tr_flag.png
  AssetGenImage get trFlag => const AssetGenImage('assets/images/tr_flag.png');

  /// File path: assets/images/uk_flag.png
  AssetGenImage get ukFlag => const AssetGenImage('assets/images/uk_flag.png');

  /// List of all assets
  List<AssetGenImage> get values => [profilePhoto, trFlag, ukFlag];
}

class $AssetsTranslationsGen {
  const $AssetsTranslationsGen();

  /// File path: assets/translations/en.json
  String get en => 'assets/translations/en.json';

  /// File path: assets/translations/tr.json
  String get tr => 'assets/translations/tr.json';

  /// List of all assets
  List<String> get values => [en, tr];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsTranslationsGen translations = $AssetsTranslationsGen();
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

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
