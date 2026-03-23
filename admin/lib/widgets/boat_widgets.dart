import 'package:admin/controllers/boats_controller.dart';
import 'package:admin/models/boat_model.dart';
import 'package:admin/resources/icons.dart';
import 'package:admin/widgets/other_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BoatInfo extends StatelessWidget {
  const BoatInfo(this.boat, this.controller, {super.key});

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
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 20,
                    child: Text(
                      'الصورة',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
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
              onPressed: null,
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 20,
                    child: Text(
                      'المعلومات',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListTile(
                      trailing: const SizedBox(
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
                      trailing: const SizedBox(
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
                      trailing: const SizedBox(
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
                      trailing: const SizedBox(
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
                      trailing: const SizedBox(
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
                      trailing: const SizedBox(
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
            ),
          ),
          SizedBox(
            width: 300,
            height: 300,
            child: OutlinedButton(
                onPressed: null,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 20,
                      child: Text(
                        'المداخيل',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
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
                                        Get.dialog(DeclarationDialog(
                                            controller: controller,
                                            id: id,
                                            month: month));
                                        /*Get.defaultDialog(
                                          title:
                                              'هل تريد تصحيح التقرير ام انتاجه؟',
                                          middleText: '$id : $month',
                                          confirm: OutlinedButton(
                                              onPressed: () async {
                                                await Get.delete<
                                                    DeclarationInputController>();

                                                controller.deleteDeclaration(
                                                    id, month);
                                              },
                                              child: Text(
                                                'انتاج',
                                              )),
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
                                        );*/
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
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 20,
                    child: Text(
                      'اجراءات',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
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
                    title: const Text('تصريح جديد'),
                    onTap: () {
                      Get.toNamed('/NewDeclaration?id=${boat.url}');
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
                    title: const Text('حذف القارب'),
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
                    title: const Text('تصحيح المعلومات'),
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
  const BoatPreview(this.boat, this.click, {super.key});

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
      boat.boatName,
      textScaler: const TextScaler.linear(1.4),
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    );
  }

  Widget get reference {
    return SizedBox(
      width: 70,
      child: Center(
        child: Text(
          boat.boatReference,
          textScaler: const TextScaler.linear(1.3),
        ),
      ),
    );
  }

  Widget get owner {
    return Text(
      boat.boatOwner,
      textScaler: const TextScaler.linear(1),
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 120,
      child: details,
    );
  }
}
