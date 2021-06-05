import 'package:admin/controllers/marinsController.dart';
import 'package:admin/models/marinModel.dart';
import 'package:admin/resources/icons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MarinInfo extends StatelessWidget {
  MarinInfo(this.marin, this.controller);

  final Marin marin;
  final MarinsController controller;

  @override
  Widget build(BuildContext context) {
    return Wrap(
        alignment: WrapAlignment.spaceEvenly,
        direction: Axis.horizontal,
        spacing: 20,
        runSpacing: 20,
        children: [
          SizedBox(
            width: 300,
            height: 300,
            child: OutlinedButton(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    child: Text(
                      'الصورة',
                      textAlign: TextAlign.center,
                    ),
                    height: 20,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                      child: marin.marinImage.isNotEmpty
                          ? Image.network(marin.marinImage)
                          : OmniIcons().seaman),
                ],
              ),
              onPressed: () {
                Get.defaultDialog(
                    title: 'كبر الصورة',
                    content: InteractiveViewer(
                      child: Row(
                        children: [
                          Expanded(
                              child: Image.network(
                            marin.marinImage,
                            width: context.width * 9 / 10,
                            height: context.height * 7 / 10,
                          )),
                        ],
                      ),
                    ));
              },
            ),
          ),
          SizedBox(
            width: 300,
            height: 300,
            child: OutlinedButton(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    child: Text(
                      'المعلومات',
                      textAlign: TextAlign.center,
                    ),
                    height: 20,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 180,
                        height: 260,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ListTile(
                                title: Center(
                                  child: Text(
                                    marin.marinLastName.isNotEmpty
                                        ? marin.marinLastName
                                        : "لايوجد",
                                    maxLines: 3,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                onTap: () {
                                  controller.getListTile(
                                      marin.marinLastName +
                                          ' ' +
                                          marin.marinFirstName,
                                      "تم نسخ اسم البحار");
                                }),
                            ListTile(
                                title: Center(
                                  child: Text(
                                    marin.marinFirstName.isNotEmpty
                                        ? marin.marinFirstName
                                        : "لايوجد",
                                    maxLines: 3,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                onTap: () {
                                  controller.getListTile(
                                      marin.marinLastName +
                                          ' ' +
                                          marin.marinFirstName,
                                      "تم نسخ اسم البحار");
                                }),
                            ListTile(
                                title: Center(
                                  child: Text(
                                    marin.marinCnss.isNotEmpty
                                        ? marin.marinCnss
                                        : "لايوجد",
                                    maxLines: 3,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                onTap: () {
                                  controller.getListTile(marin.marinCnss,
                                      "تم نسخ بطاقة الضمان الاجتماعي");
                                }),
                            ListTile(
                                title: Center(
                                  child: Text(
                                    marin.marinCin.isNotEmpty
                                        ? marin.marinCin
                                        : "لايوجد",
                                    maxLines: 3,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                onTap: () {
                                  controller.getListTile(marin.marinCin,
                                      "تم نسخ رقم البطاقة الوطنية");
                                }),
                            ListTile(
                                title: Center(
                                  child: Text(
                                    marin.marinReference.isNotEmpty
                                        ? marin.marinReference
                                        : "لايوجد",
                                    maxLines: 3,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                onTap: () {
                                  controller.getListTile(marin.marinReference,
                                      "تم نسخ الرقم التعريفي للبحار");
                                }),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        height: 260,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "النسب",
                              textDirection: TextDirection.rtl,
                            ),
                            Text(
                              "الاسم",
                              textDirection: TextDirection.rtl,
                            ),
                            Text(
                              "الضمان",
                              textDirection: TextDirection.rtl,
                            ),
                            Text(
                              "البطاقة",
                              textDirection: TextDirection.rtl,
                            ),
                            Text(
                              "اللوحة",
                              textDirection: TextDirection.rtl,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
              onPressed: null,
            ),
          ),
          SizedBox(
            width: 300,
            height: 300,
            child: OutlinedButton(
                onPressed: null,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      child: Text(
                        'المداخيل',
                        textAlign: TextAlign.center,
                      ),
                      height: 20,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: FutureBuilder<QuerySnapshot>(
                          future: controller.getMarinRevenue(
                              marin.marinReference.replaceAll('/', '-')),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Center(
                                child: Text(snapshot.error.toString()),
                              );
                            }

                            if (!snapshot.hasData) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                            return ListView.builder(
                                itemCount: snapshot.data!.size,
                                itemBuilder: (context, index) {
                                  final month = snapshot.data!.docs[index].id;
                                  final id =
                                      snapshot.data!.docs[index]['boatID'];

                                  return Center(
                                    child: ListTile(
                                      title: Text(
                                        month,
                                        textAlign: TextAlign.center,
                                      ),
                                      onTap: () {
                                        Get.toNamed(
                                          "/Declaration?id=$id&m=$month",
                                        );
                                      },
                                    ),
                                  );
                                });
                          }),
                    ),
                  ],
                )),
          ),
        ]);
  }
}
