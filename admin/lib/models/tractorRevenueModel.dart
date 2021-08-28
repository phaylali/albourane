import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

@immutable
class TractorRevenue {
  TractorRevenue({
    required this.boatReference,
    required this.price,
    required this.date,
    required this.ticketReference,
    required this.boatName,
  });

  TractorRevenue.fromJson(
    Map<String, Object?> json,
  ) : this(
          price: json['price']! as num,
          boatReference: json['boatID']! as String,
          date: json['date']! as String,
          ticketReference: json['ticket']! as String,
          boatName: json['boatID']! as String,
        );

  final num price;
  final String boatReference;
  final String boatName;
  final String ticketReference;
  final String date;

  Map<String, Object?> toJson() {
    return {
      'price': price,
      'boatID': boatReference,
      'boatName': boatName,
      'ticket': ticketReference,
      'date': date,
    };
  }
}
