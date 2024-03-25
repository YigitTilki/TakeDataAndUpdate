// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class DeviceModel extends Equatable {
  const DeviceModel({
    this.id,
    this.userId,
    this.type,
    this.createdAt,
    this.deviceName,
  });

  factory DeviceModel.fromJson(Map<String, dynamic> json) {
    return DeviceModel(
      id: json['id'] as String?,
      userId: json['userId'] as String?,
      type: json['type'] as String?,
      createdAt: json['createdAt'] as String?,
      deviceName: json['deviceName'] as String?,
    );
  }
  final String? id;
  final String? userId;
  final String? type;
  final String? createdAt;
  final String? deviceName;

  @override
  List<Object?> get props {
    return [
      id,
      userId,
      type,
      createdAt,
      deviceName,
    ];
  }

  DeviceModel copyWith({
    String? id,
    String? userId,
    String? type,
    String? createdAt,
    String? deviceName,
  }) {
    return DeviceModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
      deviceName: deviceName ?? this.deviceName,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'type': type,
      'createdAt': createdAt,
      'deviceName': deviceName,
    };
  }
}
