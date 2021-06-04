import 'package:admin/controllers/boatsController.dart';
import 'package:admin/models/boatModel.dart';
import 'package:admin/resources/icons.dart';
import 'package:admin/widgets/mainBody.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
                      child: BoatInfo(snapshot.data!.data()!, b),
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

class BoatInfo extends StatelessWidget {
  BoatInfo(this.boat, this.controller);

  final Boat boat;
  final BoatsController controller;
  @override
  Widget build(BuildContext context) {
    return Wrap(
        alignment: WrapAlignment.spaceEvenly,
        direction: Axis.horizontal,
        spacing: 20,
        runSpacing: 20,
        children: [
          SizedBox(
            width: 300,
            height: 300,
            child: OutlinedButton(
              child: Image.network(boat.boatImage),
              onPressed: () {
                Get.defaultDialog(
                    title: 'كبر الصورة',
                    content: InteractiveViewer(
                      child: Container(child: Image.network(boat.boatImage)),
                    ));
              },
            ),
          ),
          SizedBox(
            width: 300,
            child: OutlinedButton(
              child: Row(
                children: [
                  SizedBox(
                    width: 200,
                    child: Column(
                      children: [
                        ListTile(
                            title: Center(
                              child: Text(
                                boat.boatName.isNotEmpty
                                    ? boat.boatName
                                    : "لايوجد",
                                maxLines: 3,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            onTap: () {
                              controller.getListTile(
                                  boat.boatName, "تم نسخ اسم القارب");
                            }),
                        ListTile(
                            title: Center(
                              child: Text(
                                boat.boatReference.isNotEmpty
                                    ? boat.boatReference
                                    : "لايوجد",
                                maxLines: 3,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            onTap: () {
                              controller.getListTile(
                                  boat.boatReference, "تم نسخ لوحة القارب");
                            }),
                        ListTile(
                            title: Center(
                              child: Text(
                                boat.boatRegion.isNotEmpty
                                    ? boat.boatRegion
                                    : "لايوجد",
                                maxLines: 3,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            onTap: () {
                              controller.getListTile(
                                  boat.boatRegion, "تم نسخ المنطقة");
                            }),
                        ListTile(
                            title: Center(
                              child: Text(
                                boat.boatOwner.isNotEmpty
                                    ? boat.boatOwner
                                    : "لايوجد",
                                maxLines: 3,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            onTap: () {
                              controller.getListTile(
                                  boat.boatOwner, "تم نسخ اسم المالك");
                            }),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: Column(
                      children: [
                        Text(
                          "الاسم",
                          textDirection: TextDirection.rtl,
                        ),
                        Text(
                          "اللوحة",
                          textDirection: TextDirection.rtl,
                        ),
                        Text(
                          "المنطقة",
                          textDirection: TextDirection.rtl,
                        ),
                        Text(
                          "المالك",
                          textDirection: TextDirection.rtl,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              onPressed: null,
            ),
          ),
        ]);
  }
}
