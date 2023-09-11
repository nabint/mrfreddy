// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class ModelTrader {
  String id;
  String name;
  String location;
  int followerCount;
  String imgUrl;
  List<dynamic> business;
  List<dynamic> warnings;

  ModelTrader({
    required this.id,
    required this.name,
    required this.location,
    required this.followerCount,
    required this.imgUrl,
    required this.business,
    required this.warnings,
  });

  ModelTrader copyWith({
    String? id,
    String? name,
    String? location,
    int? followerCount,
    String? imgUrl,
    List<dynamic>? business,
    List<dynamic>? warnings,
  }) {
    return ModelTrader(
      id: id ?? this.id,
      name: name ?? this.name,
      location: location ?? this.location,
      followerCount: followerCount ?? this.followerCount,
      imgUrl: imgUrl ?? this.imgUrl,
      business: business ?? this.business,
      warnings: warnings ?? this.warnings,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'location': location,
      'followerCount': followerCount,
      'imgUrl': imgUrl,
      'business': business,
      'warnings': warnings,
    };
  }

  factory ModelTrader.fromMap(Map<String, dynamic> map) {
    return ModelTrader(
      id: map['id'] as String,
      name: map['name'] as String,
      location: map['location'] as String,
      followerCount: map['followerCount'] as int,
      imgUrl: map['imgUrl'] as String,
      business: List<dynamic>.from((map['business'] as List<dynamic>)),
      warnings: List<dynamic>.from((map['warnings'] as List<dynamic>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelTrader.fromJson(String source) =>
      ModelTrader.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ModelTrader(id: $id, name: $name, location: $location, followerCount: $followerCount, imgUrl: $imgUrl, business: $business, warnings: $warnings)';
  }

  @override
  bool operator ==(covariant ModelTrader other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.location == location &&
      other.followerCount == followerCount &&
      other.imgUrl == imgUrl &&
      listEquals(other.business, business) &&
      listEquals(other.warnings, warnings);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      location.hashCode ^
      followerCount.hashCode ^
      imgUrl.hashCode ^
      business.hashCode ^
      warnings.hashCode;
  }
}
