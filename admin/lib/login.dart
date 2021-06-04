import 'package:admin/auth.dart';
import 'package:admin/widgets/mainBody.dart';
import 'package:admin/resources/icons.dart';
import 'package:admin/passwordController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

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
    final _auth = watch(authServicesProvider);

    return MainBody(
      title: "تسجيل الدخول",
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          label: SizedBox(height: 40, width: 40, child: OmniIcons().login),
          onPressed: () async {
            print("password is : " + passwordController.text);
            print("emaail is : " + emailController.text);
            submit(emailController, passwordController, _auth,
                emailController.text, passwordController.text);
          },
        ),
        body: Center(
          child: GetBuilder<LoginController>(
              init: LoginController(),
              builder: (p) {
                return KeyboardActions(
                  config: p.config(context),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 60,
                        child: OutlinedButton(
                          onPressed: null,
                          child: ListTile(
                            title: TextField(
                              focusNode: p.emailNode.value,
                              keyboardType: TextInputType.name,
                              maxLines: 1,
                              controller: emailController,
                              decoration: InputDecoration(
                                hintText: 'البريد الالكتروني',
                                hintTextDirection: TextDirection.rtl,
                              ),
                            ),
                            trailing: SizedBox(
                              child: OmniIcons().email,
                              width: 40,
                              height: 40,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 60,
                        child: OutlinedButton(
                          onPressed: null,
                          child: ListTile(
                            title: TextField(
                              focusNode: p.passwordNode.value,
                              maxLines: 1,
                              controller: passwordController,
                              obscuringCharacter: '*',
                              obscureText: p.hidden.value,
                              decoration: InputDecoration(
                                hintText: 'كلمة السر',
                                hintTextDirection: TextDirection.rtl,
                              ),
                            ),
                            trailing: SizedBox(
                              child: p.hidden.isTrue
                                  ? OmniIcons().passwordHide
                                  : OmniIcons().passwordShow,
                              width: 40,
                              height: 40,
                            ),
                            leading: OutlinedButton(
                              onPressed: null,
                              child: Switch.adaptive(
                                  value: p.hidden.value,
                                  activeColor: Theme.of(context).accentColor,
                                  onChanged: (value) {
                                    p.change();
                                  }),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                );
              }),
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
