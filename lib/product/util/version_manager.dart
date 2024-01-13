class VersionManager {
  VersionManager({required this.deviceValue, required this.databaseValue});

  final String deviceValue;
  final String databaseValue;

  bool isNeedUpdate() {
    final deviceNumberSplit = deviceValue.split('.').join();
    final databaseNumberSplit = databaseValue.split('.').join();

    final deviceNumber = int.tryParse(deviceNumberSplit);
    final databaseNumber = int.tryParse(databaseNumberSplit);

    if (deviceNumber == null || databaseNumber == null) {
      throw Exception('error version');
    }

    return deviceNumber < databaseNumber;
  }
}
