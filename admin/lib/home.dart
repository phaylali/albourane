import 'package:admin/auth.dart';
import 'package:admin/header.dart';
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
    return MainBody(
      title: "لوحة التحكم",
      subtitle: FutureBuilder<DocumentSnapshot>(
        future: getDoc(x),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.connectionState == ConnectionState.waiting) {
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
      child: Center(
        child: SingleChildScrollView(
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
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)))),
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
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)))),
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
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)))),
                  onPressed: () {
                    Get.toNamed('/Seamen');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
