import 'package:admin/checker.dart';
import 'package:admin/resources/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState>? drawerKey = GlobalKey();
    return SafeArea(
      child: Scaffold(
        key: drawerKey,
        floatingActionButton: context.responsiveValue(
          mobile: Fab(drawerKey: drawerKey),
          watch: Fab(drawerKey: drawerKey),
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
              ConnectionIndicator(),
              SizedBox(
                height: 10,
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
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(child: child!),
                    SizedBox(
                      width: 20,
                    ),
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

class Fab extends StatelessWidget {
  const Fab({
    Key? key,
    required this.drawerKey,
  }) : super(key: key);

  final GlobalKey<ScaffoldState>? drawerKey;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: SizedBox(height: 40, width: 40, child: OmniIcons().menu),
      onPressed: () {
        drawerKey!.currentState!.openEndDrawer();
      },
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
                    Get.toNamed('/NewDocument');
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
                    Get.toNamed('/SignIn');
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
                ListTile(
                  title: Text(
                    "تصريح جديد",
                    textDirection: TextDirection.rtl,
                  ),
                  leading:
                      SizedBox(height: 40, width: 40, child: OmniIcons().boat),
                  onTap: () {
                    Get.toNamed('/NewDeclaration');
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
