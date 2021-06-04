import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

@immutable
class Boat {
  Boat(
      {required this.boatName,
      required this.boatReference,
      required this.boatRegion,
      required this.boatOwner,
      required this.boatCoopPerc,
      required this.boatImage});

  Boat.fromJson(Map<String, Object?> json)
      : this(
          boatImage: json['image']! as String,
          boatName: json['name']! as String,
          boatOwner: json['owner']! as String,
          boatReference: json['reference']! as String,
          boatRegion: json['region']! as String,
          boatCoopPerc: json['sub']! as num,
        );
  Map<String, Object?> toJson() {
    return {};
  }

  final String boatImage;
  final String boatName;
  final String boatReference;
  final String boatRegion;
  final String boatOwner;
  final num boatCoopPerc;
}
