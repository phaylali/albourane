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
  });

  Marin.fromJson(Map<String, Object?> json)
      : this(
          marinLastName: json['lastName']! as String,
          marinFirstName: json['firstName']! as String,
          marinReference: json['reference']! as String,
          marinCnss: json['cnss']! as String,
          marinCin: json['cni']! as String,
        );
  Map<String, Object?> toJson() {
    return {};
  }

  final String marinLastName;
  final String marinFirstName;
  final String marinReference;
  final String marinCnss;
  final String marinCin;
}
