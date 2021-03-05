import 'package:admin/auth.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_icons/flutter_icons.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:get/get.dart';

class Profile extends GetWidget<AuthController> {
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
                            "PROFILE",
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
                      child: Column(
                        children: [
                          /*SizedBox(
                            width: 600,
                            child: TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(
                                hintText: 'Email',
                                suffixIcon: Icon(Feather.mail),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            ),
                          ),*/
                          /*SizedBox(
                            width: 600,
                            child: TextFormField(
                              controller: passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: 'Password',
                                suffixIcon: Icon(Feather.eye_off),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            ),
                          ),*/
                          SizedBox(
                            height: 30.0,
                          ),
                          SizedBox(
                            width: 600,
                            height: 50,
                            child: ElevatedButton(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Feather.log_out),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'Sign Out',
                                    textScaleFactor: 1.5,
                                  )
                                ],
                              ),
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
