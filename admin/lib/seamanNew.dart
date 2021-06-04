import 'package:admin/widgets/mainBody.dart';
import 'package:admin/resources/icons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewSeaman extends StatelessWidget {
  final FirebaseFirestore firestoro = FirebaseFirestore.instance;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController referenceController = TextEditingController();
  final TextEditingController attachmentController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController cinController = TextEditingController();
  final TextEditingController cnssController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MainBody(
      title: "بحار جديد",
      subtitle: Text("أدخل معلومات البحار الجديد"),
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          label: SizedBox(height: 40, width: 40, child: OmniIcons().save),
          onPressed: () {
            if (!attachmentController.text.isURL ||
                attachmentController.text.isEmpty) {
              Get.snackbar("", "",
                  borderColor: Colors.red[400],
                  borderRadius: 30,
                  borderWidth: 2,
                  titleText: Text(
                    "خطأ رابط الصورة",
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                  ),
                  messageText: Text(
                    "الرابط فارغ او ليس برابط",
                    textScaleFactor: 0.7,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                  ));
            } else if (nameController.text.isEmpty ||
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
            } else if (referenceController.text.isEmpty ||
                !referenceController.text.contains(RegExp(r'[0-9]')) ||
                !referenceController.text.contains('-')) {
              Get.snackbar("", "",
                  borderColor: Colors.red[400],
                  borderRadius: 30,
                  borderWidth: 2,
                  titleText: Text(
                    "خطأ في الرقم البحري",
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                  ),
                  messageText: Text(
                    "3/1-Dالرقم البحري فارغ او غير صحيح، المرجو كتابته على شكل 1200",
                    textScaleFactor: 0.7,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                  ));
            } else if (phoneController.text.isEmpty ||
                !phoneController.text.isPhoneNumber) {
              Get.snackbar("", "",
                  borderColor: Colors.red[400],
                  borderRadius: 30,
                  borderWidth: 2,
                  titleText: Text(
                    "خطأ في رقم الهاتف",
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                  ),
                  messageText: Text(
                    "رقم الهاتف فارغ او غير صحيح، المرجو كتابته على شكل 0612345678",
                    textScaleFactor: 0.7,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                  ));
            } else if (cinController.text.isEmpty ||
                cinController.text.isNumericOnly) {
              Get.snackbar("", "",
                  borderColor: Colors.red[400],
                  borderRadius: 30,
                  borderWidth: 2,
                  titleText: Text(
                    "خطأ في رقم البطاقة",
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                  ),
                  messageText: Text(
                    "L123456 رقم البطاقة فارغ او غير صحيح، المرجو كتابته على شكل",
                    textScaleFactor: 0.7,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                  ));
            } else if (cnssController.text.isEmpty ||
                !cnssController.text.contains(RegExp(r'[0-9]')) ||
                !cnssController.text.length.isEqual(9)) {
              Get.snackbar("", "",
                  borderColor: Colors.red[400],
                  borderRadius: 30,
                  borderWidth: 2,
                  titleText: Text(
                    "خطأ في رقم الضمان الاجتماعي",
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                  ),
                  messageText: Text(
                    "رقم الضمان الاجتماعي فارغ او غير صحيح، المرجو كتابته على شكل 123456789",
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
                    "تم تسجيل البحار بنجاح",
                    textScaleFactor: 0.7,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                  ));
              firestoro
                  .collection('seamen')
                  .doc(referenceController.text.replaceAll('/', '-'))
                  .set({
                    'name': nameController.text.toUpperCase().toString(),
                    'reference': referenceController.text.toString(),
                    'image': attachmentController.text.toString(),
                    'phone': phoneController.text.toUpperCase().toString(),
                    'cin': cinController.text.toUpperCase().toString(),
                    'cnss': cnssController.text.toUpperCase().toString(),
                  })
                  .then((value) => print("Boat Added"))
                  .catchError((error) => print("Failed to add boat: $error"));
            }
            print("Name is:  " + nameController.text.toUpperCase());
            print("Image Link is:  " + attachmentController.text);
            print("Reference is:  " + referenceController.text);
            print("ID is:  " + referenceController.text.replaceAll('/', '-'));
            print("Phone is:  " + phoneController.text.toUpperCase());
            print("CIN is:  " + cinController.text.toUpperCase());
            print("CNSS is:  " + cnssController.text.toUpperCase());
          },
        ),
        body: Center(
          child: Container(
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Flex(
                          direction: Axis.vertical,
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: ListView(
                                shrinkWrap: true,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ListTile(
                                    title: TextField(
                                      keyboardType: TextInputType.name,
                                      maxLines: 1,
                                      controller: nameController,
                                      decoration: InputDecoration(
                                        hintText: 'اسم البحار',
                                        hintTextDirection: TextDirection.rtl,
                                      ),
                                    ),
                                  ),
                                  ListTile(
                                    title: TextField(
                                      keyboardType: TextInputType.url,
                                      maxLines: 1,
                                      controller: attachmentController,
                                      decoration: InputDecoration(
                                        hintText: 'رابط الصورة',
                                        hintTextDirection: TextDirection.rtl,
                                      ),
                                    ),
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
                                  ListTile(
                                    title: TextField(
                                      keyboardType: TextInputType.phone,
                                      maxLines: 1,
                                      controller: phoneController,
                                      decoration: InputDecoration(
                                        hintText: 'رقم هاتف البحار',
                                        hintTextDirection: TextDirection.rtl,
                                      ),
                                    ),
                                  ),
                                  ListTile(
                                    title: TextField(
                                      keyboardType: TextInputType.number,
                                      maxLines: 1,
                                      controller: cnssController,
                                      decoration: InputDecoration(
                                        hintText: 'رقم الضمان الاجتماعي للبحار',
                                        hintTextDirection: TextDirection.rtl,
                                      ),
                                    ),
                                  ),
                                  ListTile(
                                    title: TextField(
                                      keyboardType: TextInputType.text,
                                      maxLines: 1,
                                      controller: cinController,
                                      decoration: InputDecoration(
                                        hintText: 'رقم بطاقة البحار',
                                        hintTextDirection: TextDirection.rtl,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
