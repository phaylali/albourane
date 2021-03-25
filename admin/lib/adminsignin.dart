import 'package:admin/auth.dart';
import 'package:admin/passwordController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class AdminSignIn extends GetWidget<AuthController> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Get.put(PasswordController());
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
                            "SIGN IN",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Welcome Admin",
                          ),
                        ),
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
                        child: OutlinedButton(
                          child: Icon(Feather.home),
                          onPressed: () {
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
                          SizedBox(
                            height: 30.0,
                          ),
                          SizedBox(
                            width: 600,
                            child: TextFormField(
                              controller: emailController,
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .color),
                              decoration: InputDecoration(
                                hintText: 'Email',
                                suffixIcon: Icon(Feather.mail),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          SizedBox(
                            width: 600,
                            child: GetX<PasswordController>(
                              init: PasswordController(),
                              builder: (p) {
                                return TextFormField(
                                  controller: passwordController,
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .color),
                                  obscuringCharacter: '*',
                                  obscureText: p.hidden.value!,
                                  decoration: InputDecoration(
                                    hintText: 'Password',
                                    suffixIcon: InkWell(
                                      child: p.hidden.isTrue!
                                          ? Icon(Feather.eye_off)
                                          : Icon(Feather.eye),
                                      onTap: () => p.change(),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          SizedBox(
                            width: 600,
                            height: 50,
                            child: OutlinedButton(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Feather.log_in),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'Sign In',
                                    textScaleFactor: 1.5,
                                  )
                                ],
                              ),
                              onPressed: () {
                                controller.login(emailController.text,
                                    passwordController.text);
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
