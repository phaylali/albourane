import 'package:admin/resources/icons.dart';
import 'package:flutter/material.dart';

class Fab extends StatelessWidget {
  const Fab({
    super.key,
    required this.drawerKey,
  });

  final GlobalKey<ScaffoldState>? drawerKey;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () {
          drawerKey!.currentState!.openEndDrawer();
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(height: 40, width: 40, child: OmniIcons().menu),
        ));
  }
}
