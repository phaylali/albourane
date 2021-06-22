import 'package:albourane/controllers/homeController.dart';
import 'package:albourane/resources/icons.dart';
import 'package:albourane/widgets/mainBody.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return MainBody(
      title: 'الصفحة الرئيسية',
      child: Wrap(
        //alignment: WrapAlignment.spaceEvenly,
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
        ],
      ),
    );
  }
}
