import 'package:admin/header.dart';
import 'package:admin/icons.dart';
import 'package:admin/providers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart' as dp;
import 'package:get/get.dart';

class NewDeclaration extends StatelessWidget {
  final FirebaseFirestore firestoro = FirebaseFirestore.instance;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController revenueController = TextEditingController();
  final TextEditingController daysController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController referenceController = TextEditingController();

  final DateTime now = DateTime.now();
  getBoat() async {
    var data = await firestoro.collection("boats").get();

    return data;
  }

  @override
  Widget build(BuildContext context) {
    return MainBody(
      title: "تصريح جديد",
      subtitle: Text("أدخل معلومات التصريح الجديد"),
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          label: SizedBox(height: 40, width: 40, child: OmniIcons().save),
          onPressed: () {
            if (nameController.text.isEmpty ||
                nameController.text.isNumericOnly) {
              Get.snackbar("", "",
                  borderColor: Colors.red[400],
                  borderRadius: 30,
                  borderWidth: 2,
                  titleText: Text(
                    "خطأ في الاسم",
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                  ),
                  messageText: Text(
                    "FLAN BEN FOLAN الاسم فارغ او غير صحيح، المرجو كتابته على شكل",
                    textScaleFactor: 0.7,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                  ));
            } else {
              Get.snackbar("", "",
                  borderColor: Colors.green[400],
                  borderRadius: 30,
                  borderWidth: 2,
                  titleText: Text(
                    "تمت العملية بنجاح",
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                  ),
                  messageText: Text(
                    "تم تسجيل التصريح بنجاح",
                    textScaleFactor: 0.7,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                  ));
              firestoro
                  .collection('boats')
                  .doc(referenceController.text.replaceAll('/', '-'))
                  .set({
                    'name': nameController.text.toUpperCase().toString(),
                    'reference': referenceController.text
                      ..toUpperCase().toString(),
                  })
                  .then((value) => print("Boat Added"))
                  .catchError((error) => print("Failed to add boat: $error"));
            }
            print("Name is:  " + nameController.text.toUpperCase());
            print("Reference is:  " + referenceController.text);
            print("ID is:  " +
                referenceController.text.replaceAll('/', '-').toUpperCase());
          },
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              //MonthPickerPage(),
              MonthlyPicker(),
              ExpansionTile(
                title: SizedBox(
                  width: 200,
                  child: ListTile(
                    title: Row(
                      children: [
                        Expanded(
                          child: Text("اللوحة"),
                        ),
                        Expanded(
                          child: Text("الاسم"),
                        ),
                        Expanded(child: Text("المربوح")),
                        Expanded(child: Text("الايام")),
                      ],
                    ),
                  ),
                ),
                children: [
                  FutureBuilder<QuerySnapshot>(
                      future: firestoro.collection('boats').get(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Center(child: Text("Something went wrong"));
                        }
                        if (snapshot.connectionState == ConnectionState.done) {
                          QuerySnapshot? d = snapshot.data;

                          if (d!.docs.isNotEmpty) {
                            return ListView.builder(
                                shrinkWrap: true,
                                itemCount: d.docs.length,
                                itemBuilder: (context, index) {
                                  return SizedBox(
                                    width: 200,
                                    child: ListTile(
                                      title: Row(
                                        children: [
                                          Expanded(
                                            child: Text(d.docs[index].id),
                                          ),
                                          Expanded(
                                            child: Text(d.docs[index]['name']),
                                          ),
                                          Expanded(
                                            child: TextFormField(
                                              keyboardType:
                                                  TextInputType.number,
                                              maxLines: 1,
                                              decoration: InputDecoration(
                                                hintText: 'المربوح',
                                                hintTextDirection:
                                                    TextDirection.rtl,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: TextFormField(
                                              keyboardType:
                                                  TextInputType.number,
                                              maxLines: 1,
                                              decoration: InputDecoration(
                                                hintText: 'الايام',
                                                hintTextDirection:
                                                    TextDirection.rtl,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          }
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }),
                ],
              ),
              ListTile(
                title: TextField(
                  maxLines: 1,
                  keyboardType: TextInputType.number,
                  controller: referenceController,
                  decoration: InputDecoration(
                    hintText: 'الرقم البحري',
                    hintTextDirection: TextDirection.rtl,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MonthlyPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DateController>(
        init: DateController(),
        builder: (d) {
          return Container(
            child: context.responsiveValue(
              mobile: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: SizedBox(
                      width: 300,
                      height: 280,
                      child: dp.MonthPicker(
                        selectedDate: d.dateNow.value,
                        onChanged: d.renew,
                        firstDate: d.firstDate.value,
                        lastDate: d.lastDate.value,
                        datePickerStyles: d.styles.value,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "التواريخ",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    title: Text(
                      "${d.firstDayOfMonthText}",
                      textAlign: TextAlign.center,
                    ),
                    trailing: SizedBox(
                      child: Text("تاريخ البداية"),
                      width: 130,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "${d.lastDayOfMonthText}",
                      textAlign: TextAlign.center,
                    ),
                    trailing: SizedBox(
                      child: Text("تاريخ النهاية"),
                      width: 130,
                    ),
                  ),
                ],
              ),
              desktop: Row(
                children: <Widget>[
                  Center(
                    child: SizedBox(
                      width: 300,
                      height: 300,
                      child: dp.MonthPicker(
                        selectedDate: d.dateNow.value,
                        onChanged: d.renew,
                        firstDate: d.firstDate.value,
                        lastDate: d.lastDate.value,
                        datePickerStyles: d.styles.value,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Flexible(
                    child: Column(
                      children: <Widget>[
                        Center(
                          child: Text(
                            "التواريخ",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        ListTile(
                          title: Text(
                            "${d.firstDayOfMonthText}",
                            textAlign: TextAlign.center,
                          ),
                          trailing: SizedBox(
                            child: Text("تاريخ البداية"),
                            width: 130,
                          ),
                        ),
                        ListTile(
                          title: Text(
                            "${d.lastDayOfMonthText}",
                            textAlign: TextAlign.center,
                          ),
                          trailing: SizedBox(
                            child: Text("تاريخ النهاية"),
                            width: 130,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
