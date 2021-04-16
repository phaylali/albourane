import 'dart:ui';
import 'package:admin/boatPage.dart';
import 'package:admin/header.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

Future<DocumentSnapshot> getDocDoc(x) async {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  return await _firestore.collection('documents').doc(x).get();
}

class DocumentPage extends StatelessWidget {
  final String id = Get.parameters['id']!;
  @override
  Widget build(BuildContext context) {
    return MainBody(
      title: "صفحة الوثيقة",
      subtitle: FutureBuilder<DocumentSnapshot>(
        future: getDocDoc(id),
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
                "${item!.id}",
              ));
            }
          } else if (snapshot.hasError) {
            Text('no data');
          }
          return CircularProgressIndicator();
        },
      ),
      child: FutureBuilder<DocumentSnapshot>(
          future: getDocDoc(id),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text("هناك مشكل ما"));
            }
            if (snapshot.connectionState == ConnectionState.done) {
              DocumentSnapshot? d = snapshot.data;

              if (d!.exists) {
                Map<String?, dynamic>? data = d.data()!;
                return Center(
                  child: Container(
                    child: context.responsiveValue(
                        mobile: Row(
                          children: [
                            Expanded(
                                child: Column(
                              children: [
                                Expanded(
                                  child: DocumentInfo(data: data),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Expanded(child: PreviewOfDocument(data: data)),
                              ],
                            ))
                          ],
                        ),
                        tablet: Row(
                          children: [
                            Expanded(
                                child: Column(
                              children: [
                                Expanded(
                                  child: DocumentInfo(data: data),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Expanded(child: PreviewOfDocument(data: data)),
                              ],
                            ))
                          ],
                        ),
                        desktop: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: DocumentInfo(data: data),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(child: PreviewOfDocument(data: data)),
                          ],
                        )),
                  ),
                );
              } else {
                return Center(
                  child: Text("لا يوجد وثيقة في هذا الرابط"),
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
          }),
    );
  }
}

class PreviewOfDocument extends StatelessWidget {
  const PreviewOfDocument({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Map<String?, dynamic>? data;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () => Get.defaultDialog(
            title: 'كبر الصورة',
            content: Row(
              children: [
                Expanded(
                  child: InteractiveViewer(
                    child: Center(child: Image.network('${data!['preview']}')),
                  ),
                ),
              ],
            )),
        style: ButtonStyle(
            shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)))),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(child: Image.network('${data!['preview']}')),
        ));
  }
}

class DocumentInfo extends StatelessWidget {
  const DocumentInfo({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Map<String?, dynamic>? data;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListTileInfo(
            data: data,
            title: '${data!['name']}',
            trailing: "الاسم",
            message: "تم نسخ اسم الوثيقة",
          ),
          ListTileInfo(
            data: data,
            title: '${data!['date'].toDate().toString().split(" ").first}',
            trailing: "التاريخ",
            message: "تم نسخ تاريخ الوثيقة",
          ),
          ListTile(
            trailing: SizedBox(
              child: Text(
                "المرفقات",
                textDirection: TextDirection.rtl,
              ),
              width: 100,
            ),
            onTap: () {
              launch("${data!['attachment']}");
            },
            title: Text(
              "اضغط هنا",
              maxLines: 3,
              textAlign: TextAlign.center,
            ),
          ),
          ListTileInfo(
            data: data,
            title: "${data!['description']}",
            trailing: "الوصف",
            max: null,
            message: "تم نسخ وصف الوثيقة",
          ),
        ],
      ),
    );
  }
}
