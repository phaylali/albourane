import 'package:admin/auth.dart';
import 'package:admin/home.dart';
import 'package:admin/passwordController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
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
                          child: Text("الدخول",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headline6),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "مرحبا",
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
                            child: TextField(
                              onChanged: (value) => updateEmail(context, value),
                              decoration: InputDecoration(
                                hintText: 'البريد الالكتروني',
                                hintTextDirection: TextDirection.rtl,
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
                                return TextField(
                                  onChanged: (value) =>
                                      updatePassword(context, value),
                                  obscuringCharacter: '*',
                                  obscureText: p.hidden.value!,
                                  decoration: InputDecoration(
                                    hintText: 'كلمة السر',
                                    hintTextDirection: TextDirection.rtl,
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
                                    'الدخول',
                                  )
                                ],
                              ),
                              onPressed: () async {
                                Get.to(GotToProfile());
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

class GotToProfile extends ConsumerWidget {
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
    return FutureBuilder(
      future: _auth.signIn(email: email, password: pass),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text("Something Went wrong"),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return HomePage();
        }
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
