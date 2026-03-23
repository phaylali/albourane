import 'package:admin/controllers/marins_controller.dart';
import 'package:admin/models/marin_model.dart';
import 'package:admin/widgets/marin_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MarinPage extends GetView<MarinsController> {
  final String id = Get.parameters['id']!;

  MarinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot<Marin>>(
      future: controller.getMarin(id),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        }

        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        return MarinInfo(snapshot.data!.data()!, controller);
      },
    );
  }
}
