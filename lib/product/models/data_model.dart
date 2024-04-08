import 'package:equatable/equatable.dart';

class DataModel extends Equatable {
  const DataModel({
    this.hour,
    this.temp,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      hour: json['hour'] as String?,
      temp: json['temp'] as String?,
    );
  }
  final String? hour;
  final String? temp;

  @override
  List<Object?> get props => [hour, temp];

  DataModel copyWith({
    String? hour,
    String? temp,
  }) {
    return DataModel(
      hour: hour ?? this.hour,
      temp: temp ?? this.temp,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'hour': hour,
      'temp': temp,
    };
  }
}
