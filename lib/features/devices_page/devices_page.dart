import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_data_and_update_project/product/constants/app_spacer.dart';
import 'package:take_data_and_update_project/product/constants/project_padding.dart';
import 'package:take_data_and_update_project/product/init/languages/locale_keys.g.dart';
import 'package:take_data_and_update_project/product/models/device_model.dart';
import 'package:take_data_and_update_project/product/providers/device_list_provider.dart';
import 'package:take_data_and_update_project/product/util/asset/assets.gen.dart';
import 'package:take_data_and_update_project/product/util/extensions/build_context_extension.dart';
import 'package:take_data_and_update_project/product/widgets/containers/custom_header.dart';

@RoutePage()
class DevicesPage extends ConsumerStatefulWidget {
  const DevicesPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DevicesPageState();
}

class _DevicesPageState extends ConsumerState<DevicesPage> {
  final TextEditingController searchTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final deviceListState = ref.watch(deviceListProvider);
    return Scaffold(
      backgroundColor: context.secondaryColor,
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(onPressed: () {}),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: ProjectPadding.allSmall(),
            child: Column(
              children: [
                CustomHeader(
                  icon: Assets.icons.manageDeviceIcon.image(),
                  text: LocaleKeys.usersPage_devices,
                  needBackButton: true,
                ),
                AppSpacer.vertical.space20,
                Padding(
                  padding: ProjectPadding.symHXXSmall(),
                  child: TextField(
                    controller: searchTextController,
                    style: context.headlineMedium,
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 15.0.w, right: 10.w),
                        child: Icon(
                          Icons.search,
                          size: 20.sp,
                        ),
                      ),
                      hintText: LocaleKeys.adminPage_usersPage_search.tr(),
                      hintStyle: context.headlineMedium,
                    ),
                    onChanged: (value) {
                      if (deviceListState is AsyncData<List<DeviceModel>>) {
                        ref
                            .read(deviceListNotifierProvider.notifier)
                            .filterUsers(
                              value,
                              deviceListState.value.toList(),
                            );
                        ref.invalidate(deviceListProvider);
                      }
                    },
                  ),
                ),
                AppSpacer.vertical.space5,
                Divider(
                  endIndent: 6.w,
                  indent: 6.w,
                  thickness: 3.h,
                  color: context.primaryColor,
                ),
                AppSpacer.vertical.space5,
                deviceListState.maybeWhen(
                  data: (data) {
                    final filteredList = data
                        .where(
                          (device) =>
                              (device.id != null &&
                                  device.id!.toLowerCase().contains(
                                        searchTextController.text.toLowerCase(),
                                      )) ||
                              (device.userId != null &&
                                  device.userId!.toLowerCase().contains(
                                        searchTextController.text.toLowerCase(),
                                      )),
                        )
                        .toList();
                    return Expanded(
                      child: ListView.builder(
                        itemCount: filteredList.length,
                        itemBuilder: (BuildContext context, int index) {
                          final device = filteredList[index];
                          return Padding(
                            padding: ProjectPadding.symHXXSmall() +
                                ProjectPadding.symVXSmall(),
                            child: Container(
                              height: 60.h,
                              decoration: ShapeDecoration(
                                color: context.fourthColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.sp),
                                  side: BorderSide(
                                    color: context.primaryColor,
                                    width: 2.sp,
                                  ),
                                ),
                              ),
                              child: Center(
                                child: ListTile(
                                  onTap: () {
                                    // Buraya tıklama olayı ekleyin
                                    // Örneğin, seçilen cihazın detay sayfasına yönlendirme yapabilirsiniz
                                    // Örneğin: AutoRouter.of(context).push(DeviceDetailPageRoute(device: device));
                                  },
                                  leading: Assets.icons.usersIcon.image(
                                    width: 30.w,
                                    height: 30.h,
                                    color: context.primaryColor,
                                  ),
                                  title: Text(
                                    '${device.id}', // Cihazın ID'sini kullanın veya istediğiniz bir veriyi buraya yerleştirin
                                    style: context.titleMedium,
                                  ),
                                  subtitle: Text(
                                    '${device.userId}', // Cihazın kullanıcı ID'sini kullanın veya istediğiniz bir veriyi buraya yerleştirin
                                    style: context.titleMedium,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                  orElse: () =>
                      const Center(child: CircularProgressIndicator()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
