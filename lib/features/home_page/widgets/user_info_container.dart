part of '../home_page.dart';

class _UserInfoContainer extends StatelessWidget {
  const _UserInfoContainer({
    required this.bigContainerWidth,
    required this.smallContainerHeight,
    required this.userModel,
  });

  final int bigContainerWidth;
  final int smallContainerHeight;
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: HomeContainer(
        width: bigContainerWidth,
        height: smallContainerHeight,
        child: Center(
          child: LargeText(
            value: '${userModel.firstName} ${userModel.lastName}',
          ),
        ),
      ),
    );
  }
}
