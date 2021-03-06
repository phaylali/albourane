import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

@immutable
class Boat {
  Boat({
    required this.boatName,
    required this.boatReference,
    required this.boatRegion,
    required this.boatOwner,
    required this.boatCoopPerc,
    required this.boatImage,
    required this.boatOwnerCni,
    required this.boatOwnerPhone,
    required this.url,
  });

  Boat.fromJson(Map<String, Object?> json)
      : this(
            boatImage: json['image']! as String,
            boatName: json['name']! as String,
            boatOwner: json['owner']! as String,
            boatReference: json['reference']! as String,
            boatRegion: json['region']! as String,
            boatCoopPerc: json['sub']! as num,
            boatOwnerCni: json['ownerCIN']! as String,
            boatOwnerPhone: json['phone']! as String,
            url: json['url']! as String);
  Map<String, Object?> toJson() {
    return {
      'image': boatImage,
      'sub': boatCoopPerc,
      'name': boatName,
      'owner': boatOwner,
      'reference': boatReference,
      'region': boatRegion,
      'ownerCIN': boatOwnerCni,
      'phone': boatOwnerPhone,
      'url': url,
    };
  }

  final String boatImage;
  final String boatName;
  final String boatReference;
  final String boatRegion;
  final String boatOwner;
  final String boatOwnerCni;
  final num boatCoopPerc;
  final String boatOwnerPhone;
  final String url;
}
