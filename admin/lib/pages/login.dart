import 'package:admin/controllers/homeController.dart';
import 'package:admin/widgets/mainBody.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return MainBody(
        title: 'الدخول',
        child: Column(
          children: [
            Center(
              child: SizedBox(
                width: 700,
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
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: SizedBox(
                width: 700,
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
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: SizedBox(
                  height: 70,
                  width: 700,
                  child: OutlinedButton(
                      onPressed: () {
                        controller.signIn();
                      },
                      child: ListTile(
                        title: Text(
                          'تسجيل الدخول',
                          textScaleFactor: 1.4,
                          textAlign: TextAlign.center,
                        ),
                      ))),
            ),
          ],
        ));
  }
}
