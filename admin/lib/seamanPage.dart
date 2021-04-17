import 'package:admin/boatPage.dart';
import 'package:admin/header.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<DocumentSnapshot> getSeamanDoc(x) async {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  return await _firestore.collection('seamen').doc(x).get();
}

class SeamanPage extends StatelessWidget {
  final String id = Get.parameters['id']!;
  @override
  Widget build(BuildContext context) {
    return MainBody(
      title: "صفحة البحار",
      subtitle: FutureBuilder<DocumentSnapshot>(
        future: getSeamanDoc(id),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              DocumentSnapshot? item = snapshot.data;
              return Center(
                  child: Text(
                "${item!['reference']}",
              ));
            }
          } else if (snapshot.hasError) {
            Text('no data');
          }
          return CircularProgressIndicator();
        },
      ),
      child: FutureBuilder<DocumentSnapshot>(
          future: getSeamanDoc(id),
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
                                  child: SeamanInfo(data: data),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Expanded(child: ImageOfSeaman(data: data)),
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
                                  child: SeamanInfo(data: data),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Expanded(child: ImageOfSeaman(data: data)),
                              ],
                            ))
                          ],
                        ),
                        desktop: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: SeamanInfo(data: data),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(child: ImageOfSeaman(data: data)),
                          ],
                        )),
                  ),
                );
              } else {
                return Center(
                  child: Text("لا يوجد بحار في هذا الرابط"),
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

class ImageOfSeaman extends StatelessWidget {
  const ImageOfSeaman({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Map<String?, dynamic>? data;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () => Get.defaultDialog(
            title: 'كبر الصورة',
            content: Expanded(
              child: InteractiveViewer(
                child: Center(child: Image.network('${data!['image']}')),
              ),
            )),
        style: ButtonStyle(
            shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)))),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(child: Image.network('${data!['image']}')),
        ));
  }
}

class SeamanInfo extends StatelessWidget {
  const SeamanInfo({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Map<String?, dynamic>? data;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            ListTileInfo(
              data: data,
              title: '${data!['name']}',
              trailing: "الاسم",
              message: "تم نسخ اسم البحار",
            ),
            ListTileInfo(
              data: data,
              title: '${data!['reference']}',
              trailing: "الرقم",
              message: "تم نسخ الرقم البحري للبحار",
            ),
            ListTileInfo(
              data: data,
              title: '${data!['cin']}',
              trailing: "البطاقة",
              message: "تم نسخ بطاقة البحار",
            ),
            ListTileInfo(
              data: data,
              title: '${data!['cnss']}',
              trailing: "الضمان",
              message: "تم نسخ  رقم الضمان الاجتماعي للبحار",
            ),
            ListTileInfo(
              data: data,
              title: '${data!['phone']}',
              trailing: "الهاتف",
              message: "تم نسخ هاتف البحار",
            ),
          ],
        ),
      ),
    );
  }
}
