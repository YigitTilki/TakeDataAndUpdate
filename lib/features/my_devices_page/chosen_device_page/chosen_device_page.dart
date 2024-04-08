import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/product/models/data_model.dart';
import 'package:take_data_and_update_project/product/models/device_model.dart';
import 'package:take_data_and_update_project/product/service/devices_service.dart';
import 'package:take_data_and_update_project/product/util/asset/assets.gen.dart';
import 'package:take_data_and_update_project/product/util/extensions/build_context_extension.dart';
import 'package:take_data_and_update_project/product/widgets/decorations.dart';

@RoutePage()
class ChosenDevicePage extends ConsumerStatefulWidget {
  const ChosenDevicePage(this.deviceModel, {super.key});
  final DeviceModel deviceModel;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChosenDevicePageState();
}

class _ChosenDevicePageState extends ConsumerState<ChosenDevicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.secondaryColor,
      body: SafeArea(
        child: Column(
          children: [
            FutureBuilder(
              future: DeviceService()
                  .getDeviceData(widget.deviceModel.id.toString()),
              builder: (BuildContext context,
                  AsyncSnapshot<List<DataModel>> snapshot) {
                final deviceData = snapshot.data;
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: Assets.lottie.loading.lottie(height: 50.h),
                  );
                } else if (snapshot.hasError) {
                  return Text(
                    'Error: ${snapshot.error}',
                  );
                } else {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: deviceData!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          decoration: Decorations.borderContainerDecoration(
                            context.fourthColor,
                            context.primaryColor,
                          ),
                          child: ListTile(
                            title: Text(deviceData[index].hour.toString()),
                            subtitle: Text(deviceData[index].temp.toString()),
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
