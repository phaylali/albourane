import 'package:admin/controllers/home_controller.dart';
import 'package:admin/resources/icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
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
                  title: const Text("العودة الى الخلف",
                      textDirection: TextDirection.rtl,
                      textScaler: TextScaler.linear(1.3)),
                  leading:
                      SizedBox(height: 40, width: 40, child: OmniIcons().back),
                  onTap: () {
                    if (context.isPhone) Get.back();

                    Get.back();
                  },
                ),
                ListTile(
                  title: const Text("الصفحة الرئيسية",
                      textDirection: TextDirection.rtl,
                      textScaler: TextScaler.linear(1.3)),
                  leading:
                      SizedBox(height: 40, width: 40, child: OmniIcons().home),
                  onTap: () {
                    Get.toNamed('/');
                  },
                ),
                ListTile(
                  title: const Text("القوارب",
                      textDirection: TextDirection.rtl,
                      textScaler: TextScaler.linear(1.3)),
                  leading:
                      SizedBox(height: 40, width: 40, child: OmniIcons().boat),
                  onTap: () {
                    Get.toNamed('/Boats');
                  },
                ),
                ListTile(
                  title: const Text("البحارة",
                      textDirection: TextDirection.rtl,
                      textScaler: TextScaler.linear(1.3)),
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
                  title: const Text("الاخبار",
                      textDirection: TextDirection.rtl,
                      textScaler: TextScaler.linear(1.3)),
                  leading: SizedBox(
                      height: 40, width: 40, child: OmniIcons().document),
                  onTap: () {
                    Get.toNamed('/News');
                  },
                ),
                ListTile(
                  title: const Text("مقال جديد",
                      textDirection: TextDirection.rtl,
                      textScaler: TextScaler.linear(1.3)),
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
                  title: const Text("الدخول",
                      textDirection: TextDirection.rtl,
                      textScaler: TextScaler.linear(1.3)),
                  leading:
                      SizedBox(height: 40, width: 40, child: OmniIcons().login),
                  onTap: () {
                    Get.toNamed('/Login');
                  },
                ),
                ListTile(
                  title: const Text("الخروج",
                      textDirection: TextDirection.rtl,
                      textScaler: TextScaler.linear(1.3)),
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
        const SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
