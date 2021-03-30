import 'package:admin/header.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class NewDocument extends StatelessWidget {
  final FirebaseFirestore firestoro = FirebaseFirestore.instance;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController attachmentController = TextEditingController();
  final TextEditingController idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MainBody(
      title: "وثيقة جديدة",
      subtitle: Text("أدخل معلومات الوثيقة الجديدة"),
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(Feather.save),
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
                  child: Flex(
                    direction: Axis.horizontal,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Flex(
                          direction: Axis.vertical,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              maxLines: 3,
                              controller: nameController,
                              decoration: InputDecoration(
                                hintText: 'Name',
                                suffixIcon: Icon(Feather.edit),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              maxLines: 3,
                              controller: attachmentController,
                              decoration: InputDecoration(
                                hintText: 'Attachment Link',
                                suffixIcon: Icon(Feather.file),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
