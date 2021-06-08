import 'package:admin/controllers/boatsController.dart';
import 'package:admin/models/boatModel.dart';
import 'package:admin/resources/icons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BoatInfo extends StatelessWidget {
  BoatInfo(this.boat, this.controller);

  final Boat boat;
  final BoatsController controller;

  @override
  Widget build(BuildContext context) {
    return Wrap(
        alignment: WrapAlignment.spaceEvenly,
        spacing: 20,
        runSpacing: 20,
        children: [
          SizedBox(
            width: 300,
            height: 300,
            child: OutlinedButton(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    child: Text(
                      'الصورة',
                      textAlign: TextAlign.center,
                    ),
                    height: 20,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                      child: boat.boatImage.isNotEmpty
                          ? Image.network(boat.boatImage)
                          : OmniIcons().boat),
                ],
              ),
              onPressed: () {
                Get.defaultDialog(
                    title: 'كبر الصورة',
                    content: InteractiveViewer(
                      child: Row(
                        children: [
                          Expanded(
                              child: Image.network(
                            boat.boatImage,
                            width: context.width * 9 / 10,
                            height: context.height * 7 / 10,
                          )),
                        ],
                      ),
                    ));
              },
            ),
          ),
          SizedBox(
            width: 300,
            height: 300,
            child: OutlinedButton(
              child: ListView(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    child: Text(
                      'المعلومات',
                      textAlign: TextAlign.center,
                    ),
                    height: 20,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                      trailing: SizedBox(
                        width: 80,
                        child: Text(
                          "الاسم",
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                      title: Center(
                        child: Text(
                          boat.boatName.isNotEmpty ? boat.boatName : "لايوجد",
                          maxLines: 3,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      onTap: () {
                        controller.getListTile(
                            boat.boatName, "تم نسخ اسم القارب");
                      }),
                  ListTile(
                      trailing: SizedBox(
                        width: 80,
                        child: Text(
                          "اللوحة",
                          textDirection: TextDirection.rtl,
                        ),
                      ),
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
                      trailing: SizedBox(
                        width: 80,
                        child: Text(
                          "المنطقة",
                          textDirection: TextDirection.rtl,
                        ),
                      ),
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
                      trailing: SizedBox(
                        width: 80,
                        child: Text(
                          "المالك",
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                      title: Center(
                        child: Text(
                          boat.boatOwner.isNotEmpty ? boat.boatOwner : "لايوجد",
                          maxLines: 3,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      onTap: () {
                        controller.getListTile(
                            boat.boatOwner, "تم نسخ اسم المالك");
                      }),
                  ListTile(
                      trailing: SizedBox(
                        width: 80,
                        child: Text(
                          "بطاقته",
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                      title: Center(
                        child: Text(
                          boat.boatOwnerCni.isNotEmpty
                              ? boat.boatOwnerCni
                              : "لايوجد",
                          maxLines: 3,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      onTap: () {
                        controller.getListTile(
                            boat.boatOwnerCni, "تم نسخ بطاقة المالك");
                      }),
                ],
              ),
              onPressed: null,
            ),
          ),
          SizedBox(
            width: 300,
            height: 300,
            child: OutlinedButton(
                onPressed: null,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      child: Text(
                        'المداخيل',
                        textAlign: TextAlign.center,
                      ),
                      height: 20,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: FutureBuilder<QuerySnapshot>(
                          future: controller.getBoatRevenue(
                              boat.boatReference.replaceAll('/', '-')),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Center(
                                child: Text(snapshot.error.toString()),
                              );
                            }

                            if (!snapshot.hasData) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                            return ListView.builder(
                                itemCount: snapshot.data!.size,
                                itemBuilder: (context, index) {
                                  final month = snapshot.data!.docs[index].id;
                                  final id =
                                      boat.boatReference.replaceAll('/', '-');
                                  return Center(
                                    child: ListTile(
                                      title: Text(
                                        month,
                                        textAlign: TextAlign.center,
                                      ),
                                      onTap: () {
                                        Get.toNamed(
                                          "/Declaration?id=$id&m=$month",
                                        );
                                      },
                                    ),
                                  );
                                });
                          }),
                    ),
                  ],
                )),
          ),
          SizedBox(
            width: 300,
            height: 300,
            child: OutlinedButton(
              onPressed: null,
              child: ListView(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    child: Text(
                      'اجراءات',
                      textAlign: TextAlign.center,
                    ),
                    height: 20,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    leading: SizedBox(
                      height: 40,
                      width: 60,
                      child: Row(
                        children: [
                          SizedBox(
                              height: 40,
                              width: 40,
                              child: OmniIcons().document),
                          Center(
                              child: SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: OmniIcons().plus)),
                        ],
                      ),
                    ),
                    title: Text('تصريح جديد'),
                    onTap: () {
                      final id = boat.boatReference.replaceAll('/', '-');
                      Get.toNamed('/NewDeclaration?id=$id');
                    },
                  ),
                ],
              ),
            ),
          )
        ]);
  }
}
