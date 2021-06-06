import 'package:admin/controllers/marinsController.dart';
import 'package:admin/models/marinModel.dart';
import 'package:admin/widgets/mainBody.dart';
import 'package:admin/widgets/marinWidgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MarinPage extends StatelessWidget {
  final String id = Get.parameters['id']!;

  @override
  Widget build(BuildContext context) {
    return MainBody(
      title: "صفحة القارب",
      child: GetBuilder<MarinsController>(
        init: MarinsController(),
        builder: (b) {
          return FutureBuilder<DocumentSnapshot<Marin>>(
              future: b.getMarin(id),
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
                          child: MarinInfo(snapshot.data!.data()!, b)),
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
