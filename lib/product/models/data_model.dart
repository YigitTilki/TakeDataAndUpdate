// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class DataModel extends Equatable {
  const DataModel({
    this.date,
    this.time,
    this.device_id,
    this.temp1,
    this.humidity,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      device_id: json['device_id'] as String?,
      temp1: json['temp1'] as double?,
      humidity: json['humidity'] as int?,
      date: json['date'] as String?,
      time: json['time'] as String?,
    );
  }
  final String? device_id;
  final String? date;
  final String? time;
  final double? temp1;
  final int? humidity;

  @override
  List<Object?> get props {
    return [
      device_id,
      date,
      time,
      temp1,
      humidity,
    ];
  }

  DataModel copyWith({
    String? device_id,
    String? date,
    String? time,
    double? temp1,
    int? humidity,
  }) {
    return DataModel(
      device_id: device_id ?? this.device_id,
      date: date ?? this.date,
      time: time ?? this.time,
      temp1: temp1 ?? this.temp1,
      humidity: humidity ?? this.humidity,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'device_id': device_id,
      'temp1': temp1,
      'humidity': humidity,
      'date': date,
      'time': time,
    };
  }
}
