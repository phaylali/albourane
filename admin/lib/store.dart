import 'package:admin/productsController.dart';
import 'package:flutter/material.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_icons/flutter_icons.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:get/get.dart';

class Store extends StatelessWidget {
  final fC = Get.put(ProductsController());
  Store({required this.title, required this.subtitle});
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
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
                              child: Icon(Feather.user),
                              onPressed: () {
                                Get.toNamed('/profile');
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
                              child: Icon(Feather.shopping_cart),
                              onPressed: () {
                                Get.toNamed('/cart');
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
                              child: Icon(Feather.filter),
                              onPressed: () {
                                Get.defaultDialog(
                                  title: "Filter Products",
                                  content: Column(
                                    children: [
                                      GetX<ProductsController>(
                                        builder: (f) {
                                          return Column(
                                            children: [
                                              CheckboxListTile(
                                                activeColor: Theme.of(context)
                                                    .accentColor,
                                                checkColor: Theme.of(context)
                                                    .scaffoldBackgroundColor,
                                                title: Text("Necklace",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText2),
                                                value: f.necklace.value,
                                                onChanged: (bool? value) {
                                                  f.upgrade('necklace');
                                                  f.necklace.value = value!;
                                                  f.update();
                                                },
                                              ),
                                              CheckboxListTile(
                                                activeColor: Theme.of(context)
                                                    .accentColor,
                                                checkColor: Theme.of(context)
                                                    .scaffoldBackgroundColor,
                                                title: Text("Braclet",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText2),
                                                value: f.braclet.value,
                                                onChanged: (bool? value) {
                                                  f.upgrade('braclet');
                                                  f.braclet.value = value!;
                                                  f.update();
                                                },
                                              ),
                                              CheckboxListTile(
                                                activeColor: Theme.of(context)
                                                    .accentColor,
                                                checkColor: Theme.of(context)
                                                    .scaffoldBackgroundColor,
                                                title: Text("Ring",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText2),
                                                value: f.ring.value,
                                                onChanged: (bool? value) {
                                                  f.upgrade('ring');
                                                  f.ring.value = value!;
                                                  f.update();
                                                },
                                              ),
                                              CheckboxListTile(
                                                activeColor: Theme.of(context)
                                                    .accentColor,
                                                checkColor: Theme.of(context)
                                                    .scaffoldBackgroundColor,
                                                title: Text("Earrings",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText2),
                                                value: f.earrings.value,
                                                onChanged: (bool? value) {
                                                  f.upgrade('earrings');
                                                  f.earrings.value = value!;
                                                  f.update();
                                                },
                                              ),
                                              SizedBox(
                                                width: 500,
                                                height: 40,
                                                child: OutlinedButton(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(Feather.save),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        "Save & Close",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )
                                                    ],
                                                  ),
                                                  onPressed: () {
                                                    if (f.filters.length > 0) {
                                                      f.start();
                                                      Get.back();
                                                    } else {
                                                      Get.snackbar(
                                                          "No Type Selected",
                                                          "Please Select at Least One Type of Products");
                                                    }
                                                    print(f.filters.toString());
                                                  },
                                                ),
                                              )
                                            ],
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                GetX<ProductsController>(builder: (ProductsController pC) {
                  return Expanded(
                    child: GridView.builder(
                      itemCount: pC.products.length,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 300,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 1),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 120,
                                  width: 300,
                                  child: OutlinedButton(
                                    onPressed: () {
                                      final String id = pC.products[index].id;
                                      Get.toNamed(
                                        "/Product?id=$id",
                                      );
                                    },
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                            OutlinedBorder>(StadiumBorder())),
                                    child: Center(
                                        child: Image.network(
                                            pC.products[index].image)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
