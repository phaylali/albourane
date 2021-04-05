import 'package:admin/header.dart';
import 'package:admin/icons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class NewDocument extends StatelessWidget {
  final FirebaseFirestore firestoro = FirebaseFirestore.instance;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController attachmentController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MainBody(
      title: "وثيقة جديدة",
      subtitle: Text("أدخل معلومات الوثيقة الجديدة"),
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: FloatingActionButton(
          child: OmniIcons().save,
          onPressed: () {
            if (!attachmentController.text.isURL) {
              Get.snackbar("Error", "Attachment link is empty or not a link",
                  backgroundColor: Colors.red,
                  snackPosition: SnackPosition.TOP);
            } else if (nameController.text.isEmpty) {
              Get.snackbar("Error", "Name is empty",
                  backgroundColor: Colors.red,
                  snackPosition: SnackPosition.TOP);
            } else {
              Get.snackbar(
                "69420",
                "Nice",
                backgroundColor: Colors.green,
              );
            }
            print("Name is:  " + nameController.text);
            print("Link is:  " + attachmentController.text);
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
                                //direction: Axis.vertical,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  DataTable(columns: [
                                    DataColumn(label: Container()),
                                    DataColumn(label: Container()),
                                  ], rows: [
                                    DataRow(cells: [
                                      DataCell(
                                        TextField(
                                          keyboardType: TextInputType.name,
                                          maxLines: 3,
                                          controller: nameController,
                                          decoration: InputDecoration(
                                            hintText: 'اسم الوئيقة',
                                            hintTextDirection:
                                                TextDirection.rtl,
                                          ),
                                        ),
                                      ),
                                      DataCell(
                                        TextField(
                                          keyboardType: TextInputType.url,
                                          maxLines: 3,
                                          controller: attachmentController,
                                          decoration: InputDecoration(
                                            hintText: 'رابط الصورة',
                                            hintTextDirection:
                                                TextDirection.rtl,
                                          ),
                                        ),
                                      ),
                                    ]),
                                    DataRow(cells: [
                                      DataCell(
                                        TextField(
                                          keyboardType: TextInputType.name,
                                          maxLines: 3,
                                          controller: dateController,
                                          decoration: InputDecoration(
                                            hintText: 'التاريخ',
                                            hintTextDirection:
                                                TextDirection.rtl,
                                          ),
                                        ),
                                      ),
                                      DataCell(
                                        TextField(
                                          keyboardType: TextInputType.url,
                                          maxLines: 3,
                                          controller: idController,
                                          decoration: InputDecoration(
                                            hintText: 'الرقم',
                                            hintTextDirection:
                                                TextDirection.rtl,
                                          ),
                                        ),
                                      ),
                                    ]),
                                  ]),
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
}
