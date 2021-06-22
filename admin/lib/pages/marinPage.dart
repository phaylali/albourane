import 'package:admin/controllers/marinsController.dart';
import 'package:admin/models/marinModel.dart';
import 'package:admin/widgets/mainBody.dart';
import 'package:admin/widgets/marinWidgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MarinPage extends GetView<MarinsController> {
  final String id = Get.parameters['id']!;

  @override
  Widget build(BuildContext context) {
    return MainBody(
      title: "صفحة البحار",
      child: FutureBuilder<DocumentSnapshot<Marin>>(
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
      ),
    );
  }
}
