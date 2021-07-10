import 'package:admin/controllers/homeController.dart';
import 'package:admin/resources/icons.dart';
import 'package:admin/widgets/mainBody.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  final FocusNode focusNode = FocusNode();
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
                  SizedBox(height: 50, width: 50, child: OmniIcons().seaman),
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
    );
  }
}
