import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_icons/flutter_icons.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:get/get.dart';

//import 'package:omniverse/error404.dart';

class NewDocument extends StatelessWidget {
  //final fC = Get.put(DocumentsController());
  NewDocument({required this.title, required this.subtitle});
  final String title;
  final String subtitle;
  final FirebaseFirestore firestoro = FirebaseFirestore.instance;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController attachmentController = TextEditingController();
  final TextEditingController idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                                title,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                subtitle,
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
                            child: ElevatedButton(
                              child: Icon(Feather.user),
                              onPressed: () {
                                Get.toNamed('/profile');
                              },
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 40,
                            width: 60,
                            child: ElevatedButton(
                              child: Icon(Feather.shopping_cart),
                              onPressed: () {
                                Get.toNamed('/cart');
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
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
                            Expanded(
                              child: FutureBuilder<QuerySnapshot>(
                                  future:
                                      firestoro.collection('documents').get(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasError) {
                                      return Text("Something went wrong");
                                    }
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      QuerySnapshot? d = snapshot.data;

                                      if (d!.docs.isNotEmpty) {
                                        int h = d.docs.length + 1;

                                        return TextFormField(
                                          readOnly: true,
                                          maxLines: 1,
                                          initialValue: "DOC" +
                                              h
                                                  .toString()
                                                  .padLeft(3, '0')
                                                  .toString(),
                                          //h.toString(),
                                          controller: idController,
                                          //keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            //hintText: 'Number',
                                            suffixIcon: Icon(Feather.file),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                          ),
                                        );
                                      }
                                    }

                                    return SafeArea(
                                      child: Scaffold(
                                        body: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Center(
                                              child:
                                                  CircularProgressIndicator()),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                            /*FutureBuilder<QuerySnapshot>(
                                future: firestoro.collection('documents').get(),
                                builder: (context, snapshot) {
                                  QuerySnapshot? d = snapshot.data;
                                  if (snapshot.connectionState ==
                                          ConnectionState.done &&
                                      d != null) {
                                    int h = d.docs.length + 1;
                                    return TextFormField(
                                      readOnly: true,
                                      maxLines: 1,
                                      initialValue: "hy",
                                      //h.toString(),
                                      //controller: attachmentController,
                                      //keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        //hintText: 'Number',
                                        suffixIcon: Icon(Feather.file),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                      ),
                                    );
                                  } else {
                                    return TextFormField(
                                      readOnly: true,
                                      maxLines: 1,
                                      initialValue:
                                          "Something wrong, i can feel it",
                                      //controller: attachmentController,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        //hintText: 'Number',
                                        suffixIcon: Icon(Feather.file),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                      ),
                                    );
                                  }
                                }),*/
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
