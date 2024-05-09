// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class DataModel extends Equatable {
  const DataModel({
    this.device_id,
    this.temp1,
    this.humidity,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      device_id: json['device_id'] as String?,
      temp1: json['temp1'] as double?,
      humidity: json['humidity'] as int?,
    );
  }
  final String? device_id;
  final double? temp1;
  final int? humidity;

  @override
  List<Object?> get props => [device_id, temp1, humidity];

  DataModel copyWith({
    String? device_id,
    double? temp1,
    int? humidity,
  }) {
    return DataModel(
      device_id: device_id ?? this.device_id,
      temp1: temp1 ?? this.temp1,
      humidity: humidity ?? this.humidity,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'device_id': device_id,
      'temp1': temp1,
      'humidity': humidity,
    };
  }
}
/* class DataModel extends Equatable {
  const DataModel({
    this.hour,
    this.temp,
    this.humidity,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      hour: json['hour'] as String?,
      temp: json['temp'] as int?,
      humidity: json['humidity'] as int?,
    );
  }
  final String? hour;
  final int? temp;
  final int? humidity;

  @override
  List<Object?> get props => [hour, temp, humidity];

  DataModel copyWith({
    String? hour,
    int? temp,
    int? humidity,
  }) {
    return DataModel(
      hour: hour ?? this.hour,
      temp: temp ?? this.temp,
      humidity: humidity ?? this.humidity,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'hour': hour,
      'temp': temp,
      'humidity': humidity,
    };
  }
} */
