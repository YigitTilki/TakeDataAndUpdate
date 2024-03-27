// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class DeviceModel extends Equatable {
  const DeviceModel({
    this.id,
    this.userId,
    this.type,
    this.createdAtByUser,
    this.deviceName,
    this.createdAtByAdmin,
    this.isActive,
  });

  factory DeviceModel.fromJson(Map<String, dynamic> json) {
    return DeviceModel(
      id: json['id'] as String?,
      userId: json['userId'] as String?,
      type: json['type'] as String?,
      createdAtByUser: json['createdAtByUser'] as String?,
      deviceName: json['deviceName'] as String?,
      createdAtByAdmin: json['createdAtByAdmin'] as String?,
      isActive: json['isActive'] as bool?,
    );
  }
  final String? id;
  final String? userId;
  final String? type;
  final String? createdAtByUser;
  final String? deviceName;
  final String? createdAtByAdmin;
  final bool? isActive;

  @override
  List<Object?> get props {
    return [
      id,
      userId,
      type,
      createdAtByUser,
      deviceName,
      createdAtByAdmin,
      isActive,
    ];
  }

  DeviceModel copyWith({
    String? id,
    String? userId,
    String? type,
    String? createdAtByUser,
    String? deviceName,
    String? createdAtByAdmin,
    bool? isActive,
  }) {
    return DeviceModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      type: type ?? this.type,
      createdAtByUser: createdAtByUser ?? this.createdAtByUser,
      deviceName: deviceName ?? this.deviceName,
      createdAtByAdmin: createdAtByAdmin ?? this.createdAtByAdmin,
      isActive: isActive ?? this.isActive,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'type': type,
      'createdAtByUser': createdAtByUser,
      'deviceName': deviceName,
      'createdAtByAdmin': createdAtByAdmin,
      'isActive': isActive,
    };
  }
}
