import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:take_data_and_update_project/product/enums/data_limit_constants.dart';
import 'package:take_data_and_update_project/product/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/product/models/data_model.dart';
import 'package:take_data_and_update_project/product/util/extensions/build_context_extension.dart';

class DeviceTypeClass {
  final maxTemp = DataLimitConstants.maxTemp.value;
  final minTemp = DataLimitConstants.minTemp.value;
  final maxHum = DataLimitConstants.maxHum.value;
  final minHum = DataLimitConstants.minHum.value;

  RichText forTempDevice(
    BuildContext context,
    List<DataModel> deviceData,
    int index,
  ) {
    return RichText(
      text: TextSpan(
        text: '${LocaleKeys.devicesPage_temperature.tr()}: ',
        style: context.bodyLarge!.copyWith(fontWeight: FontWeight.w400),
        children: [
          TextSpan(
            text: deviceData[index].temp1.toString(),
            style: context.bodyLarge!.copyWith(
              color: deviceData[index].temp1! > maxTemp ||
                      deviceData[index].temp1! <= minTemp
                  ? Colors.red
                  : Colors.green,
            ),
          ),
          const TextSpan(text: 'C°'),
        ],
      ),
    );
  }

  RichText forHumidityDevice(
    BuildContext context,
    List<DataModel> deviceData,
    int index,
  ) {
    return RichText(
      text: TextSpan(
        text: '${LocaleKeys.devicesPage_humidity.tr()}: ',
        style: context.bodyLarge!.copyWith(fontWeight: FontWeight.w400),
        children: [
          const TextSpan(text: '%'),
          TextSpan(
            text: deviceData[index].humidity.toString(),
            style: context.bodyLarge!.copyWith(
              color: deviceData[index].humidity! > maxHum ||
                      deviceData[index].humidity! <= minHum
                  ? Colors.red
                  : Colors.green,
            ),
          ),
        ],
      ),
    );
  }

  RichText bothDevice(
    BuildContext context,
    List<DataModel> deviceData,
    int index,
  ) {
    return RichText(
      text: TextSpan(
        text: '${LocaleKeys.devicesPage_temperature.tr()}: ',
        style: context.bodyLarge!.copyWith(fontWeight: FontWeight.w400),
        children: [
          TextSpan(
            text: deviceData[index].temp1.toString(),
            style: context.bodyLarge!.copyWith(
              color: deviceData[index].temp1! > maxTemp ||
                      deviceData[index].temp1! <= minTemp
                  ? Colors.red
                  : Colors.green,
            ),
          ),
          const TextSpan(text: 'C°\n'),
          TextSpan(
            text: '${LocaleKeys.devicesPage_humidity.tr()}: ',
            style: context.bodyLarge!.copyWith(fontWeight: FontWeight.w400),
            children: [
              const TextSpan(text: '%'),
              TextSpan(
                text: deviceData[index].humidity.toString(),
                style: context.bodyLarge!.copyWith(
                  color: deviceData[index].humidity! > maxHum ||
                          deviceData[index].humidity! <= minHum
                      ? Colors.red
                      : Colors.green,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
