import 'package:take_data_and_update_project/product/init/languages/locales.dart';
import 'package:take_data_and_update_project/product/util/asset/assets.gen.dart';

class LanguagesModel {
  LanguagesModel({
    required this.country,
    required this.image,
    required this.languageCode,
  });

  final String country;
  final AssetGenImage image;
  Locales languageCode;
}
