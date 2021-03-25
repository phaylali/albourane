import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class ERROR404 extends StatelessWidget {
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
                            "Nothing Is Here",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Go Home Or Go Back",
                          ),
                        ),
                        Spacer()
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Spacer(),
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
                      Spacer()
                    ],
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
                  Column(
                    children: [
                      Spacer(),
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
                      Spacer()
                    ],
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
