import 'package:admin/controllers/boatsController.dart';
import 'package:admin/models/boatModel.dart';
import 'package:admin/widgets/boatWidgets.dart';
import 'package:admin/widgets/mainBody.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BoatPage extends StatelessWidget {
  final String id = Get.parameters['id']!;

  @override
  Widget build(BuildContext context) {
    return MainBody(
      title: "صفحة القارب",
      child: GetBuilder<BoatsController>(
        init: BoatsController(),
        builder: (b) {
          return FutureBuilder<DocumentSnapshot<Boat>>(
              future: b.getBoat(id),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                }

                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                return Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                          child: BoatInfo(snapshot.data!.data()!, b)),
                    ),
                    SizedBox(
                      width: 20,
                    )
                  ],
                );
              });
        },
      ),
    );
  }
}
