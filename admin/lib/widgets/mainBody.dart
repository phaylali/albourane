import 'package:admin/widgets/drawer.dart';
import 'package:admin/widgets/fab.dart';
import 'package:flutter/material.dart';

class MainBody extends StatelessWidget {
  const MainBody({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);
  final String title;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState>? drawerKey = GlobalKey();
    return Scaffold(
      key: drawerKey,
      floatingActionButton: Fab(drawerKey: drawerKey),
      endDrawer: Drawer(
        child: CustomDrawer(),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 10,
            ),
            Text(title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(child: child),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      )),
    );
  }
}
