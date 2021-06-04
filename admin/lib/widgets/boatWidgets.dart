import 'package:admin/models/boatModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

@immutable
class ListTileInfo extends StatelessWidget {
  ListTileInfo({
    Key? key,
    required this.boat,
    this.trailing,
    this.title,
    this.message,
  }) : super(key: key);

  final Boat boat;
  final String? trailing;
  final String? title;
  final String? message;
  final int? max = 1;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        trailing: SizedBox(
          child: Text(
            trailing!,
            textDirection: TextDirection.rtl,
          ),
          width: 100,
        ),
        title: Center(
          child: Text(
            boat.boatName.isNotEmpty ? title! : "لايوجد",
            maxLines: 3,
            textAlign: TextAlign.center,
          ),
        ),
        onTap: () {
          // getListTile
        });
  }
}
