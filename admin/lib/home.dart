import 'package:admin/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
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
                          child: Text("لوحة التحكم",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headline6),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GetX<UserController>(
                              builder: (_) {
                                var x = _.user.name;
                                return Text("مرحبا" + '  $x',
                                    style:
                                        Theme.of(context).textTheme.headline5);
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
                        child: OutlinedButton(
                          child: Icon(Feather.home),
                          onPressed: () {
                            Get.toNamed('/');
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 40,
                        width: 60,
                        child: OutlinedButton(
                          child: Icon(Feather.log_out),
                          onPressed: () {
                            //showLicensePage(context: context);
                            controller.signOut();
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
                            child: OutlinedButton(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Feather.paperclip),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text('الوثائق',
                                      textScaleFactor: 1.5,
                                      style:
                                          Theme.of(context).textTheme.bodyText2)
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
                            child: OutlinedButton(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Feather.navigation),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text('القوارب',
                                      textScaleFactor: 1.5,
                                      style:
                                          Theme.of(context).textTheme.bodyText2)
                                ],
                              ),
                              onPressed: () {
                                Get.toNamed('/Boats');
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
                            child: OutlinedButton(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Feather.log_out),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text('البحارة',
                                      textScaleFactor: 1.5,
                                      style:
                                          Theme.of(context).textTheme.bodyText2)
                                ],
                              ),
                              style: ButtonStyle(
                                  shape:
                                      MaterialStateProperty.all<OutlinedBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30)))),
                              onPressed: () {
                                Get.toNamed('/Seamen');
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
