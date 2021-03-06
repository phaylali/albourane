import 'package:albourane/resources/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
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
                  title: Text(
                    "العودة الى الخلف",
                    textDirection: TextDirection.rtl,
                  ),
                  leading:
                      SizedBox(height: 40, width: 40, child: OmniIcons().back),
                  onTap: () {
                    if (context.isPhone) Get.back();
                    Get.back();
                  },
                ),
                ListTile(
                  title: Text(
                    "الصفحة الرئيسية",
                    textDirection: TextDirection.rtl,
                  ),
                  leading:
                      SizedBox(height: 40, width: 40, child: OmniIcons().home),
                  onTap: () {
                    Get.toNamed('/');
                  },
                ),
                ListTile(
                  title: Text(
                    "الدخول",
                    textDirection: TextDirection.rtl,
                  ),
                  leading: SizedBox(
                      height: 40,
                      width: 40,
                      child: SvgPicture.asset(
                        'res/icons/login.svg',
                      )),
                  onTap: () {
                    //Get.toNamed('/SignIn');
                  },
                ),
                ListTile(
                  title: Text(
                    "الخروج",
                    textDirection: TextDirection.rtl,
                  ),
                  leading: SizedBox(
                      height: 40, width: 40, child: OmniIcons().logout),
                  onTap: () {
                    //Get.to(GotToHome());
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
