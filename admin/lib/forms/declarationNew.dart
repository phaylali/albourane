import 'package:admin/models/boatModel.dart';
import 'package:admin/widgets/mainBody.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class DeclarationInputController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late TextEditingController revenueController, salesController;

  var email = '';
  var password = '';
  RxDouble revenue = 0.0.obs;
  RxInt sales = 0.obs;

  @override
  void onInit() {
    super.onInit();
    revenueController = TextEditingController();
    salesController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    revenueController.dispose();
    salesController.dispose();
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Provide valid email";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 6) {
      return "Provide valid password";
    }
    return null;
  }

  void checkLogin() {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) return;
    loginFormKey.currentState!.save();
  }

  Future<DocumentSnapshot<Boat>> getBoat(x) async {
    return await FirebaseFirestore.instance
        .collection('boats')
        .doc(x)
        .withConverter<Boat>(
          fromFirestore: (snapshots, _) => Boat.fromJson(snapshots.data()!),
          toFirestore: (boat, _) => boat.toJson(),
        )
        .get();
  }
}

class DeclarationInput extends GetView<DeclarationInputController> {
  final String id = Get.parameters['id']!;
  @override
  Widget build(BuildContext context) {
    return MainBody(
      title: 'تصريح جديد',
      child: FutureBuilder<DocumentSnapshot<Boat>>(
          future: controller.getBoat(id),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }

            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            return Wrap(
              alignment: WrapAlignment.spaceEvenly,
              spacing: 20,
              runSpacing: 20,
              children: [
                SizedBox(
                  width: 300,
                  child: OutlinedButton(
                      onPressed: () {},
                      child: ListTile(
                        trailing: Text('اسم القارب'),
                        title: Text(snapshot.data!.data()!.boatName),
                      )),
                ),
                SizedBox(
                  width: 300,
                  child: OutlinedButton(
                      onPressed: () {},
                      child: ListTile(
                        trailing: Text('لوحة القارب'),
                        title: Text(snapshot.data!.data()!.boatReference),
                      )),
                ),
                SizedBox(
                  width: 300,
                  child: OutlinedButton(
                      onPressed: () {},
                      child: ListTile(
                        trailing: Text('لوحة القارب'),
                        title: Text(snapshot.data!.data()!.boatReference),
                      )),
                ),
                SizedBox(
                  width: 300,
                  child: OutlinedButton(
                      onPressed: () {},
                      child: ListTile(
                        trailing: Text(''),
                        title: TextFormField(
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            labelText: "المدخول الشهري",
                          ),
                          keyboardType: TextInputType.number,
                          controller: controller.revenueController,
                          onSaved: (value) {
                            controller.revenue = value! as RxDouble;
                          },
                          /*validator: (value) {
                            return controller.validateEmail(value!);
                          },*/
                        ),
                      )),
                ),
                SizedBox(
                  width: 300,
                  child: OutlinedButton(
                      onPressed: () {},
                      child: ListTile(
                        trailing: Text(''),
                        title: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            labelText: "عدد المبيعات",
                          ),
                          keyboardType: TextInputType.number,
                          controller: controller.salesController,
                          onSaved: (value) {
                            controller.sales = value! as RxInt;
                          },
                          /*
                          validator: (value) {
                            return controller.validateEmail(value!);
                          },*/
                        ),
                      )),
                ),
                SizedBox(
                  width: 300,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: TextFormField(),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: TextFormField(),
                  ),
                ),
              ],
            );
          }),
    );

/*
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 60, left: 16, right: 16),
          width: context.width,
          height: context.height,
          child: SingleChildScrollView(
            child: Form(
              key: controller.loginFormKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  OmniIcons().login,
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "ادخل المعلومات",
                    style: TextStyle(fontSize: 20, color: Colors.blue),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "Email",
                      prefixIcon: Icon(Icons.email),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    controller: controller.emailController,
                    onSaved: (value) {
                      controller.email = value!;
                    },
                    validator: (value) {
                      return controller.validateEmail(value!);
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "Password",
                      prefixIcon: Icon(Icons.lock),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    controller: controller.passwordController,
                    onSaved: (value) {
                      controller.password = value!;
                    },
                    validator: (value) {
                      return controller.validatePassword(value!);
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: context.width),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.deepPurpleAccent),
                        padding: MaterialStateProperty.all(EdgeInsets.all(14)),
                      ),
                      child: Text(
                        "Login",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      onPressed: () {
                        controller.checkLogin();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );*/
  }
}
