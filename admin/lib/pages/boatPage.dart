import 'package:admin/controllers/boatsController.dart';
import 'package:admin/models/boatModel.dart';
import 'package:admin/widgets/boatWidgets.dart';
import 'package:admin/widgets/mainBody.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BoatPage extends GetView<BoatsController> {
  final String id = Get.parameters['id']!;

  @override
  Widget build(BuildContext context) {
    return MainBody(
      title: "صفحة القارب",
      child: FutureBuilder<DocumentSnapshot<Boat>>(
        future: controller.getBoat(id),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          return BoatInfo(snapshot.data!.data()!, controller);
        },
      ),
    );
  }
}
