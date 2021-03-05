import 'package:admin/auth.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_icons/flutter_icons.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:get/get.dart';

class HomePage extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
                child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "WELCOME TO ALBOURANE ADMIN",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GetX<UserController>(
                              builder: (_) {
                                var x = _.user.name;
                                return Text("Welcome" + '  $x');
                              },
                            )),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 40,
                        width: 60,
                        child: ElevatedButton(
                          child: Icon(Feather.arrow_left),
                          onPressed: () {
                            Get.back();
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 40,
                        width: 60,
                        child: ElevatedButton(
                          child: Icon(Feather.home),
                          onPressed: () {
                            //showLicensePage(context: context);
                            Get.toNamed('/');
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
            SliverToBoxAdapter(
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Center(
                      child: Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        children: [
                          SizedBox(
                            width: 300,
                            height: 300,
                            child: ElevatedButton(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Feather.log_out),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'Documents',
                                    textScaleFactor: 1.5,
                                  )
                                ],
                              ),
                              onPressed: () {
                                Get.toNamed('/Documents');
                              },
                              style: ButtonStyle(
                                  shape:
                                      MaterialStateProperty.all<OutlinedBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30)))),
                            ),
                          ),
                          SizedBox(
                            width: 300,
                            height: 300,
                            child: ElevatedButton(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Feather.log_out),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'Sign Out 2',
                                    textScaleFactor: 1.5,
                                  )
                                ],
                              ),
                              onPressed: () {
                                //showLicensePage(context: context);
                                controller.signOut();
                                Get.toNamed('/');
                              },
                              style: ButtonStyle(
                                  shape:
                                      MaterialStateProperty.all<OutlinedBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30)))),
                            ),
                          ),
                          SizedBox(
                            width: 300,
                            height: 300,
                            child: ElevatedButton(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Feather.log_out),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'Sign Out 3',
                                    textScaleFactor: 1.5,
                                  )
                                ],
                              ),
                              style: ButtonStyle(
                                  shape:
                                      MaterialStateProperty.all<OutlinedBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30)))),
                              onPressed: () {
                                //showLicensePage(context: context);
                                controller.signOut();
                                Get.toNamed('/');
                              },
                            ),
                          ),
                          SizedBox(
                            width: 300,
                            height: 300,
                            child: ElevatedButton(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Feather.log_out),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'Sign Out 4',
                                    textScaleFactor: 1.5,
                                  )
                                ],
                              ),
                              style: ButtonStyle(
                                  shape:
                                      MaterialStateProperty.all<OutlinedBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30)))),
                              onPressed: () {
                                //showLicensePage(context: context);
                                controller.signOut();
                                Get.toNamed('/');
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
