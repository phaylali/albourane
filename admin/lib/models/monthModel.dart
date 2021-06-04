import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

@immutable
class Month {
  Month({
    required this.bahara,
    required this.monthFinish,
    required this.monthEquipageNumber,
    required this.monthRevenue,
    required this.monthSales,
    required this.monthStart,
    required this.monthAmo,
    required this.monthAutres,
    required this.monthCarb,
    required this.monthChargesCommun,
    required this.monthCnss,
    required this.monthCoop,
    required this.monthEquipage,
    required this.monthEquipagePerc,
    required this.monthNet,
    required this.monthPatron,
    required this.monthPatronPerc,
    required this.monthPeage,
    required this.monthPie,
    required this.monthTaxeHalle,
    required this.monthTaxeRegion,
    required this.monthTotalCnss,
    required this.monthTotalGlobal,
  });

  Month.fromJson(
    Map<String, Object?> json,
  ) : this(
          bahara: json['bahara']! as List,
          monthStart: json['startDate']! as String,
          monthFinish: json['finishDate']! as String,
          monthEquipageNumber: json['equipageNumber']! as int,
          monthSales: json['sales']! as int,
          monthRevenue: json['revenue']! as num,
          monthCnss: json['cnss']! as num,
          monthAmo: json['amo']! as num,
          monthTotalCnss: json['totalCnss']! as num,
          monthTaxeHalle: json['taxeHalle']! as num,
          monthCoop: json['cooperative']! as num,
          monthPeage: json['peage']! as num,
          monthTaxeRegion: json['taxeRegion']! as num,
          monthTotalGlobal: json['totalGlobal']! as num,
          monthCarb: json['carburant']! as num,
          monthAutres: json['autres']! as num,
          monthChargesCommun: json['chargesCommun']! as num,
          monthNet: json['net']! as num,
          monthPatron: json['patron']! as num,
          monthPatronPerc: json['patronPerc']! as num,
          monthEquipage: json['equipage']! as num,
          monthEquipagePerc: json['equipagePerc']! as num,
          monthPie: json['pie']! as num,
        );
  final List bahara;
  final String monthStart;
  final String monthFinish;
  final int monthSales;
  final int monthEquipageNumber;
  final num monthRevenue;
  final num monthCnss;
  final num monthAmo;
  final num monthTotalCnss;
  final num monthTaxeHalle;
  final num monthAutres;
  final num monthPeage;
  final num monthTaxeRegion;
  final num monthCoop;
  final num monthNet;
  final num monthTotalGlobal;
  final num monthCarb;
  final num monthChargesCommun;
  final num monthPatron;
  final num monthPatronPerc;
  final num monthEquipage;
  final num monthEquipagePerc;
  final num monthPie;

  Map<String, Object?> toJson() {
    return {
      'bahara': bahara,
      'startDate': monthStart,
      'finishDate': monthFinish,
      'revenue': monthRevenue,
      'cnss': monthCnss,
      'amo': monthAmo,
      'totalCnss': monthTotalCnss,
      'taxeHalle': monthTaxeHalle,
      'cooperative': monthCoop,
      'peage': monthPeage,
      'taxeRegion': monthTaxeRegion,
      'totalGlobal': monthTotalGlobal,
      'carb': monthCarb,
      'autres': monthAutres,
      'chargesCommun': monthChargesCommun,
      'net': monthNet,
      'patron': monthPatron,
      'patronPerc': monthPatronPerc,
      'equipage': monthEquipage,
      'equipageNumber': monthEquipageNumber,
      'equipagePerc': monthEquipagePerc,
      'pie': monthPie
    };
  }
}
