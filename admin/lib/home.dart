import 'package:admin/widgets/mainBody.dart';
import 'package:admin/resources/icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainBody(
      title: "لوحة التحكم",
      child: FutureBuilder<Object>(
          future: null,
          builder: (context, snapshot) {
            return Center(
              child: SingleChildScrollView(
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
                            SizedBox(
                                width: 50,
                                height: 50,
                                child: OmniIcons().document),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'الوثائق',
                              textScaleFactor: 2,
                            )
                          ],
                        ),
                        onPressed: () {
                          //Get.toNamed('/Documents');
                        },
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      height: 300,
                      child: OutlinedButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                height: 50, width: 50, child: OmniIcons().boat),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'القوارب',
                              textScaleFactor: 2,
                            )
                          ],
                        ),
                        onPressed: () {
                          Get.toNamed('/Boats');
                        },
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      height: 300,
                      child: OutlinedButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                height: 50,
                                width: 50,
                                child: OmniIcons().logout),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'البحارة',
                              textScaleFactor: 2,
                            )
                          ],
                        ),
                        onPressed: () {
                          Get.toNamed('/Seamen');
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
