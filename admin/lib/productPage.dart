import 'dart:ui';
import 'package:admin/error404.dart';
import 'package:admin/productsController.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String id = Get.parameters['id']!;
    final FirebaseFirestore firestoro = FirebaseFirestore.instance;
    //Get.lazyPut(() => CountController());

    return FutureBuilder<DocumentSnapshot>(
        future: firestoro.collection('products').doc(id).get(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }
          if (snapshot.connectionState == ConnectionState.done) {
            DocumentSnapshot? d = snapshot.data;

            if (d!.exists) {
              //Map<String?, dynamic>? data = d.data();
              return SafeArea(
                child: Scaffold(
                  body: Center(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: ListView(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 100,
                          child: OutlinedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                                shape:
                                    MaterialStateProperty.all<OutlinedBorder>(
                                        StadiumBorder())),
                            child: Center(
                                child: Text(
                              '${d['name']}',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            )),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        OutlinedButton(
                          onPressed: () => GetPlatform.isMobile
                              ? Get.defaultDialog(
                                  title: 'Zoom In Product',
                                  content: Expanded(
                                    child: InteractiveViewer(
                                      child: Center(
                                          child:
                                              Image.network('${d['image']}')),
                                    ),
                                  ))
                              : null,
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<OutlinedBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(30)))),
                          child: Center(child: Image.network('${d['image']}')),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 100,
                          child: OutlinedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                                shape:
                                    MaterialStateProperty.all<OutlinedBorder>(
                                        StadiumBorder())),
                            child: Center(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  '${d['oldPrice']}' + ' \$',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.lineThrough),
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'Price',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '${d['price']}' + ' \$',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'Quantity',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '${d['quantity']}' + ' Units',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                GetBuilder<CountController>(
                                  init: CountController(),
                                  builder: (_) {
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        OutlinedButton(
                                          style: ButtonStyle(
                                              shape: MaterialStateProperty.all<
                                                      OutlinedBorder>(
                                                  StadiumBorder())),
                                          onPressed: () => _.counter == 0
                                              ? null
                                              : _.increment(),
                                          child: Text(
                                            'Buy ' + "${_.counter}",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                              icon: Icon(Feather.arrow_up),
                                              onPressed: () => _.increment(),
                                            ),
                                            IconButton(
                                                icon: Icon(Feather.arrow_down),
                                                onPressed: () => _.decrement()),
                                          ],
                                        )
                                      ],
                                    );
                                  },
                                ),
                              ],
                            )),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 500,
                          child: OutlinedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                                shape:
                                    MaterialStateProperty.all<OutlinedBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30)))),
                            child: Center(
                                child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'More Details',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Type : ${d['type']}',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Video : ',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    IconButton(
                                      icon: Icon(Feather.youtube),
                                      onPressed: () {
                                        launch('${d['video']}');
                                      },
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Description : ',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Expanded(
                                  child: Text(
                                    '${d['description']}',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            )),
                          ),
                        ),
                      ],
                    ),
                  )),
                ),
              );
            } else {
              return NoProduct(
                title:
                    "There Is No Product With This ID, Or The Product Is Removed",
                subtitle: "Check The Url For Errors Or Go To The Home Page",
              );
            }
          }
          return SafeArea(
            child: Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: CircularProgressIndicator()),
              ),
            ),
          );
        });
  }
}
