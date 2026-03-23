import 'package:admin/controllers/boats_controller.dart';
import 'package:admin/controllers/declaration_controller.dart';
import 'package:admin/controllers/declaration_input_controller.dart';
import 'package:admin/controllers/marins_controller.dart';
import 'package:admin/models/marin_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeclarationDialog extends StatelessWidget {
  const DeclarationDialog({
    super.key,
    required this.controller,
    required this.id,
    required this.month,
  });

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
                        height: 50,
                        width: 300,
                        child: Center(
                            child: Text(
                          'ماذا تريد أن تفعل بالتقرير؟',
                          style: Theme.of(context).textTheme.titleLarge,
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
                              await Get.delete<DeclarationController>();
                              Get.toNamed(
                                "/Declaration?id=$id&m=$month",
                              );
                            },
                            child: Text(
                              'طبع',
                              style: Theme.of(context).textTheme.titleMedium,
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
                              style: Theme.of(context).textTheme.titleMedium,
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
                              style: Theme.of(context).textTheme.titleSmall,
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
                              style: Theme.of(context).textTheme.titleSmall,
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
    super.key,
    required this.controller,
    required this.item,
    required this.marins,
    required this.control,
  });

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
                        height: 50,
                        width: 300,
                        child: Center(
                            child: Text(
                          'هل أنت متؤكد من إضافة هذا البحار؟',
                          style: Theme.of(context).textTheme.titleLarge,
                        )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        height: 50,
                        width: 300,
                        child: Center(
                            child: Text(
                          '${item.marinLastName} ${item.marinFirstName} : ${item.marinReference}',
                          style: Theme.of(context).textTheme.titleLarge,
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
                              if (!marins.contains(item)) {
                                marins.add(item);
                                controller.update();
                                Get.put(control).update();
                              } else {
                                Get.snackbar('', '',
                                    titleText: const Text(
                                      "البحار موجود في الائحة",
                                      textDirection: TextDirection.rtl,
                                      textAlign: TextAlign.center,
                                    ));
                                Get.close(1);
                              }
                            },
                            child: Text(
                              'تأكيد',
                              style: Theme.of(context).textTheme.titleMedium,
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
                              style: Theme.of(context).textTheme.titleSmall,
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
