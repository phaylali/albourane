import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

@immutable
class Marin {
  Marin({
    required this.marinLastName,
    required this.marinFirstName,
    required this.marinReference,
    required this.marinCnss,
    required this.marinCin,
    required this.marinImage,
  });

  Marin.fromJson(Map<String, Object?> json)
      : this(
          marinLastName: json['lastName']! as String,
          marinFirstName: json['firstName']! as String,
          marinReference: json['reference']! as String,
          marinCnss: json['cnss']! as String,
          marinCin: json['cni']! as String,
          marinImage: json['image']! as String,
        );
  Map<String, Object?> toJson() {
    return {
      'lastName': marinLastName,
      'firstName': marinFirstName,
      'reference': marinReference,
      'cnss': marinCnss,
      'image': marinImage,
      'cni': marinCin
    };
  }

  final String marinImage;
  final String marinLastName;
  final String marinFirstName;
  final String marinReference;
  final String marinCnss;
  final String marinCin;
}
