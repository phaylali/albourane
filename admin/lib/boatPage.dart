import 'dart:ui';
import 'package:admin/header.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Future<DocumentSnapshot> getBoatDoc(x) async {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  return await _firestore.collection('boats').doc(x).get();
}

class BoatPage extends StatelessWidget {
  final String id = Get.parameters['id']!;
  @override
  Widget build(BuildContext context) {
    return MainBody(
      title: "صفحة القارب",
      subtitle: FutureBuilder<DocumentSnapshot>(
        future: getBoatDoc(id),
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            DocumentSnapshot? d = snapshot.data;
            if (d!.exists) {
              Map<String?, dynamic>? item = d.data()!;

              return Center(
                  child: Text(
                "${item['reference']}",
              ));
            } else
              return Text("لا يوجد هذا القارب");
          } else if (snapshot.hasError) {
            return Center(child: Text("هناك مشكل ما"));
          }
          return CircularProgressIndicator();
        },
      ),
      child: FutureBuilder<DocumentSnapshot>(
          future: getBoatDoc(id),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text("هناك مشكل ما"));
            } else if (snapshot.connectionState == ConnectionState.done) {
              DocumentSnapshot? d = snapshot.data;

              if (d!.exists) {
                Map<String?, dynamic>? data = d.data()!;
                return Center(
                  child: Container(
                    child: context.responsiveValue(
                        mobile: Row(
                          children: [
                            Expanded(
                                child: ListView(
                              children: [
                                Expanded(
                                  child: BoatInfo(data: data),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Expanded(child: ImageOfBoat(data: data)),
                              ],
                            ))
                          ],
                        ),
                        tablet: Row(
                          children: [
                            Expanded(
                                child: ListView(
                              children: [
                                Expanded(
                                  child: BoatInfo(data: data),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Expanded(child: ImageOfBoat(data: data)),
                              ],
                            ))
                          ],
                        ),
                        desktop: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: BoatInfo(data: data),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(child: ImageOfBoat(data: data)),
                          ],
                        )),
                  ),
                );
              } else {
                return Center(
                  child: Text("لا يوجد قارب في هذا الرابط"),
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

class ImageOfBoat extends StatelessWidget {
  const ImageOfBoat({
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

class BoatInfo extends StatelessWidget {
  const BoatInfo({
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
            ListTileBoat(
              data: data,
              title: '${data!['name']}',
              trailing: "الاسم",
              message: "تم نسخ اسم القارب",
            ),
            ListTileBoat(
              data: data,
              title: '${data!['reference']}',
              trailing: "اللوحة",
              message: "تم نسخ رقم لوحة القارب",
            ),
            ListTileBoat(
              data: data,
              title: '${data!['region']}',
              trailing: "المنطقة",
              message: "تم نسخ المنطقة",
            ),
            ListTileBoat(
              data: data,
              title: '${data!['owner']}',
              trailing: "المسؤول",
              message: "تم نسخ اسم المسؤول",
            ),
            ListTileBoat(
              data: data,
              title: '${data!['ownerCIN']}',
              trailing: "بطاقته",
              message: "تم نسخ بطاقة المسؤول",
            ),
            ListTileBoat(
              data: data,
              title: data!['warit1'],
              trailing: "المالك 1",
              message: "تم نسخ اسم المالك رقم 1",
            ),
            ListTileBoat(
              data: data,
              title: data!['warit1ID'],
              trailing: "بطاقتة",
              message: "تم نسخ بطاقة المالك رقم 1",
            ),
            ListTileBoat(
              data: data,
              title: data!['warit2'],
              trailing: "المالك 2",
              message: "تم نسخ اسم المالك رقم 2",
            ),
            ListTileBoat(
              data: data,
              title: data!['warit2ID'],
              trailing: "بطاقته",
              message: "تم نسخ بطاقة المالك رقم 2",
            ),
            ExpansionTile(
              collapsedBackgroundColor: Theme.of(context).primaryColor,
              title: Center(
                child: Text("لائحة الورثة",
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                    style: Theme.of(context).textTheme.caption),
              ),
              children: [
                ListTile(
                  trailing: Text("المالك 3"),
                  title: Center(
                    child: Text(
                      '${data!['warit3']}',
                      maxLines: 3,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                ListTile(
                  trailing: Text("البطاقة 3"),
                  title: Center(
                    child: Text(
                      '${data!['warit3ID']}',
                      maxLines: 3,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                ListTile(
                  trailing: Text("المالك 4"),
                  title: Center(
                    child: Text(
                      '${data!['warit4']}',
                      maxLines: 3,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                ListTile(
                  trailing: Text("البطاقة 4"),
                  title: Center(
                    child: Text(
                      '${data!['warit4ID']}',
                      maxLines: 3,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                ListTile(
                  trailing: Text("المالك 5"),
                  title: Center(
                    child: Text(
                      '${data!['warit5']}',
                      maxLines: 3,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                ListTile(
                  trailing: Text("البطاقة 5"),
                  title: Center(
                    child: Text(
                      '${data!['warit5ID']}',
                      maxLines: 3,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                ListTile(
                  trailing: Text("المالك 6"),
                  title: Center(
                    child: Text(
                      '${data!['warit6']}',
                      maxLines: 3,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                ListTile(
                  trailing: Text("البطاقة 6"),
                  title: Center(
                    child: Text(
                      '${data!['warit6ID']}',
                      maxLines: 3,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                ListTile(
                  trailing: Text("المالك 7"),
                  title: Center(
                    child: Text(
                      '${data!['warit7']}',
                      maxLines: 3,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                ListTile(
                  trailing: Text("البطاقة 7"),
                  title: Center(
                    child: Text(
                      '${data!['warit7ID']}',
                      maxLines: 3,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                ListTile(
                  trailing: Text("المالك 8"),
                  title: Center(
                    child: Text(
                      '${data!['warit8']}',
                      maxLines: 3,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                ListTile(
                  trailing: Text("البطاقة 8"),
                  title: Center(
                    child: Text(
                      '${data!['warit8ID']}',
                      maxLines: 3,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                ListTile(
                  trailing: Text("المالك 9"),
                  title: Center(
                    child: Text(
                      '${data!['warit9']}',
                      maxLines: 3,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                ListTile(
                  trailing: Text("البطاقة 9"),
                  title: Center(
                    child: Text(
                      '${data!['warit9ID']}',
                      maxLines: 3,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                ListTile(
                  trailing: Text("المالك 10"),
                  title: Center(
                    child: Text(
                      '${data!['warit10']}',
                      maxLines: 3,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                ListTile(
                  trailing: Text("البطاقة 10"),
                  title: Center(
                    child: Text(
                      '${data!['warit10ID']}',
                      maxLines: 3,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                ListTile(
                  trailing: Text("المالك 10"),
                  title: Center(
                    child: Text(
                      '${data!['warit10']}',
                      maxLines: 3,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                ListTile(
                  trailing: Text("البطاقة 10"),
                  title: Center(
                    child: Text(
                      '${data!['warit10ID']}',
                      maxLines: 3,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                ListTile(
                  trailing: Text("المالك 11"),
                  title: Center(
                    child: Text(
                      '${data!['warit11']}',
                      maxLines: 3,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                ListTile(
                  trailing: Text("البطاقة 11"),
                  title: Center(
                    child: Text(
                      '${data!['warit11ID']}',
                      maxLines: 3,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                ListTile(
                  trailing: Text("المالك 12"),
                  title: Center(
                    child: Text(
                      '${data!['warit12']}',
                      maxLines: 3,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                ListTile(
                  trailing: Text("البطاقة 12"),
                  title: Center(
                    child: Text(
                      '${data!['warit12ID']}',
                      maxLines: 3,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                ListTile(
                  trailing: Text("المالك 13"),
                  title: Center(
                    child: Text(
                      '${data!['warit13']}',
                      maxLines: 3,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                ListTile(
                  trailing: Text("البطاقة 13"),
                  title: Center(
                    child: Text(
                      '${data!['warit13ID']}',
                      maxLines: 3,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                ListTile(
                  trailing: Text("المالك 14"),
                  title: Center(
                    child: Text(
                      '${data!['warit14']}',
                      maxLines: 3,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                ListTile(
                  trailing: Text("البطاقة 14"),
                  title: Center(
                    child: Text(
                      '${data!['warit14ID']}',
                      maxLines: 3,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                ListTile(
                  trailing: Text("المالك 15"),
                  title: Center(
                    child: Text(
                      '${data!['warit15']}',
                      maxLines: 3,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                ListTile(
                  trailing: Text("البطاقة 15"),
                  title: Center(
                    child: Text(
                      '${data!['warit15ID']}',
                      maxLines: 3,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                ListTile(
                  trailing: Text("المالك 16"),
                  title: Center(
                    child: Text(
                      '${data!['warit16']}',
                      maxLines: 3,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                ListTile(
                  trailing: Text("البطاقة 16"),
                  title: Center(
                    child: Text(
                      '${data!['warit16ID']}',
                      maxLines: 3,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                ListTile(
                  trailing: Text("المالك 17"),
                  title: Center(
                    child: Text(
                      '${data!['warit17']}',
                      maxLines: 3,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                ListTile(
                  trailing: Text("البطاقة 17"),
                  title: Center(
                    child: Text(
                      '${data!['warit17ID']}',
                      maxLines: 3,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                ListTile(
                  trailing: Text("المالك 18"),
                  title: Center(
                    child: Text(
                      '${data!['warit18']}',
                      maxLines: 3,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                ListTile(
                  trailing: Text("البطاقة 18"),
                  title: Center(
                    child: Text(
                      '${data!['warit18ID']}',
                      maxLines: 3,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                ListTile(
                  trailing: Text("المالك 19"),
                  title: Center(
                    child: Text(
                      '${data!['warit19']}',
                      maxLines: 3,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                ListTile(
                  trailing: Text("البطاقة 19"),
                  title: Center(
                    child: Text(
                      '${data!['warit19ID']}',
                      maxLines: 3,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                ListTile(
                  trailing: Text("المالك 20"),
                  title: Center(
                    child: Text(
                      '${data!['warit20']}',
                      maxLines: 3,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                ListTile(
                  trailing: Text("البطاقة 20"),
                  title: Center(
                    child: Text(
                      '${data!['warit20ID']}',
                      maxLines: 3,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ListTileBoat extends StatelessWidget {
  const ListTileBoat({
    Key? key,
    required this.data,
    this.trailing,
    this.title,
    this.message,
  }) : super(key: key);

  final Map<String?, dynamic>? data;
  final String? trailing;
  final String? title;
  final String? message;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        trailing: SizedBox(
          child: Text(
            trailing!,
            textDirection: TextDirection.rtl,
          ),
          width: 100,
        ),
        title: Center(
          child: Text(
            title != null ? title! : "لايوجد",
            maxLines: 3,
            textAlign: TextAlign.center,
          ),
        ),
        onTap: () {
          Clipboard.setData(ClipboardData(text: title!));
          if (title != null) {
            Clipboard.setData(ClipboardData(text: title!));
            Get.snackbar("", "",
                titleText: Text(
                  message!,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                ));
          } else {
            Get.snackbar("", "",
                titleText: Text(
                  "لم يتم النسخ، الخانة فارخة",
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                ));
          }
        });
  }
}
