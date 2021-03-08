import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_icons/flutter_icons.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:get/get.dart';

class NewSeaman extends StatelessWidget {
  final FirebaseFirestore firestoro = FirebaseFirestore.instance;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController referenceController = TextEditingController();
  final TextEditingController attachmentController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController cinController = TextEditingController();
  final TextEditingController cnssController = TextEditingController();
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
                !referenceController.text.contains('-')) {
              Get.snackbar("Error",
                  "Reference is empty or invalid, please type the reference like 3/1-D1200",
                  backgroundColor: Colors.red,
                  snackPosition: SnackPosition.TOP);
            } else if (phoneController.text.isEmpty ||
                !phoneController.text.isPhoneNumber) {
              Get.snackbar("Error", "Phone Number is empty or Invalid",
                  backgroundColor: Colors.red,
                  snackPosition: SnackPosition.TOP);
            } else if (cinController.text.isEmpty ||
                cinController.text.isNumericOnly) {
              Get.snackbar("Error", "Seaman's CIN is empty or Invalid",
                  backgroundColor: Colors.red,
                  snackPosition: SnackPosition.TOP);
            } else if (cnssController.text.isEmpty ||
                !cnssController.text.contains(RegExp(r'[0-9]')) ||
                !cnssController.text.length.isEqual(9)) {
              Get.snackbar("Error", "Seaman's CNSS is empty or Invalid",
                  backgroundColor: Colors.red,
                  snackPosition: SnackPosition.TOP);
            } else {
              Get.snackbar(
                "69420",
                "Nice",
                backgroundColor: Colors.green,
              );
              firestoro
                  .collection('seamen')
                  .doc(referenceController.text.replaceAll('/', '-'))
                  .set({
                    'name': nameController.text.toUpperCase().toString(),
                    'reference': referenceController.text.toString(),
                    'image': attachmentController.text.toString(),
                    'phone': phoneController.text.toUpperCase().toString(),
                    'cin': cinController.text.toUpperCase().toString(),
                    'cnss': cnssController.text.toUpperCase().toString(),
                  })
                  .then((value) => print("Boat Added"))
                  .catchError((error) => print("Failed to add boat: $error"));
            }
            print("Name is:  " + nameController.text.toUpperCase());
            print("Image Link is:  " + attachmentController.text);
            print("Reference is:  " + referenceController.text);
            print("ID is:  " + referenceController.text.replaceAll('/', '-'));
            print("Phone is:  " + phoneController.text.toUpperCase());
            print("CIN is:  " + cinController.text.toUpperCase());
            print("CNSS is:  " + cnssController.text.toUpperCase());
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
                                "New Seaman",
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
                              child: Icon(Feather.arrow_left),
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
                        child: Flex(
                          direction: Axis.vertical,
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: ListView(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .color),
                                    keyboardType: TextInputType.name,
                                    maxLines: 3,
                                    controller: nameController,
                                    decoration: InputDecoration(
                                      hintText: 'Name',
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
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .color),
                                    keyboardType: TextInputType.url,
                                    maxLines: 3,
                                    controller: attachmentController,
                                    decoration: InputDecoration(
                                      hintText: 'Image Link',
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
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .color),
                                    maxLines: 3,
                                    keyboardType: TextInputType.number,
                                    controller: referenceController,
                                    decoration: InputDecoration(
                                      hintText: 'Reference',
                                      suffixIcon: Icon(Feather.anchor),
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
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .color),
                                    keyboardType: TextInputType.phone,
                                    maxLines: 3,
                                    controller: phoneController,
                                    decoration: InputDecoration(
                                      hintText: 'Phone Number',
                                      suffixIcon: Icon(Feather.phone),
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
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .color),
                                    keyboardType: TextInputType.text,
                                    maxLines: 3,
                                    controller: cinController,
                                    decoration: InputDecoration(
                                      hintText: 'CIN',
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
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .color),
                                    keyboardType: TextInputType.number,
                                    maxLines: 3,
                                    controller: cnssController,
                                    decoration: InputDecoration(
                                      hintText: 'CNSS',
                                      suffixIcon: Icon(Feather.octagon),
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
