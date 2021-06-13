import 'package:admin/controllers/marinsController.dart';
//import 'package:admin/forms/declarationNew.dart';
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
        //direction: Axis.horizontal,

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
              child: ListView(
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
                  ListTile(
                      trailing: SizedBox(
                        width: 80,
                        child: Text(
                          "النسب",
                          textDirection: TextDirection.rtl,
                        ),
                      ),
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
                            marin.marinLastName + ' ' + marin.marinFirstName,
                            "تم نسخ اسم البحار");
                      }),
                  ListTile(
                      trailing: SizedBox(
                        width: 80,
                        child: Text(
                          "الاسم",
                          textDirection: TextDirection.rtl,
                        ),
                      ),
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
                            marin.marinLastName + ' ' + marin.marinFirstName,
                            "تم نسخ اسم البحار");
                      }),
                  ListTile(
                      trailing: SizedBox(
                        width: 80,
                        child: Text(
                          "الضمان",
                          textDirection: TextDirection.rtl,
                        ),
                      ),
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
                        controller.getListTile(
                            marin.marinCnss, "تم نسخ بطاقة الضمان الاجتماعي");
                      }),
                  ListTile(
                      trailing: SizedBox(
                        width: 80,
                        child: Text(
                          "البطاقة",
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                      title: Center(
                        child: Text(
                          marin.marinCin.isNotEmpty ? marin.marinCin : "لايوجد",
                          maxLines: 3,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      onTap: () {
                        controller.getListTile(
                            marin.marinCin, "تم نسخ رقم البطاقة الوطنية");
                      }),
                  ListTile(
                      trailing: SizedBox(
                        width: 80,
                        child: Text(
                          "اللوحة",
                          textDirection: TextDirection.rtl,
                        ),
                      ),
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

class MarinPreview extends StatelessWidget {
  MarinPreview(this.marin);

  final Marin marin;

  Widget get details {
    return OutlinedButton(
      onPressed: () {
        final String id = marin.marinReference.replaceAll('/', '-');
        Get.toNamed(
          "/Seaman?id=$id",
        );
      },
      child: ListTile(
        leading: reference,
        title: name,
      ),
    );
  }

  Widget get name {
    return Text(
      '${marin.marinLastName} ${marin.marinFirstName}',
      textScaleFactor: 1.2,
      overflow: TextOverflow.ellipsis,
      maxLines: 3,
    );
  }

  Widget get reference {
    return SizedBox(
      width: 90,
      child: Center(
        child: Text(
          '${marin.marinReference}',
          textScaleFactor: 0.8,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: details,
      width: 300,
      height: 100,
    );
  }
}

class MarinAdd extends StatelessWidget {
  MarinAdd(this.marin, this.marins, this.controller);

  final Marin marin;
  final List<Marin> marins;
  final GetxController controller;

  Widget get details {
    return OutlinedButton(
      onPressed: () {
        Get.defaultDialog(
          title: 'هل أنت متؤكد من إضافة هذا البحار؟',
          textConfirm: 'تأكيد',
          middleText:
              '${marin.marinLastName} ${marin.marinFirstName} : ${marin.marinReference}',
          onConfirm: () {
            if (!marins.contains(marin)) {
              marins.add(marin);
              controller.update();
            } else
              Get.snackbar('', '',
                  titleText: Text(
                    "البحار موجود في الائحة",
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                  ));
          },
          textCancel: 'الغاء',
          /*onCancel: () {
              Get.back();
            }*/
        );
      },
      child: ListTile(
        leading: reference,
        title: name,
      ),
    );
  }

  Widget get name {
    return Text(
      '${marin.marinLastName} ${marin.marinFirstName}',
      textScaleFactor: 1.2,
      overflow: TextOverflow.ellipsis,
      maxLines: 3,
    );
  }

  Widget get reference {
    return SizedBox(
      width: 90,
      child: Center(
        child: Text(
          '${marin.marinReference}',
          textScaleFactor: 0.8,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: details,
      width: 300,
      height: 100,
    );
  }
}
