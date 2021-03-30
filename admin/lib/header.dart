//import 'dart:ffi';

import 'package:admin/checker.dart';
import 'package:admin/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class MainBody extends StatelessWidget {
  final String? title;
  final Widget? subtitle;
  final Widget? child;

  MainBody({
    this.title,
    this.subtitle,
    this.child,
  });
  //GlobalKey<ScaffoldState>? drawerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState>? drawerKey = GlobalKey();
    return SafeArea(
      child: Scaffold(
        key: drawerKey,
        floatingActionButton: context.responsiveValue(
          mobile: FloatingActionButton(
            child: Icon(Feather.menu),
            onPressed: () {
              drawerKey.currentState!.openEndDrawer();
            },
          ),
          watch: FloatingActionButton(
            child: Icon(Feather.menu),
            onPressed: () {
              drawerKey.currentState!.openEndDrawer();
            },
          ),
          tablet: Container(),
          desktop: Container(),
        ),
        endDrawer: context.responsiveValue(
          mobile: Drawer(
            child: CustomDrawer(),
          ),
          watch: Drawer(
            child: CustomDrawer(),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(title!,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6),
              SizedBox(
                height: 20,
              ),
              Center(child: subtitle),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(child: child!),
                    Center(
                        child: context.responsiveValue(
                            desktop: CustomDrawer(), tablet: CustomDrawer()))
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
                  title: Text(
                    "العودة الى الخلف",
                    textDirection: TextDirection.rtl,
                  ),
                  leading:
                      SizedBox(height: 40, width: 40, child: OmniIcons().back),
                  onTap: () {
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
                    "القوارب",
                    textDirection: TextDirection.rtl,
                  ),
                  leading:
                      SizedBox(height: 40, width: 40, child: OmniIcons().boat),
                  onTap: () {
                    Get.toNamed('/Boats');
                  },
                ),
                ListTile(
                  title: Text(
                    "قارب جديد",
                    textDirection: TextDirection.rtl,
                  ),
                  leading: SizedBox(
                    height: 40,
                    width: 100,
                    child: Row(
                      children: [
                        OmniIcons().boat,
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
                  title: Text(
                    "البحارة",
                    textDirection: TextDirection.rtl,
                  ),
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
                  title: Text(
                    "بحار جديد",
                    textDirection: TextDirection.rtl,
                  ),
                  leading: SizedBox(
                    height: 40,
                    width: 100,
                    child: Row(
                      children: [
                        OmniIcons().seaman,
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
                  title: Text(
                    "الوثائق",
                    textDirection: TextDirection.rtl,
                  ),
                  leading: SizedBox(
                      height: 40, width: 40, child: OmniIcons().document),
                  onTap: () {
                    Get.toNamed('/Documents');
                  },
                ),
                ListTile(
                  title: Text(
                    "وثيقة جديدة",
                    textDirection: TextDirection.rtl,
                  ),
                  leading: SizedBox(
                    height: 40,
                    width: 100,
                    child: Row(
                      children: [
                        OmniIcons().document,
                        Center(
                            child: SizedBox(
                                height: 20,
                                width: 20,
                                child: OmniIcons().plus)),
                      ],
                    ),
                  ),
                  onTap: () {
                    Get.toNamed('/NewDocument');
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
                    Get.to(GotToHome());
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
