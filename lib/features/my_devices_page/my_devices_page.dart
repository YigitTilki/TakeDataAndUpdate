import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/product/constants/app_spacer.dart';
import 'package:take_data_and_update_project/product/constants/project_padding.dart';
import 'package:take_data_and_update_project/product/models/device_model.dart';
import 'package:take_data_and_update_project/product/models/user_model.dart';
import 'package:take_data_and_update_project/product/providers/device_list_provider.dart';
import 'package:take_data_and_update_project/product/service/devices_service.dart';
import 'package:take_data_and_update_project/product/util/asset/assets.gen.dart';
import 'package:take_data_and_update_project/product/util/extensions/build_context_extension.dart';
import 'package:take_data_and_update_project/product/widgets/containers/custom_header.dart';
import 'package:take_data_and_update_project/product/widgets/decorations.dart';

@RoutePage()
class MyDevicesPage extends ConsumerWidget {
  const MyDevicesPage({required this.userModel, super.key});
  final UserModel userModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDeviceList =
        ref.watch(userDeviceListProvider(userModel.id.toString()));
    return Scaffold(
      backgroundColor: context.secondaryColor,
      body: SafeArea(
        child: Column(
          children: [
            CustomHeader(
              icon: Assets.icons.phoneIcon.image(),
              text: 'My Devices',
              needBackButton: true,
            ),
            AppSpacer.vertical.space20,
            userDeviceList.when(
              data: (devices) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: devices.length,
                    itemBuilder: (BuildContext context, int index) {
                      return FutureBuilder(
                        future: DeviceService().getDevice(devices[index]),
                        builder: (
                          BuildContext context,
                          AsyncSnapshot<DeviceModel?> snapshot,
                        ) {
                          final deviceModel = snapshot.data;
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (snapshot.hasError) {
                            return Text(
                              'Error: ${snapshot.error}',
                            );
                          } else {
                            return Padding(
                              padding: const EdgeInsets.all(8),
                              child: Container(
                                decoration:
                                    Decorations.borderContainerDecoration(
                                  context.fourthColor,
                                  context.primaryColor,
                                ),
                                padding: ProjectPadding.allLarge(),
                                child: Row(
                                  children: [
                                    if (deviceModel!.type == 'Temperature')
                                      Assets.icons.temperatureIcon
                                          .image(width: 80.w)
                                    else if (deviceModel.type == 'Humidity')
                                      Assets.icons.humidityIcon
                                          .image(width: 80.w)
                                    else
                                      Assets.icons.humidityTemperatureIcon
                                          .image(width: 80.w),
                                    AppSpacer.horizontal.space15,
                                    Text(
                                      deviceModel.deviceName.toString(),
                                      style: context.displaySmall,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }
                        },
                      );
                    },
                  ),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) => Text('Error: $error'),
            ),
          ],
        ),
      ),
    );
  }
}
