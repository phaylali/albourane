import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_icons/flutter_icons.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:get/get.dart';

class NewBoat extends StatelessWidget {
  final FirebaseFirestore firestoro = FirebaseFirestore.instance;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController referenceController = TextEditingController();
  final TextEditingController attachmentController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController ownerController = TextEditingController();
  final TextEditingController ownerCINController = TextEditingController();
  final TextEditingController regionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Feather.save),
          onPressed: () {
            if (!attachmentController.text.isURL) {
              Get.snackbar("Error", "Image link is empty or not a link",
                  backgroundColor: Colors.red,
                  snackPosition: SnackPosition.TOP);
            } else if (nameController.text.isEmpty ||
                nameController.text.isNumericOnly) {
              Get.snackbar("Error", "Name is empty or Invalid",
                  backgroundColor: Colors.red,
                  snackPosition: SnackPosition.TOP);
            } else if (referenceController.text.isEmpty ||
                !referenceController.text.contains(RegExp(r'[0-9]')) ||
                referenceController.text.contains(RegExp(r'[A-Z]')) ||
                referenceController.text.contains(RegExp(r'[a-z]')) ||
                !referenceController.text.contains('/') ||
                !referenceController.text.contains('-')) {
              Get.snackbar("Error",
                  "Reference is empty or invalid, please type the reference like 3/1-1200",
                  backgroundColor: Colors.red,
                  snackPosition: SnackPosition.TOP);
            } else if (ownerController.text.isEmpty ||
                ownerController.text.isNumericOnly ||
                ownerController.text.contains(RegExp(r'[0-9]'))) {
              Get.snackbar("Error", "Owner Name is empty or Invalid",
                  backgroundColor: Colors.red,
                  snackPosition: SnackPosition.TOP);
            } else if (ownerCINController.text.isEmpty ||
                ownerCINController.text.isNumericOnly) {
              Get.snackbar("Error", "Owner CIN is empty or Invalid",
                  backgroundColor: Colors.red,
                  snackPosition: SnackPosition.TOP);
            } else if (regionController.text.isEmpty ||
                regionController.text.contains(RegExp(r'[0-9]'))) {
              Get.snackbar("Error", "Region is empty or Invalid",
                  backgroundColor: Colors.red,
                  snackPosition: SnackPosition.TOP);
            } else {
              Get.snackbar(
                "69420",
                "Nice",
                backgroundColor: Colors.green,
              );
              firestoro
                  .collection('boats')
                  .doc(referenceController.text.replaceAll('/', '-'))
                  .set({
                    'name': nameController.text.toUpperCase(),
                    'reference': referenceController.text,
                    'image': attachmentController.text,
                    'owner': ownerController.text.toUpperCase(),
                    'ownerCIN': ownerCINController.text.toUpperCase(),
                    'region': regionController.text.toUpperCase(),
                  })
                  .then((value) => print("Boat Added"))
                  .catchError((error) => print("Failed to add boat: $error"));
            }
            print("Name is:  " + nameController.text.toUpperCase());
            print("Image Link is:  " + attachmentController.text);
            print("Reference is:  " + referenceController.text);
            print("ID is:  " + referenceController.text.replaceAll('/', '-'));
            print("Owner is:  " + ownerController.text.toUpperCase());
            print("Owner CIN is:  " + ownerCINController.text.toUpperCase());
            print("Region is:  " + regionController.text.toUpperCase());
          },
        ),
        body: Center(
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "New Boat",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 40,
                            width: 60,
                            child: OutlinedButton(
                              child: Icon(Feather.home),
                              onPressed: () {
                                Get.toNamed('/');
                              },
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 40,
                            width: 60,
                            child: OutlinedButton(
                              child: Icon(Feather.arrow_right),
                              onPressed: () {
                                Get.back();
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: ListView(
                          //direction: Axis.horizontal,
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
                                    keyboardType: TextInputType.name,
                                    maxLines: 3,
                                    controller: nameController,
                                    decoration: InputDecoration(
                                      hintText: 'Name',
                                      suffixIcon: Icon(Feather.edit),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.url,
                                    maxLines: 3,
                                    controller: attachmentController,
                                    decoration: InputDecoration(
                                      hintText: 'Image Link',
                                      suffixIcon: Icon(Feather.file),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    maxLines: 3,
                                    keyboardType: TextInputType.number,
                                    controller: referenceController,
                                    decoration: InputDecoration(
                                      hintText: 'Reference',
                                      suffixIcon: Icon(Feather.code),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.name,
                                    maxLines: 3,
                                    controller: ownerController,
                                    decoration: InputDecoration(
                                      hintText: 'Owner Name',
                                      suffixIcon: Icon(Feather.user),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.name,
                                    maxLines: 3,
                                    controller: ownerCINController,
                                    decoration: InputDecoration(
                                      hintText: 'Owner CIN',
                                      suffixIcon: Icon(Feather.image),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.name,
                                    maxLines: 3,
                                    controller: regionController,
                                    decoration: InputDecoration(
                                      hintText: 'Region',
                                      suffixIcon: Icon(Feather.compass),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
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
