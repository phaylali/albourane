import 'package:albourane/resources/icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ERROR404 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Expanded(
            child: Column(
              children: [
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "لا يوجد شيء هنا",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 50,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "هناك خطأ في الرابط او الصفحة قد تم حذفها",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "عد إلى الخلف او ادخل للصفحة الرئيسية",
                  ),
                ),
                Row(
                  children: [
                    Spacer(),
                    SizedBox(
                      height: 100,
                      width: 200,
                      child: OutlinedButton(
                        child: ListTile(
                          leading: OmniIcons().back,
                          title: Text('إلى الخلف'),
                        ),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      height: 100,
                      width: 200,
                      child: OutlinedButton(
                        child: ListTile(
                          leading: OmniIcons().home,
                          title: Text('الصفحة الرئيسية'),
                        ),
                        onPressed: () {
                          Get.toNamed('/');
                        },
                      ),
                    ),
                    Spacer()
                  ],
                ),
                Spacer()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NoProduct extends StatelessWidget {
  NoProduct({required this.title, required this.subtitle});
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
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
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
                        Spacer()
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
