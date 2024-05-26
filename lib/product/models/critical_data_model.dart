import 'package:equatable/equatable.dart';

class CriticalModel with EquatableMixin {
  CriticalModel({
    this.id,
    this.deviceId,
    this.temperature,
    this.humidity,
  });

  factory CriticalModel.fromJson(Map<String, dynamic> json) {
    return CriticalModel(
      id: json['id'] as String?,
      deviceId: json['deviceId'] as String?,
      temperature: json['temperature'] as double?,
      humidity: json['humidity'] as int?,
    );
  }
  final String? id;
  final String? deviceId;
  final double? temperature;
  final int? humidity;

  @override
  List<Object?> get props => [id, deviceId, temperature, humidity];

  CriticalModel copyWith({
    String? id,
    String? deviceId,
    double? temperature,
    int? humidity,
  }) {
    return CriticalModel(
      id: id ?? this.id,
      deviceId: deviceId ?? this.deviceId,
      temperature: temperature ?? this.temperature,
      humidity: humidity ?? this.humidity,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'deviceId': deviceId,
      'temperature': temperature,
      'humidity': humidity,
    };
  }
}
