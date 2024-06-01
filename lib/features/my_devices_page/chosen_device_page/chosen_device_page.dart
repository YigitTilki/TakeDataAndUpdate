import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/features/my_devices_page/chosen_device_page/chosen_device_mixin.dart';
import 'package:take_data_and_update_project/features/my_devices_page/chosen_device_page/deviceTypeClass.dart';
import 'package:take_data_and_update_project/product/constants/app_spacer.dart';
import 'package:take_data_and_update_project/product/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/product/models/data_model.dart';
import 'package:take_data_and_update_project/product/models/device_model.dart';
import 'package:take_data_and_update_project/product/providers/device_list_provider.dart';
import 'package:take_data_and_update_project/product/service/devices_service.dart';
import 'package:take_data_and_update_project/product/util/asset/assets.gen.dart';
import 'package:take_data_and_update_project/product/util/extensions/build_context_extension.dart';
import 'package:take_data_and_update_project/product/widgets/containers/custom_header.dart';

@RoutePage()
class ChosenDevicePage extends ConsumerStatefulWidget {
  const ChosenDevicePage(this.deviceModel, {super.key});
  final DeviceModel deviceModel;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChosenDevicePageState();
}

class _ChosenDevicePageState extends ConsumerState<ChosenDevicePage>
    with ChosenDevicePageMixin {
  @override
  Widget build(BuildContext context) {
    final selectedDate = ref.watch(selectedDateProvider);
    return Scaffold(
      backgroundColor: context.secondaryColor,
      body: SafeArea(
        child: Column(
          children: [
            AppSpacer.vertical.space10,
            _header(),
            AppSpacer.vertical.space20,
            _DateText(selectedDate: selectedDate),
            const _DateDivider(),
            StreamBuilder(
              stream: DeviceService().getDeviceData(
                deviceId: widget.deviceModel.id.toString(),
                dateTime: selectedDate,
              ),
              builder: (
                BuildContext context,
                AsyncSnapshot<List<DataModel>> snapshot,
              ) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: Assets.lottie.loading.lottie(height: 50.h),
                  );
                } else if (snapshot.hasError) {
                  return Text(
                    'Error: ${snapshot.error}',
                  );
                } else {
                  final deviceData = snapshot.data;
                  return _GridView(deviceData: deviceData, widget: widget);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  CustomHeader _header() {
    return CustomHeader(
      icon: Assets.icons.phoneIcon.image(),
      text: widget.deviceModel.deviceName.toString(),
      needBackButton: true,
      iconButton: IconButton(
        onPressed: datePicker,
        icon: const Icon(Icons.date_range),
      ),
    );
  }
}

class _GridView extends StatelessWidget {
  const _GridView({
    required this.deviceData,
    required this.widget,
  });

  final List<DataModel>? deviceData;
  final ChosenDevicePage widget;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 25.w,
          mainAxisExtent: 120,
        ),
        itemCount: deviceData!.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              ListTile(
                title: widget.deviceModel.type == 'Temperature'
                    ? DeviceTypeClass()
                        .forTempDevice(context, deviceData!, index)
                    : widget.deviceModel.type == 'Humidity'
                        ? DeviceTypeClass().forHumidityDevice(
                            context,
                            deviceData!,
                            index,
                          )
                        : DeviceTypeClass().bothDevice(
                            context,
                            deviceData!,
                            index,
                          ),
                subtitle: Text(
                  '${LocaleKeys.devicesPage_hour.tr()}: ${deviceData![index].time}',
                  style:
                      context.bodyLarge!.copyWith(fontWeight: FontWeight.w300),
                ),
              ),
              Divider(
                color: context.whiteColor,
              ),
            ],
          );
        },
      ),
    );
  }
}

class _DateDivider extends StatelessWidget {
  const _DateDivider();

  @override
  Widget build(BuildContext context) {
    const indent = 85;
    return Divider(
      color: context.whiteColor,
      endIndent: indent.w,
      indent: indent.w,
    );
  }
}

class _DateText extends StatelessWidget {
  const _DateText({
    required this.selectedDate,
  });

  final String selectedDate;

  @override
  Widget build(BuildContext context) {
    return Text(
      selectedDate,
      style: context.headlineLarge!.copyWith(fontWeight: FontWeight.w400),
    );
  }
}
