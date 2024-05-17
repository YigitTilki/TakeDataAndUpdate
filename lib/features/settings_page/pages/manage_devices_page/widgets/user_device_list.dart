part of '../manage_devices_page.dart';

class _DevicesList extends StatelessWidget {
  const _DevicesList({
    required this.devices,
  });

  final List<String> devices;

  @override
  Widget build(BuildContext context) {
    const iconSize = 25;
    return ListView.builder(
      itemCount: devices.length,
      itemBuilder: (BuildContext context, int index) {
        return FutureBuilder<DeviceModel?>(
          future: DeviceService().getDevice(deviceId: devices[index]),
          builder: (
            BuildContext context,
            AsyncSnapshot<DeviceModel?> snapshot,
          ) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Assets.lottie.loading.lottie(height: 50.h);
            } else if (snapshot.hasError) {
              return Text(
                'Error: ${snapshot.error}',
              );
            } else {
              final deviceModel = snapshot.data;
              return Padding(
                padding:
                    ProjectPadding.symHNormal() + ProjectPadding.symVXSmall(),
                child: Container(
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
                        show(
                          context,
                          UserDeviceCredentialsPopUp(
                            deviceModel: deviceModel,
                          ),
                        );
                      },
                      leading: Assets.icons.manageDeviceIcon.image(
                        width: iconSize.w,
                        height: iconSize.h,
                      ),
                      title: Text(
                        deviceModel!.deviceName!,
                      ),
                      subtitle: const Text('Coni'),
                    ),
                  ),
                ),
              );
            }
          },
        );
      },
    );
  }
}
