import 'package:admin/controllers/homeController.dart';
import 'package:admin/resources/icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 20,
        ),
        SizedBox(
          width: 250,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text("العودة الى الخلف",
                      textDirection: TextDirection.rtl, textScaleFactor: 1.3),
                  leading:
                      SizedBox(height: 40, width: 40, child: OmniIcons().back),
                  onTap: () {
                    if (context.isPhone) Get.back();

                    Get.back();
                  },
                ),
                ListTile(
                  title: Text("الصفحة الرئيسية",
                      textDirection: TextDirection.rtl, textScaleFactor: 1.3),
                  leading:
                      SizedBox(height: 40, width: 40, child: OmniIcons().home),
                  onTap: () {
                    Get.toNamed('/');
                  },
                ),
                ListTile(
                  title: Text("القوارب",
                      textDirection: TextDirection.rtl, textScaleFactor: 1.3),
                  leading:
                      SizedBox(height: 40, width: 40, child: OmniIcons().boat),
                  onTap: () {
                    Get.toNamed('/Boats');
                  },
                ),
                ListTile(
                  title: Text("قارب جديد",
                      textDirection: TextDirection.rtl, textScaleFactor: 1.3),
                  leading: SizedBox(
                    height: 40,
                    width: 60,
                    child: Row(
                      children: [
                        SizedBox(
                            height: 40, width: 40, child: OmniIcons().boat),
                        Center(
                            child: SizedBox(
                                height: 20,
                                width: 20,
                                child: OmniIcons().plus)),
                      ],
                    ),
                  ),
                  onTap: () {
                    Get.toNamed('/NewBoat');
                  },
                ),
                ListTile(
                  title: Text("البحارة",
                      textDirection: TextDirection.rtl, textScaleFactor: 1.3),
                  leading: SizedBox(
                    height: 40,
                    width: 40,
                    child: OmniIcons().seaman,
                  ),
                  onTap: () {
                    Get.toNamed('/Seamen');
                  },
                ),
                ListTile(
                  title: Text("بحار جديد",
                      textDirection: TextDirection.rtl, textScaleFactor: 1.3),
                  leading: SizedBox(
                    height: 40,
                    width: 60,
                    child: Row(
                      children: [
                        SizedBox(
                            height: 40, width: 40, child: OmniIcons().seaman),
                        Center(
                            child: SizedBox(
                                height: 20,
                                width: 20,
                                child: OmniIcons().plus)),
                      ],
                    ),
                  ),
                  onTap: () {
                    Get.toNamed('/NewSeaman');
                  },
                ),
                ListTile(
                  title: Text("الاخبار",
                      textDirection: TextDirection.rtl, textScaleFactor: 1.3),
                  leading: SizedBox(
                      height: 40, width: 40, child: OmniIcons().document),
                  onTap: () {
                    Get.toNamed('/News');
                  },
                ),
                ListTile(
                  title: Text("مقال جديد",
                      textDirection: TextDirection.rtl, textScaleFactor: 1.3),
                  leading: SizedBox(
                    height: 40,
                    width: 60,
                    child: Row(
                      children: [
                        SizedBox(
                            height: 40, width: 40, child: OmniIcons().document),
                        Center(
                            child: SizedBox(
                                height: 20,
                                width: 20,
                                child: OmniIcons().plus)),
                      ],
                    ),
                  ),
                  onTap: () {
                    Get.toNamed('/NewArticle');
                  },
                ),
                ListTile(
                  title: Text("الدخول",
                      textDirection: TextDirection.rtl, textScaleFactor: 1.3),
                  leading:
                      SizedBox(height: 40, width: 40, child: OmniIcons().login),
                  onTap: () {
                    Get.toNamed('/Login');
                  },
                ),
                ListTile(
                  title: Text("الخروج",
                      textDirection: TextDirection.rtl, textScaleFactor: 1.3),
                  leading: SizedBox(
                      height: 40, width: 40, child: OmniIcons().logout),
                  onTap: () {
                    Get.put(HomeController()).signOut();
                  },
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
