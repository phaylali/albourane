import 'package:albourane/resources/icons.dart';
import 'package:flutter/material.dart';

class Fab extends StatelessWidget {
  const Fab({
    Key? key,
    required this.drawerKey,
  }) : super(key: key);

  final GlobalKey<ScaffoldState>? drawerKey;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: SizedBox(height: 40, width: 40, child: OmniIcons().menu),
      onPressed: () {
        drawerKey!.currentState!.openEndDrawer();
      },
    );
  }
}
