import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

@immutable
class MarinMonth {
  MarinMonth({
    required this.boatReference,
    required this.marinPie,
  });

  MarinMonth.fromJson(
    Map<String, Object?> json,
  ) : this(
          marinPie: json['pie']! as num,
          boatReference: json['boatID']! as String,
        );

  final num marinPie;
  final String boatReference;

  Map<String, Object?> toJson() {
    return {
      'pie': marinPie,
      'boatID': boatReference,
    };
  }
}
