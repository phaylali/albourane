import 'package:admin/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:admin/widgets/skeleton.dart';
import 'package:get/get.dart';

class Settings extends GetView<HomeController> {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeleton(
      button: Icon(
        Icons.share,
        color: Theme.of(context).colorScheme.primary,
      ),
      fab: 'الاعدادت',
      title: 'الاعدادت',
      function: () {},
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Wrap(
              alignment: WrapAlignment.spaceEvenly,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 20,
              runSpacing: 20,
              children: [
                SizedBox(
                  width: 500,
                  height: 70,
                  child: OutlinedButton(
                    child: ListTile(
                      title: Text(
                        "تسجيل الدخول",
                        style: Theme.of(context).textTheme.titleLarge,
                        textDirection: TextDirection.rtl,
                      ),
                      leading: const Icon(Icons.login),
                    ),
                    onPressed: () {
                      Get.defaultDialog(
                          titlePadding: const EdgeInsets.all(20),
                          title: "تسجيل الدخول",
                          titleStyle: Theme.of(context).textTheme.titleLarge,
                          content: Center(
                              child: Column(
                            children: [
                              Center(
                                child: SizedBox(
                                  width: 500,
                                  height: 70,
                                  child: OutlinedButton(
                                      onPressed: null,
                                      child: ListTile(
                                        title: TextFormField(
                                          decoration: const InputDecoration(
                                            labelText: "البريد الالكتروني",
                                          ),
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          controller: controller.email,
                                        ),
                                      )),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Center(
                                child: SizedBox(
                                  width: 500,
                                  height: 70,
                                  child: OutlinedButton(
                                      onPressed: null,
                                      child: ListTile(
                                        title: TextFormField(
                                          decoration: const InputDecoration(
                                            labelText: "كلمة السر",
                                          ),
                                          keyboardType:
                                              TextInputType.visiblePassword,
                                          controller: controller.password,
                                        ),
                                      )),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Center(
                                child: SizedBox(
                                  width: 500,
                                  height: 70,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        controller.signIn();
                                      },
                                      child: ListTile(
                                        title: Text("الدخول",
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge),
                                      )),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          )),
                          barrierDismissible: true);
                    },
                  ),
                ),
                SizedBox(
                  width: 500,
                  height: 70,
                  child: OutlinedButton(
                    child: ListTile(
                      title: Text(
                        "الخروج",
                        style: Theme.of(context).textTheme.titleLarge,
                        textDirection: TextDirection.rtl,
                      ),
                      leading: const Icon(Icons.logout),
                    ),
                    onPressed: () {
                      controller.signOut();
                    },
                  ),
                ),
                SizedBox(
                  width: 500,
                  height: 70,
                  child: OutlinedButton(
                    child: ListTile(
                      title: Text(
                        "Licenses",
                        style: Theme.of(context).textTheme.titleLarge,
                        textDirection: TextDirection.rtl,
                      ),
                      leading: const Icon(Icons.document_scanner),
                    ),
                    onPressed: () {
                      showLicensePage(context: context);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
