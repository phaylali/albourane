import 'package:admin/login.dart';
import 'package:admin/auth.dart';
//import 'package:admin/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends ConsumerWidget {
  final String x = FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
                child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("لوحة التحكم",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headline6),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FutureBuilder<DocumentSnapshot>(
                            future: getDoc(x),
                            builder: (BuildContext context, snapshot) {
                              if (snapshot.hasData) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else {
                                  DocumentSnapshot? item = snapshot.data;
                                  return Center(
                                      // here only return is missing
                                      child: Text(
                                    "مرحبا ${item!['name']}",
                                  ));
                                }
                              } else if (snapshot.hasError) {
                                Text('no data');
                              }
                              return CircularProgressIndicator();
                            },
                          ),
                        )
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
                          child: Icon(Feather.log_out),
                          onPressed: () async {
                            Get.to(GotToHome());
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
            SliverToBoxAdapter(
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Center(
                      child: Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        children: [
                          SizedBox(
                            width: 300,
                            height: 300,
                            child: OutlinedButton(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Feather.paperclip),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'الوثائق',
                                    textScaleFactor: 2,
                                  )
                                ],
                              ),
                              onPressed: () {
                                Get.toNamed('/Documents');
                              },
                              style: ButtonStyle(
                                  shape:
                                      MaterialStateProperty.all<OutlinedBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30)))),
                            ),
                          ),
                          SizedBox(
                            width: 300,
                            height: 300,
                            child: OutlinedButton(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Feather.navigation),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'القوارب',
                                    textScaleFactor: 2,
                                  )
                                ],
                              ),
                              onPressed: () {
                                Get.toNamed('/Boats');
                              },
                              style: ButtonStyle(
                                  shape:
                                      MaterialStateProperty.all<OutlinedBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30)))),
                            ),
                          ),
                          SizedBox(
                            width: 300,
                            height: 300,
                            child: OutlinedButton(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Feather.log_out),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'البحارة',
                                    textScaleFactor: 2,
                                  )
                                ],
                              ),
                              style: ButtonStyle(
                                  shape:
                                      MaterialStateProperty.all<OutlinedBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30)))),
                              onPressed: () {
                                Get.toNamed('/Seamen');
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}

class GotToHome extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _auth = watch(authServicesProvider);
    return FutureBuilder(
      future: _auth.signout(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text("Something Went wrong"),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return AdminSignIn();
        }
        //loading
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
