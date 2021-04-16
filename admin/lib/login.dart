import 'package:admin/auth.dart';
import 'package:admin/checker.dart';
import 'package:admin/icons.dart';
import 'package:admin/passwordController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class AdminSignIn extends ConsumerWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  void updateEmail(BuildContext context, String email) {
    context.read(emailProvider).state = email;
  }

  void updatePassword(BuildContext context, String pass) {
    context.read(passwordProvider).state = pass;
  }

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final email = watch(emailProvider).state;
    final pass = watch(passwordProvider).state;
    final _auth = watch(authServicesProvider);
    return SafeArea(
      child: Scaffold(
        body: Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      ConnectionIndicator(),
                      SizedBox(
                        height: 10,
                      ),
                      Text("تسجيل الدخول",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline6),
                      SizedBox(
                        height: 20,
                      ),
                      Center(child: Text("ادخل المعلومات")),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 600,
                        child: TextField(
                          controller: emailController,
                          onChanged: (value) => updateEmail(context, value),
                          decoration: InputDecoration(
                            hintText: 'البريد الالكتروني',
                            hintTextDirection: TextDirection.rtl,
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: SizedBox(
                                child: OmniIcons().email,
                                width: 40,
                                height: 40,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 600,
                        child: GetX<PasswordController>(
                          init: PasswordController(),
                          builder: (p) {
                            return TextField(
                              controller: passwordController,
                              onChanged: (value) =>
                                  updatePassword(context, value),
                              obscuringCharacter: '*',
                              obscureText: p.hidden.value,
                              onSubmitted: (value) {
                                submit(emailController, passwordController,
                                    _auth, email, pass);
                              },
                              decoration: InputDecoration(
                                hintText: 'كلمة السر',
                                hintTextDirection: TextDirection.rtl,
                                suffixIcon: InkWell(
                                  child: p.hidden.isTrue
                                      ? Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: SizedBox(
                                            child: OmniIcons().password_hide,
                                            width: 40,
                                            height: 40,
                                          ),
                                        )
                                      : Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: SizedBox(
                                            child: OmniIcons().password_show,
                                            width: 40,
                                            height: 40,
                                          ),
                                        ),
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
                        height: 20,
                      ),
                      SizedBox(
                        width: 600,
                        height: 50,
                        child: OutlinedButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                child: OmniIcons().login,
                                height: 40,
                                width: 40,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'الدخول',
                              )
                            ],
                          ),
                          onPressed: () {
                            submit(emailController, passwordController, _auth,
                                email, pass);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}

void submit(TextEditingController emailController,
    TextEditingController passwordController, _auth, email, pass) {
  if (emailController.text.isEmpty || !emailController.text.isEmail) {
    Get.snackbar("", "",
        titleText: Text(
          "خطأ في البريد الاكتروني",
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
        ),
        messageText: Text(
          "البريد الالكتروني غير صحيح او فارغ",
          textScaleFactor: 0.7,
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
        ));
  } else if (passwordController.text.isEmpty) {
    Get.snackbar("", "",
        titleText: Text(
          "خطأ في كلمة السر",
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
        ),
        messageText: Text(
          "كلمة السر فارغة",
          textScaleFactor: 0.7,
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
        ));
  } else {
    _auth
        .signIn(email: email, password: pass)
        .then((value) => Get.snackbar("", "",
            titleText: Text(
              "ملاحظة",
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
            ),
            messageText: Text(
              value,
              textScaleFactor: 0.7,
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
            )));
  }
}
