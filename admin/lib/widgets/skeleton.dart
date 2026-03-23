import 'package:admin/controllers/home_controller.dart';
import 'package:admin/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Skeleton extends GetView<HomeController> {
  const Skeleton(
      {super.key,
      required this.function,
      required this.fab,
      required this.title,
      required this.child,
      required this.button});
  final String title;
  final Widget child;
  final String fab;
  final Function function;
  final Widget button;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setApplicationSwitcherDescription(
        ApplicationSwitcherDescription(
      label: '$title | Albourane - البوران',
      primaryColor: Theme.of(context).colorScheme.primary.toARGB32(),
    ));
    controller.setupRoute();

    return Scaffold(
        key: key,
        backgroundColor: Theme.of(context).colorScheme.surface,
        floatingActionButton: FloatingActionButton(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            tooltip: fab,
            child: button,
            onPressed: () => function()),
        endDrawer: const Drawer(
          child: CustomDrawer(),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displaySmall),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(child: child),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        )),
        bottomNavigationBar: Obx(() => NavigationBar(
              key: key,
              backgroundColor: Theme.of(context).colorScheme.secondary,
              onDestinationSelected: (pageindex) {
                controller.pageselected.value = pageindex;

                switch (pageindex) {
                  case 0:
                    Get.toNamed('/');
                    break;
                  case 1:
                    Get.toNamed('/Boats');
                    break;
                  case 2:
                    Get.toNamed('/Seamen');
                    break;
                  case 3:
                    Get.toNamed('/Settings');
                    break;
                }
              },
              animationDuration: const Duration(seconds: 1),
              selectedIndex: controller.pageselected.value,
              destinations: [
                NavigationDestination(
                  icon: Icon(
                    Icons.bus_alert_outlined,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  label: 'البوابة',
                  selectedIcon: Icon(
                    Icons.bus_alert_outlined,
                    color: Theme.of(context).colorScheme.surface,
                  ),
                ),
                NavigationDestination(
                  icon: Icon(
                    Icons.bus_alert_outlined,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  label: 'القوارب',
                  selectedIcon: Icon(
                    Icons.bus_alert_outlined,
                    color: Theme.of(context).colorScheme.surface,
                  ),
                ),
                NavigationDestination(
                  icon: Icon(
                    Icons.person,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  label: 'البحارة',
                  selectedIcon: Icon(
                    Icons.person,
                    color: Theme.of(context).colorScheme.surface,
                  ),
                ),
                NavigationDestination(
                  icon: Icon(
                    Icons.settings,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  label: 'الإعدادات',
                  selectedIcon: Icon(
                    Icons.settings,
                    color: Theme.of(context).colorScheme.surface,
                  ),
                ),
              ],
            )));
  }
}
