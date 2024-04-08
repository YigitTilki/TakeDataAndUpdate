import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:take_data_and_update_project/product/constants/app_spacer.dart';
import 'package:take_data_and_update_project/product/models/data_model.dart';
import 'package:take_data_and_update_project/product/models/device_model.dart';
import 'package:take_data_and_update_project/product/service/devices_service.dart';
import 'package:take_data_and_update_project/product/util/asset/assets.gen.dart';
import 'package:take_data_and_update_project/product/util/date_time.dart';
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

class _ChosenDevicePageState extends ConsumerState<ChosenDevicePage> {
  late String selectedDate = MyDateTime().getDate();
  late Key futureBuilderKey;

  @override
  void initState() {
    super.initState();
    futureBuilderKey = UniqueKey();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.secondaryColor,
      body: SafeArea(
        child: Column(
          children: [
            AppSpacer.vertical.space10,
            CustomHeader(
              icon: Assets.icons.phoneIcon.image(),
              text: widget.deviceModel.deviceName.toString(),
              needBackButton: true,
              iconButton: IconButton(
                onPressed: () async {
                  final date = await showDatePicker(
                    context: context,
                    firstDate: DateTime(2024),
                    lastDate: DateTime(2100),
                    initialDate: DateTime.now(),
                  );
                  final dateFormatter = DateFormat('dd-MM-yyyy');
                  final myDate = dateFormatter.format(date!);
                  setState(() {
                    selectedDate = myDate;
                    futureBuilderKey = UniqueKey();
                  });
                },
                icon: const Icon(Icons.date_range),
              ),
            ),
            AppSpacer.vertical.space10,
            Divider(
              color: context.fourthColor,
              thickness: 2,
              endIndent: 10.w,
              indent: 10.w,
            ),
            StreamBuilder(
              stream: DeviceService().streamDeviceData(
                widget.deviceModel.id.toString(),
                selectedDate,
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
                  return Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 25.w,
                        mainAxisExtent: 100,
                      ),
                      itemCount: deviceData!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            ListTile(
                              title: RichText(
                                text: TextSpan(
                                  text: 'Data: ',
                                  style: context.bodyLarge!
                                      .copyWith(fontWeight: FontWeight.w400),
                                  children: [
                                    TextSpan(
                                      text: deviceData[index].temp.toString(),
                                      style: context.bodyLarge!.copyWith(
                                        color: deviceData[index].temp! > 25
                                            ? Colors.red
                                            : deviceData[index].temp! <= 15
                                                ? Colors.blue
                                                : Colors.green,
                                      ),
                                    ),
                                    const TextSpan(text: 'C°'),
                                  ],
                                ),
                              ),
                              subtitle: Text(
                                'Hour: ${deviceData[index].hour}',
                                style: context.bodyLarge!
                                    .copyWith(fontWeight: FontWeight.w300),
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
              },
            ),
          ],
        ),
      ),
    );
  }
}
