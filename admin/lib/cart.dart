import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
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
                            child: Text(
                              "SHOPPING CART",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "SUB SHOP",
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
                      ],
                    ),
                  ],
                ),
              )),
            ],
          )),
        ),
      ),
    );
  }
}
