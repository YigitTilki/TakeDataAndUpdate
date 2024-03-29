part of 'devices_page.dart';

class _DevicesList extends ConsumerWidget {
  const _DevicesList({required this.searchTextController});
  final TextEditingController searchTextController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const iconSize = 30;
    final deviceListState = ref.watch(deviceListProvider);

    return deviceListState.maybeWhen(
      data: (data) {
        final filteredList = data.where(filter).toList();
        return Expanded(
          child: ListView.builder(
            itemCount: filteredList.length,
            itemBuilder: (BuildContext context, int index) {
              final device = filteredList[index];
              return Padding(
                padding:
                    ProjectPadding.symHXXSmall() + ProjectPadding.symVXSmall(),
                child: Container(
                  height: 60.h,
                  decoration: Decorations.borderContainerDecoration(
                    context.fourthColor,
                    context.primaryColor,
                  ),
                  child: Center(
                    child: ListTile(
                      onTap: () {
                        show(
                          context,
                          _DeviceCredentialsPopUP(deviceModel: device),
                        );
                      },
                      leading: Assets.icons.manageDeviceIcon.image(
                        width: iconSize.w,
                        height: iconSize.h,
                      ),
                      title: Text(
                        '${device.id}',
                      ),
                      trailing: Text(
                        device.type ?? 'Unassigned',
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
      orElse: () => const Center(child: CircularProgressIndicator()),
    );
  }

  bool filter(DeviceModel device) {
    return (device.id != null &&
            device.id!.toLowerCase().contains(
                  searchTextController.text.toLowerCase(),
                )) ||
        (device.userId != null &&
            device.userId!.toLowerCase().contains(
                  searchTextController.text.toLowerCase(),
                ));
  }
}
