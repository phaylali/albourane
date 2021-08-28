import 'package:admin/controllers/declarationController.dart';
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
        crossAxisAlignment: WrapCrossAlignment.center,
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
                if (marin.marinImage.isNotEmpty)
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
            height: 400,
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
                          style: TextStyle(
                            fontSize: 20,
                          ),
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
                          style: TextStyle(
                            fontSize: 20,
                          ),
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
                          style: TextStyle(
                            fontSize: 20,
                          ),
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
                          style: TextStyle(
                            fontSize: 20,
                          ),
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
                          style: TextStyle(
                            fontSize: 20,
                          ),
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
                  ListTile(
                      trailing: SizedBox(
                        width: 80,
                        child: Text(
                          "الهاتف",
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      title: Center(
                        child: Text(
                          marin.phone.isNotEmpty ? marin.phone : "لايوجد",
                          maxLines: 1,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      onTap: () {
                        controller.getListTile(
                            marin.phone, "تم نسخ الهاتف للبحار");
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
                          future: controller.getMarinRevenue(marin.url),
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
                                      onTap: () async {
                                        await Get.delete<
                                            DeclarationController>();
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
          SizedBox(
            width: 300,
            height: 300,
            child: OutlinedButton(
              onPressed: null,
              child: ListView(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    child: Text(
                      'اجراءات',
                      textAlign: TextAlign.center,
                    ),
                    height: 20,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    leading: SizedBox(
                      height: 40,
                      width: 60,
                      child: Row(
                        children: [
                          SizedBox(
                              height: 40,
                              width: 40,
                              child: OmniIcons().document),
                          Center(
                              child: SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: OmniIcons().plus)),
                        ],
                      ),
                    ),
                    title: Text('حذف البحار'),
                    onTap: () async {
                      await controller.deleteMarin(marin.url);
                      controller.marinsAll.clear();
                      controller.marinQuery.clear();
                      controller.getAllMarins();
                    },
                  ),
                  ListTile(
                    leading: SizedBox(
                      height: 40,
                      width: 60,
                      child: Row(
                        children: [
                          SizedBox(
                              height: 40,
                              width: 40,
                              child: OmniIcons().document),
                          Center(
                              child: SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: OmniIcons().plus)),
                        ],
                      ),
                    ),
                    title: Text('تصحيح المعلومات'),
                    onTap: () {
                      Get.toNamed('/MarinEdit?id=${marin.url}');
                    },
                  ),
                ],
              ),
            ),
          )
        ]);
  }
}

class MarinPreview extends StatelessWidget {
  MarinPreview(this.marin, this.click);

  final Marin marin;
  final Function click;

  Widget get details {
    return OutlinedButton(
      onPressed: () {
        click();
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
