import 'dart:ui';
import 'package:admin/widgets/mainBody.dart';
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
            DocumentSnapshot? data = snapshot.data;
            if (data!.exists) {
              return Center(
                  child: Text(
                "${data['reference']}",
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
              DocumentSnapshot? data = snapshot.data;

              if (data!.exists) {
                return Center(
                  child: Container(
                    child: context.responsiveValue(
                        mobile: ListView(
                          shrinkWrap: true,
                          children: [
                            BoatInfo(data: data),
                            SizedBox(
                              height: 20,
                            ),
                            ImageOfBoat(data: data),
                          ],
                        ),
                        tablet: ListView(
                          shrinkWrap: true,
                          children: [
                            BoatInfo(data: data),
                            SizedBox(
                              height: 20,
                            ),
                            ImageOfBoat(data: data),
                          ],
                        ),
                        desktop: Row(
                          children: [
                            Flexible(child: BoatInfo(data: data)),
                            SizedBox(
                              width: 20,
                            ),
                            Flexible(child: ImageOfBoat(data: data)),
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

  final DocumentSnapshot<Object?>? data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => Get.defaultDialog(
            title: 'كبر الصورة',
            content: InteractiveViewer(
              child: Image.network('${data!['image']}'),
            )),
        child: Image.network('${data!['image']}'));
  }
}

class BoatInfo extends StatelessWidget {
  const BoatInfo({
    Key? key,
    required this.data,
  }) : super(key: key);

  final DocumentSnapshot<Object?>? data;

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
              message: "تم نسخ اسم القارب",
            ),
            ListTileInfo(
              data: data,
              title: '${data!['reference']}',
              trailing: "اللوحة",
              message: "تم نسخ رقم لوحة القارب",
            ),
            ListTileInfo(
              data: data,
              title: '${data!['region']}',
              trailing: "المنطقة",
              message: "تم نسخ المنطقة",
            ),
            ListTileInfo(
              data: data,
              title: '${data!['owner']}',
              trailing: "المسؤول",
              message: "تم نسخ اسم المسؤول",
            ),
            ListTileInfo(
              data: data,
              title: '${data!['ownerCIN']}',
              trailing: "بطاقته",
              message: "تم نسخ بطاقة المسؤول",
            ),
            ExpansionTile(
              collapsedBackgroundColor: Theme.of(context).primaryColor,
              title: Center(
                child: Text("لائحة المالكين",
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                    style: Theme.of(context).textTheme.caption),
              ),
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: 20,
                    itemBuilder: (_, i) {
                      i = i + 1;
                      return CustomListTileMalik(
                        name: data!['warit$i'],
                        cin: data!['waritID$i'],
                        trailing: "المالك $i",
                        message1: "تم نسخ اسم المالك رقم $i",
                        message2: "تم نسخ بطاقة المالك رقم $i",
                      );
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ListTileInfo extends StatelessWidget {
  ListTileInfo({
    Key? key,
    required this.data,
    this.trailing,
    this.title,
    this.message,
    this.max,
  }) : super(key: key);

  final DocumentSnapshot<Object?>? data;
  final String? trailing;
  final String? title;
  final String? message;
  int? max = 3;

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
            maxLines: max,
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

class CustomListTileMalik extends StatelessWidget {
  const CustomListTileMalik({
    Key? key,
    this.trailing,
    this.name,
    this.cin,
    this.message1,
    this.message2,
  }) : super(key: key);

  final String? trailing;
  final String? name;
  final String? message1;
  final String? message2;
  final String? cin;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        child: (name != null)
            ? Row(
                children: [
                  SizedBox(
                    width: 120,
                    child: ListTile(
                        title: Center(
                          child: Text(
                            cin!,
                            maxLines: 3,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        onTap: () {
                          Clipboard.setData(ClipboardData(text: cin!));
                          Get.snackbar("", "",
                              titleText: Text(
                                message2!,
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.center,
                              ));
                        }),
                  ),
                  Expanded(
                    child: ListTile(
                        trailing: SizedBox(
                          child: Text(
                            trailing!,
                            textDirection: TextDirection.rtl,
                          ),
                          width: 100,
                        ),
                        title: Center(
                          child: Text(
                            name!,
                            maxLines: 3,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        onTap: () {
                          Clipboard.setData(ClipboardData(text: name!));
                          Get.snackbar("", "",
                              titleText: Text(
                                message1!,
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.center,
                              ));
                        }),
                  ),
                ],
              )
            : Row(
                children: [
                  Expanded(
                    child: ListTile(
                      trailing: SizedBox(
                        child: Text(
                          trailing!,
                          textDirection: TextDirection.rtl,
                        ),
                        width: 100,
                      ),
                      title: Center(
                        child: Text(
                          "لا يوجد",
                          maxLines: 3,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ));
  }
}
