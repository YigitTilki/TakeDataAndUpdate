// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class NumberModel extends Equatable
    with IdModel, BaseFirebaseModel<NumberModel> {
  NumberModel({
    this.number,
  });

  final String? number;
  @override
  final String? id = '';

  NumberModel copyWith({
    String? number,
  }) {
    return NumberModel(
      number: number ?? this.number,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'number': number,
    };
  }

  @override
  NumberModel fromJson(Map<String, dynamic> json) {
    return NumberModel(
      number: json['number'] as String?,
    );
  }

  @override
  List<Object?> get props => [number];
}

abstract mixin class IdModel {
  String? get id;
}

abstract mixin class BaseFirebaseModel<T extends IdModel> {
  T fromJson(Map<String, dynamic> json);

  T fromFirebase(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final value = snapshot.data();
    if (value == null) {
      throw Exception('error here');
    }
    // fixme
    value.addEntries([MapEntry('id', snapshot.id)]);
    return fromJson(value);
  }
}
