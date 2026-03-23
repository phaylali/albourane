import 'package:admin/controllers/boats_controller.dart';
import 'package:admin/models/boat_model.dart';
import 'package:admin/widgets/boat_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BoatPage extends GetView<BoatsController> {
  final String id = Get.parameters['id']!;

  BoatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot<Boat>>(
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
    );
  }
}
