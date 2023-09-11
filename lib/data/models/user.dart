// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class ModelUser {
  String id;
  String name;
  String phone;
  String county;
  List<dynamic> followedTraders;
  ModelUser({
    required this.id,
    required this.name,
    required this.phone,
    required this.county,
    required this.followedTraders,
  });

  ModelUser copyWith({
    String? id,
    String? name,
    String? phone,
    String? county,
    List<dynamic>? followedTraders,
  }) {
    return ModelUser(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      county: county ?? this.county,
      followedTraders: followedTraders ?? this.followedTraders,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'phone': phone,
      'county': county,
      'followedTraders': followedTraders,
    };
  }

  factory ModelUser.fromMap(Map<String, dynamic> map) {
    return ModelUser(
        id: map['id'] as String,
        name: map['name'] as String,
        phone: map['phone'] as String,
        county: map['county'] as String,
        followedTraders: List<dynamic>.from(
          (map['followedTraders'] as List<dynamic>),
        ));
  }

  String toJson() => json.encode(toMap());

  factory ModelUser.fromJson(String source) =>
      ModelUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ModelUser(id: $id, name: $name, phone: $phone, county: $county, followedTraders: $followedTraders)';
  }

  @override
  bool operator ==(covariant ModelUser other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.phone == phone &&
        other.county == county &&
        listEquals(other.followedTraders, followedTraders);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        phone.hashCode ^
        county.hashCode ^
        followedTraders.hashCode;
  }
}
