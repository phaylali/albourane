import 'package:admin/controllers/boatsController.dart';
import 'package:admin/controllers/declarationController.dart';
import 'package:admin/controllers/declarationInputController.dart';
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
        crossAxisAlignment: WrapCrossAlignment.center,
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
            height: 400,
            child: OutlinedButton(
              child: Column(
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
                          style: TextStyle(
                            fontSize: 20,
                          ),
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
                          style: TextStyle(
                            fontSize: 20,
                          ),
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
                        width: 90,
                        child: Text(
                          "المنطقة",
                          style: TextStyle(
                            fontSize: 20,
                          ),
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
                          style: TextStyle(
                            fontSize: 20,
                          ),
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
                          style: TextStyle(
                            fontSize: 20,
                          ),
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
                  ListTile(
                      trailing: SizedBox(
                        width: 80,
                        child: Text(
                          "هاتفه",
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      title: Center(
                        child: Text(
                          boat.boatOwnerPhone.isNotEmpty
                              ? boat.boatOwnerPhone
                              : "لايوجد",
                          maxLines: 3,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      onTap: () {
                        controller.getListTile(
                            boat.boatOwnerPhone, "تم نسخ هاتف المالك");
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
                          future: controller.getBoatRevenue(boat.url),
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
                                  final id = boat.url;
                                  return Center(
                                    child: ListTile(
                                      title: Text(
                                        month,
                                        textAlign: TextAlign.center,
                                      ),
                                      onTap: () async {
                                        Get.defaultDialog(
                                          title:
                                              'هل تريد تصحيح التقرير ام انتاجه؟',
                                          textConfirm: 'انتاج',
                                          middleText: '$id : $month',
                                          onConfirm: () async {
                                            await Get.delete<
                                                DeclarationController>();
                                            Get.toNamed(
                                              "/Declaration?id=$id&m=$month",
                                            );
                                          },
                                          actions: [
                                            OutlinedButton(
                                                onPressed: () async {
                                                  await Get.delete<
                                                      DeclarationInputController>();

                                                  controller.deleteDeclaration(
                                                      id, month);
                                                },
                                                child: Text('حذف')),
                                            OutlinedButton(
                                                onPressed: () async {
                                                  await Get.delete<
                                                      DeclarationInputController>();
                                                  Get.toNamed(
                                                    "/DeclarationEdit?id=$id&m=$month",
                                                  );
                                                },
                                                child: Text('تصحيح')),
                                          ],
                                          textCancel: 'الغاء',
                                          /* onCancel: () {
              Get.back();
            }*/
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
                      Get.toNamed('/NewDeclaration?id=${boat.url}');
                    },
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
                    title: Text('حذف القارب'),
                    onTap: () {
                      controller.deleteBoat(boat.url);
                    },
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
                    title: Text('تصحيح المعلومات'),
                    onTap: () {
                      Get.toNamed('/BoatEdit?id=${boat.url}');
                    },
                  ),
                ],
              ),
            ),
          )
        ]);
  }
}

class BoatPreview extends StatelessWidget {
  BoatPreview(this.boat, this.click);

  final Boat boat;
  final Function click;

  Widget get details {
    return OutlinedButton(
      onPressed: () {
        click();
      },
      child: ListTile(
        leading: reference,
        title: name,
        subtitle: owner,
      ),
    );
  }

  Widget get name {
    return Text(
      '${boat.boatName}',
      textScaleFactor: 1.3,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    );
  }

  Widget get reference {
    return SizedBox(
      width: 70,
      child: Center(
        child: Text(
          '${boat.boatReference}',
          textScaleFactor: 0.8,
        ),
      ),
    );
  }

  Widget get owner {
    return Text(
      '${boat.boatOwner}',
      textScaleFactor: 0.75,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: details,
      width: 300,
      height: 120,
    );
  }
}
