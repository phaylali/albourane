import 'package:admin/controllers/boatsController.dart';
import 'package:admin/controllers/homeController.dart';
import 'package:admin/controllers/marinsController.dart';
import 'package:admin/resources/icons.dart';
import 'package:admin/widgets/skeleton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  final marinz = Get.put(MarinsController());
  final boatz = Get.put(BoatsController());

  @override
  Widget build(BuildContext context) {
    final marinsN = marinz.marinsAll.length.toString();
    final boatsN = boatz.boatsAll.length.toString();
    return Skeleton(
      fab: 'جديد',
      function: () {},
      title: 'الصفحة الرئيسية',
      button: Icon(
        Icons.add,
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Wrap(
                alignment: WrapAlignment.spaceEvenly,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 20,
                runSpacing: 20,
                children: [
                  SizedBox(
                      width: 300,
                      height: 70,
                      child: OutlinedButton(
                        child: ListTile(
                          title: Text(
                            'القوارب',
                            style: Theme.of(context).textTheme.headline6,
                            textDirection: TextDirection.rtl,
                          ),
                          leading: Text(
                            '$boatsN',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                        onPressed: null,
                      )),
                  SizedBox(
                      width: 300,
                      height: 70,
                      child: OutlinedButton(
                        child: ListTile(
                          title: Text(
                            'البحارة',
                            style: Theme.of(context).textTheme.headline6,
                            textDirection: TextDirection.rtl,
                          ),
                          leading: Text(
                            '$marinsN',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                        onPressed: null,
                      )),
                  SizedBox(
                    width: 300,
                    height: 300,
                    child: OutlinedButton(
                      child: ListTile(
                        title: Text(
                          'الاخبار',
                          style: Theme.of(context).textTheme.headline6,
                          textDirection: TextDirection.rtl,
                        ),
                        leading: Text(
                          '$marinsN',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      onPressed: () {
                        Get.toNamed('/News');
                      },
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    height: 300,
                    child: OutlinedButton(
                      child: ListTile(
                        title: Text(
                          'اخبار جديدة',
                          style: Theme.of(context).textTheme.headline6,
                          textDirection: TextDirection.rtl,
                        ),
                        leading: Text(
                          '$marinsN',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      onPressed: () {
                        Get.toNamed('/NewArticle');
                      },
                    ),
                  ),
                ]),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
