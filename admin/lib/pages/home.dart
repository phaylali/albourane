import 'package:admin/controllers/boatsController.dart';
import 'package:admin/controllers/homeController.dart';
import 'package:admin/controllers/marinsController.dart';
import 'package:admin/resources/icons.dart';
import 'package:admin/widgets/mainBody.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return MainBody(
        title: 'لوحة التحكم',
        child: Wrap(
            alignment: WrapAlignment.spaceEvenly,
            crossAxisAlignment: WrapCrossAlignment.center,
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
                      SizedBox(height: 50, width: 50, child: OmniIcons().boat),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'القوارب',
                            textScaleFactor: 2,
                          ),
                          Obx(() => Text("${controller.boats}")),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      /* Text(
                        controller.boats.value,
                        textScaleFactor: 1,
                      ),*/

                      /*GetBuilder<HomeController>(
                        builder: (controller) {
                          return Text(
                            controller.boats.value.toString(),
                            textScaleFactor: 1,
                          );
                        },
                      )*/
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
                          height: 50, width: 50, child: OmniIcons().seaman),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'البحارة',
                            textScaleFactor: 2,
                          ),
                          Obx(() => Text("${controller.marins}")),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      /* Text(
                        controller.marins.value,
                        textScaleFactor: 1,
                      ),*/
                      /* GetBuilder<HomeController>(
                        builder: (controller) {
                          return Text(
                            controller.marins.value.toString(),
                            textScaleFactor: 1,
                          );
                        },
                      )*/
                    ],
                  ),
                  onPressed: () {
                    Get.toNamed('/Seamen');
                  },
                ),
              ),
            ]));
  }
}
