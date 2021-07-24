import 'package:admin/controllers/homeController.dart';
import 'package:admin/widgets/mainBody.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    //var thatWidth = context.width > 600.00 ? 500.00 : context.width;
    return MainBody(
        title: 'الدخول',
        child: Wrap(
          alignment: WrapAlignment.spaceEvenly,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 20,
          runSpacing: 20,
          children: [
            SizedBox(
              width: 600,
              height: 70,
              child: OutlinedButton(
                  onPressed: null,
                  child: ListTile(
                    title: TextFormField(
                      decoration: InputDecoration(
                        labelText: "البريد الالكتروني",
                      ),
                      keyboardType: TextInputType.emailAddress,
                      controller: controller.email,
                    ),
                  )),
            ),
            SizedBox(
              width: 600,
              height: 70,
              child: OutlinedButton(
                  onPressed: null,
                  child: ListTile(
                    title: TextFormField(
                      decoration: InputDecoration(
                        labelText: "كلمة السر",
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      controller: controller.password,
                    ),
                  )),
            ),
            Center(
              child: SizedBox(
                  height: 70,
                  //width: 300,
                  child: OutlinedButton(
                      onPressed: () {
                        controller.signIn();
                      },
                      child: ListTile(
                        title: Text(
                          'تسجيل الدخول',
                          textAlign: TextAlign.center,
                        ),
                      ))),
            ),
          ],
        ));
  }
}
