import 'package:admin/header.dart';
import 'package:admin/icons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewBoat extends StatelessWidget {
  final FirebaseFirestore firestoro = FirebaseFirestore.instance;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController refController = TextEditingController();
  final TextEditingController attachmentController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController respController = TextEditingController();
  final TextEditingController respIdController = TextEditingController();
  final TextEditingController regionController = TextEditingController();
  final TextEditingController wrt1Controller = TextEditingController();
  final TextEditingController wrt1IdController = TextEditingController();
  final TextEditingController wrt2Controller = TextEditingController();
  final TextEditingController wrt2IdController = TextEditingController();
  final TextEditingController wrt3Controller = TextEditingController();
  final TextEditingController wrt3IdController = TextEditingController();
  final TextEditingController wrt4Controller = TextEditingController();
  final TextEditingController wrt4IdController = TextEditingController();
  final TextEditingController wrt5Controller = TextEditingController();
  final TextEditingController wrt5IdController = TextEditingController();
  final TextEditingController wrt6Controller = TextEditingController();
  final TextEditingController wrt6IdController = TextEditingController();
  final TextEditingController wrt7Controller = TextEditingController();
  final TextEditingController wrt7IdController = TextEditingController();
  final TextEditingController wrt8Controller = TextEditingController();
  final TextEditingController wrt8IdController = TextEditingController();
  final TextEditingController wrt9Controller = TextEditingController();
  final TextEditingController wrt9IdController = TextEditingController();
  final TextEditingController wrt10Controller = TextEditingController();
  final TextEditingController wrt10IdController = TextEditingController();
  final TextEditingController wrt11Controller = TextEditingController();
  final TextEditingController wrt11IdController = TextEditingController();
  final TextEditingController wrt12Controller = TextEditingController();
  final TextEditingController wrt12IdController = TextEditingController();
  final TextEditingController wrt13Controller = TextEditingController();
  final TextEditingController wrt13IdController = TextEditingController();
  final TextEditingController wrt14Controller = TextEditingController();
  final TextEditingController wrt14IdController = TextEditingController();
  final TextEditingController wrt15Controller = TextEditingController();
  final TextEditingController wrt15IdController = TextEditingController();
  final TextEditingController wrt16Controller = TextEditingController();
  final TextEditingController wrt16IdController = TextEditingController();
  final TextEditingController wrt17Controller = TextEditingController();
  final TextEditingController wrt17IdController = TextEditingController();
  final TextEditingController wrt18Controller = TextEditingController();
  final TextEditingController wrt18IdController = TextEditingController();
  final TextEditingController wrt19Controller = TextEditingController();
  final TextEditingController wrt19IdController = TextEditingController();
  final TextEditingController wrt20Controller = TextEditingController();
  final TextEditingController wrt20IdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MainBody(
      title: "قارب جديد",
      subtitle: Text("أدخل معلومات القارب الجديد"),
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          label: SizedBox(height: 40, width: 40, child: OmniIcons().save),
          onPressed: () {
            if (!attachmentController.text.isURL) {
              Get.snackbar("", "",
                  titleText: Text(
                    "خطأ رابط الصورة",
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                  ),
                  messageText: Text(
                    "الرابط فارغ او ليس برابط",
                    textScaleFactor: 0.7,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                  ));
            } else if (nameController.text.isEmpty ||
                nameController.text.isNumericOnly) {
              Get.snackbar("", "",
                  titleText: Text(
                    "خطأ في الاسم",
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                  ),
                  messageText: Text(
                    "الاسم فارغ او عدد فقط",
                    textScaleFactor: 0.7,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                  ));
            } else if (refController.text.isEmpty ||
                !refController.text.contains(RegExp(r'[0-9]')) ||
                refController.text.contains(RegExp(r'[A-Z]')) ||
                refController.text.contains(RegExp(r'[a-z]')) ||
                !refController.text.contains('/') ||
                !refController.text.contains('-')) {
              Get.snackbar("", "",
                  titleText: Text(
                    "خطأ في رقم اللوحة",
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                  ),
                  messageText: Text(
                    "رقم اللوحة فارغ او غير صحيح، المرجو كتابته على شكل 1200-3/1",
                    textScaleFactor: 0.7,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                  ));
            } else if (respController.text.isEmpty ||
                respController.text.isNumericOnly ||
                respController.text.contains(RegExp(r'[0-9]'))) {
              Get.snackbar("", "",
                  titleText: Text(
                    "خطأ في اسم المسؤول",
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                  ),
                  messageText: Text(
                    "اسم المسؤول فارغ او غير صحيح",
                    textScaleFactor: 0.7,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                  ));
            } else if (respIdController.text.isEmpty ||
                respIdController.text.isNumericOnly) {
              Get.snackbar("", "",
                  titleText: Text(
                    "خطأ في رقم البطاقة الوطنية",
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                  ),
                  messageText: Text(
                    "رقم البطاقة الوطنية للمسؤول فارغ او غير صحيح",
                    textScaleFactor: 0.7,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                  ));
            } else if (regionController.text.isEmpty ||
                regionController.text.contains(RegExp(r'[0-9]'))) {
              Get.snackbar("Error", "Region is empty or Invalid",
                  titleText: Text(
                    "خطأ في المنطقة",
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                  ),
                  messageText: Text(
                    "اسم المنطقة فارغ او غير صحيح",
                    textScaleFactor: 0.7,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                  ));
            } else if (firestoro
                .collection('boats')
                .doc(refController.text.replaceAll('/', '-'))
                .id
                .isNotEmpty) {
              Get.snackbar(
                "ERROR",
                "Boat already exists",
                backgroundColor: Colors.red,
              );
            } else {
              Get.snackbar(
                "69420",
                "Nice",
                backgroundColor: Colors.green,
              );
              firestoro
                  .collection('boats')
                  .doc(refController.text.replaceAll('/', '-'))
                  .set({
                    'name': nameController.text.toUpperCase(),
                    'reference': refController.text,
                    'image': attachmentController.text,
                    'owner': respController.text.toUpperCase(),
                    'ownerCIN': respController.text.toUpperCase(),
                    'region': regionController.text.toUpperCase(),
                    wrt1Controller.text.isNotEmpty
                        ? 'warit1'
                        : wrt1Controller.text.toUpperCase(): null,
                    wrt1IdController.text.isNotEmpty
                        ? 'warit1ID'
                        : wrt1IdController.text.toUpperCase(): null,
                    wrt2Controller.text.isNotEmpty
                        ? 'warit2'
                        : wrt2Controller.text.toUpperCase(): null,
                    wrt2IdController.text.isNotEmpty
                        ? 'warit2ID'
                        : wrt2IdController.text.toUpperCase(): null,
                    wrt3Controller.text.isNotEmpty
                        ? 'warit3'
                        : wrt3Controller.text.toUpperCase(): null,
                    wrt3IdController.text.isNotEmpty
                        ? 'warit3ID'
                        : wrt3IdController.text.toUpperCase(): null,
                    wrt4Controller.text.isNotEmpty
                        ? 'warit4'
                        : wrt4Controller.text.toUpperCase(): null,
                    wrt4IdController.text.isNotEmpty
                        ? 'warit4ID'
                        : wrt4IdController.text.toUpperCase(): null,
                    wrt5Controller.text.isNotEmpty
                        ? 'warit5'
                        : wrt5Controller.text.toUpperCase(): null,
                    wrt5IdController.text.isNotEmpty
                        ? 'warit5ID'
                        : wrt5IdController.text.toUpperCase(): null,
                    wrt6Controller.text.isNotEmpty
                        ? 'warit6'
                        : wrt6Controller.text.toUpperCase(): null,
                    wrt6IdController.text.isNotEmpty
                        ? 'warit6ID'
                        : wrt6IdController.text.toUpperCase(): null,
                    wrt7Controller.text.isNotEmpty
                        ? 'warit7'
                        : wrt7Controller.text.toUpperCase(): null,
                    wrt7IdController.text.isNotEmpty
                        ? 'warit7ID'
                        : wrt7IdController.text.toUpperCase(): null,
                    wrt8Controller.text.isNotEmpty
                        ? 'warit8'
                        : wrt8Controller.text.toUpperCase(): null,
                    wrt8IdController.text.isNotEmpty
                        ? 'warit8ID'
                        : wrt8IdController.text.toUpperCase(): null,
                    wrt9Controller.text.isNotEmpty
                        ? 'warit9'
                        : wrt9Controller.text.toUpperCase(): null,
                    wrt9IdController.text.isNotEmpty
                        ? 'warit9ID'
                        : wrt9IdController.text.toUpperCase(): null,
                    wrt10Controller.text.isNotEmpty
                        ? 'warit10'
                        : wrt10Controller.text.toUpperCase(): null,
                    wrt10IdController.text.isNotEmpty
                        ? 'warit10ID'
                        : wrt10IdController.text.toUpperCase(): null,
                    wrt11Controller.text.isNotEmpty
                        ? 'warit11'
                        : wrt11Controller.text.toUpperCase(): null,
                    wrt11IdController.text.isNotEmpty
                        ? 'warit11ID'
                        : wrt11IdController.text.toUpperCase(): null,
                    wrt12Controller.text.isNotEmpty
                        ? 'warit12'
                        : wrt12Controller.text.toUpperCase(): null,
                    wrt12IdController.text.isNotEmpty
                        ? 'warit12ID'
                        : wrt12IdController.text.toUpperCase(): null,
                    wrt13Controller.text.isNotEmpty
                        ? 'warit13'
                        : wrt13Controller.text.toUpperCase(): null,
                    wrt13IdController.text.isNotEmpty
                        ? 'warit13ID'
                        : wrt13IdController.text.toUpperCase(): null,
                    wrt14Controller.text.isNotEmpty
                        ? 'warit14'
                        : wrt14Controller.text.toUpperCase(): null,
                    wrt14IdController.text.isNotEmpty
                        ? 'warit14ID'
                        : wrt14IdController.text.toUpperCase(): null,
                    wrt15Controller.text.isNotEmpty
                        ? 'warit15'
                        : wrt15Controller.text.toUpperCase(): null,
                    wrt15IdController.text.isNotEmpty
                        ? 'warit15ID'
                        : wrt15IdController.text.toUpperCase(): null,
                    wrt16Controller.text.isNotEmpty
                        ? 'warit16'
                        : wrt16Controller.text.toUpperCase(): null,
                    wrt16IdController.text.isNotEmpty
                        ? 'warit16ID'
                        : wrt16IdController.text.toUpperCase(): null,
                    wrt17Controller.text.isNotEmpty
                        ? 'warit17'
                        : wrt17Controller.text.toUpperCase(): null,
                    wrt17IdController.text.isNotEmpty
                        ? 'warit17ID'
                        : wrt17IdController.text.toUpperCase(): null,
                    wrt18Controller.text.isNotEmpty
                        ? 'warit18'
                        : wrt18Controller.text.toUpperCase(): null,
                    wrt18IdController.text.isNotEmpty
                        ? 'warit18ID'
                        : wrt18IdController.text.toUpperCase(): null,
                    wrt19Controller.text.isNotEmpty
                        ? 'warit19'
                        : wrt19Controller.text.toUpperCase(): null,
                    wrt19IdController.text.isNotEmpty
                        ? 'warit19ID'
                        : wrt19IdController.text.toUpperCase(): null,
                    wrt20Controller.text.isNotEmpty
                        ? 'warit20'
                        : wrt20Controller.text.toUpperCase(): null,
                    wrt20IdController.text.isNotEmpty
                        ? 'warit20ID'
                        : wrt20IdController.text.toUpperCase(): null,
                  })
                  .then((value) => print("Boat Added"))
                  .catchError((error) => print("Failed to add boat: $error"));
            }
            print("Name is:  " + nameController.text.toUpperCase());
            print("Image Link is:  " + attachmentController.text);
            print("Reference is:  " + refController.text);
            print("ID is:  " + refController.text.replaceAll('/', '-'));
            print("Owner is:  " + respController.text.toUpperCase());
            print("Owner CIN is:  " + respIdController.text.toUpperCase());
            print("Region is:  " + regionController.text.toUpperCase());
          },
        ),
        body: Center(
          child: Container(
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Flex(
                          direction: Axis.vertical,
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: ListView(
                                shrinkWrap: true,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextField(
                                    keyboardType: TextInputType.name,
                                    maxLines: 1,
                                    controller: nameController,
                                    decoration: InputDecoration(
                                      hintText: 'اسم القارب',
                                      hintTextDirection: TextDirection.rtl,
                                    ),
                                  ),
                                  TextField(
                                    maxLines: 1,
                                    keyboardType: TextInputType.number,
                                    controller: refController,
                                    decoration: InputDecoration(
                                      hintText: 'رقم اللوحة',
                                      hintTextDirection: TextDirection.rtl,
                                    ),
                                  ),
                                  TextField(
                                    keyboardType: TextInputType.name,
                                    maxLines: 1,
                                    controller: respController,
                                    decoration: InputDecoration(
                                      hintText: 'اسم المسؤول',
                                      hintTextDirection: TextDirection.rtl,
                                    ),
                                  ),
                                  TextField(
                                    keyboardType: TextInputType.name,
                                    maxLines: 1,
                                    controller: respIdController,
                                    decoration: InputDecoration(
                                      hintText: 'رقم بطاقة المسؤول',
                                      hintTextDirection: TextDirection.rtl,
                                    ),
                                  ),
                                  TextField(
                                    keyboardType: TextInputType.name,
                                    maxLines: 1,
                                    controller: regionController,
                                    decoration: InputDecoration(
                                      hintText: 'المنطقة',
                                      hintTextDirection: TextDirection.rtl,
                                    ),
                                  ),
                                  TextField(
                                    keyboardType: TextInputType.url,
                                    maxLines: 1,
                                    controller: attachmentController,
                                    decoration: InputDecoration(
                                      hintText: 'رابط الصورة',
                                      hintTextDirection: TextDirection.rtl,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ExpansionTile(
                                    collapsedBackgroundColor:
                                        Theme.of(context).secondaryHeaderColor,
                                    title: Expanded(
                                      child: Text(
                                        "لائحة المالكين",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    children: [
                                      wrt(context, "1", wrt3Controller,
                                          wrt3IdController),
                                      wrt(context, "2", wrt4Controller,
                                          wrt4IdController),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ExpansionTile(
                                    collapsedBackgroundColor:
                                        Theme.of(context).secondaryHeaderColor,
                                    title: Expanded(
                                      child: Text(
                                        "مالكون آخرون",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    children: [
                                      wrt(context, "3", wrt3Controller,
                                          wrt3IdController),
                                      wrt(context, "4", wrt4Controller,
                                          wrt4IdController),
                                      wrt(context, "5", wrt5Controller,
                                          wrt5IdController),
                                      wrt(context, "6", wrt6Controller,
                                          wrt6IdController),
                                      wrt(context, "7", wrt7Controller,
                                          wrt7IdController),
                                      wrt(context, "8", wrt8Controller,
                                          wrt8IdController),
                                      wrt(context, "9", wrt9Controller,
                                          wrt9IdController),
                                      wrt(context, "10", wrt10Controller,
                                          wrt10IdController),
                                      wrt(context, "11", wrt11Controller,
                                          wrt11IdController),
                                      wrt(context, "12", wrt12Controller,
                                          wrt12IdController),
                                      wrt(context, "13", wrt13Controller,
                                          wrt13IdController),
                                      wrt(context, "14", wrt14Controller,
                                          wrt14IdController),
                                      wrt(context, "15", wrt15Controller,
                                          wrt15IdController),
                                      wrt(context, "16", wrt16Controller,
                                          wrt16IdController),
                                      wrt(context, "17", wrt17Controller,
                                          wrt17IdController),
                                      wrt(context, "18", wrt18Controller,
                                          wrt18IdController),
                                      wrt(context, "19", wrt19Controller,
                                          wrt19IdController),
                                      wrt(context, "20", wrt20Controller,
                                          wrt20IdController),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column wrt(BuildContext context, String wrtNo, TextEditingController wrtCon,
      TextEditingController wrtIdCon) {
    return Column(children: [
      ListTile(
        title: TextField(
          keyboardType: TextInputType.name,
          maxLines: 1,
          controller: wrtCon,
          decoration: InputDecoration(
            hintText: 'اسم المالك $wrtNo ',
            hintTextDirection: TextDirection.rtl,
          ),
        ),
      ),
      ListTile(
        title: TextField(
          keyboardType: TextInputType.name,
          maxLines: 1,
          controller: wrtIdCon,
          decoration: InputDecoration(
            hintText: 'رقم بطاقة المالك $wrtNo',
            hintTextDirection: TextDirection.rtl,
          ),
        ),
      ),
    ]);
  }
}
