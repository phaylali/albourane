import 'package:admin/resources/icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ERROR404 extends StatelessWidget {
  const ERROR404({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Expanded(
            child: Column(
              children: [
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "لا يوجد شيء هنا",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 50,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "هناك خطأ في الرابط او الصفحة قد تم حذفها",
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "عد إلى الخلف او ادخل للصفحة الرئيسية",
                  ),
                ),
                Row(
                  children: [
                    const Spacer(),
                    SizedBox(
                      height: 100,
                      width: 200,
                      child: OutlinedButton(
                        child: ListTile(
                          leading: OmniIcons().back,
                          title: const Text('إلى الخلف'),
                        ),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      height: 100,
                      width: 200,
                      child: OutlinedButton(
                        child: ListTile(
                          leading: OmniIcons().home,
                          title: const Text('الصفحة الرئيسية'),
                        ),
                        onPressed: () {
                          Get.toNamed('/');
                        },
                      ),
                    ),
                    const Spacer()
                  ],
                ),
                const Spacer()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NoProduct extends StatelessWidget {
  const NoProduct({super.key, required this.title, required this.subtitle});
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 30,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            subtitle,
                          ),
                        ),
                        const Spacer()
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
        ),
      ),
    );
  }
}
