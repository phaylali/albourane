import 'package:admin/controllers/boatsController.dart';
import 'package:admin/controllers/declarationController.dart';
import 'package:admin/controllers/declarationInputController.dart';
import 'package:admin/controllers/marinsController.dart';
import 'package:admin/models/marinModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeclarationDialog extends StatelessWidget {
  const DeclarationDialog({
    Key? key,
    required this.controller,
    required this.id,
    required this.month,
  }) : super(key: key);

  final BoatsController controller;
  final String id;
  final String month;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
                onPressed: null,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        child: Center(
                            child: Text(
                          'ماذا تريد أن تفعل بالتقرير؟',
                          style: Theme.of(context).textTheme.headline6,
                        )),
                        height: 50,
                        width: 300,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        height: 50,
                        width: 300,
                        child: OutlinedButton(
                            onPressed: () async {
                              await Get.delete<DeclarationController>();
                              Get.toNamed(
                                "/Declaration?id=$id&m=$month",
                              );
                            },
                            child: Text(
                              'طبع',
                              style: Theme.of(context).textTheme.subtitle1,
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        height: 50,
                        width: 300,
                        child: OutlinedButton(
                            onPressed: () async {
                              await Get.delete<DeclarationInputController>();
                              Get.toNamed(
                                "/DeclarationEdit?id=$id&m=$month",
                              );
                            },
                            child: Text(
                              'تصحيح',
                              style: Theme.of(context).textTheme.subtitle1,
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        height: 50,
                        width: 300,
                        child: OutlinedButton(
                            onPressed: () async {
                              await Get.delete<DeclarationInputController>();

                              controller.deleteDeclaration(id, month);
                            },
                            child: Text(
                              'حذف',
                              style: Theme.of(context).textTheme.subtitle2,
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        height: 50,
                        width: 300,
                        child: OutlinedButton(
                            onPressed: () {
                              //Get.back();
                              Get.close(1);
                            },
                            child: Text(
                              'رجوع',
                              style: Theme.of(context).textTheme.subtitle2,
                            )),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ],
    );
  }
}

class MarinDialog extends StatelessWidget {
  const MarinDialog({
    Key? key,
    required this.controller,
    required this.item,
    required this.marins,
    required this.control,
  }) : super(key: key);

  final MarinsController controller;
  final GetxController control;
  final Marin item;
  final List<Marin> marins;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
                onPressed: null,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        child: Center(
                            child: Text(
                          'هل أنت متؤكد من إضافة هذا البحار؟',
                          style: Theme.of(context).textTheme.headline6,
                        )),
                        height: 50,
                        width: 300,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        child: Center(
                            child: Text(
                          '${item.marinLastName} ${item.marinFirstName} : ${item.marinReference}',
                          style: Theme.of(context).textTheme.headline6,
                        )),
                        height: 50,
                        width: 300,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        height: 50,
                        width: 300,
                        child: OutlinedButton(
                            onPressed: () async {
                              if (!marins.contains(item)) {
                                marins.add(item);
                                controller.update();
                                Get.put(control).update();
                              } else {
                                Get.snackbar('', '',
                                    titleText: Text(
                                      "البحار موجود في الائحة",
                                      textDirection: TextDirection.rtl,
                                      textAlign: TextAlign.center,
                                    ));
                                Get.close(1);
                              }
                            },
                            child: Text(
                              'تأكيد',
                              style: Theme.of(context).textTheme.subtitle1,
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        height: 50,
                        width: 300,
                        child: OutlinedButton(
                            onPressed: () {
                              Get.close(1);
                            },
                            child: Text(
                              'رجوع',
                              style: Theme.of(context).textTheme.subtitle2,
                            )),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ],
    );
  }
}
