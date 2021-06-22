import 'package:admin/controllers/boatsController.dart';
import 'package:admin/models/boatModel.dart';
import 'package:admin/widgets/boatWidgets.dart';
import 'package:admin/widgets/mainBody.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Boats extends GetView<BoatsController> {
  const Boats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainBody(
        title: 'القوارب',
        child: FutureBuilder<QuerySnapshot<Boat>>(
            future: controller.getBoats(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }

              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.connectionState == ConnectionState.done)
                return Wrap(
                  alignment: WrapAlignment.spaceEvenly,
                  direction: Axis.horizontal,
                  spacing: 20,
                  runSpacing: 20,
                  children: snapshot.data!.docs
                      .map((item) => BoatPreview(item.data()))
                      .toList()
                      .cast<Widget>(),
                );
              return const Center(child: CircularProgressIndicator());
            }));
  }
}
