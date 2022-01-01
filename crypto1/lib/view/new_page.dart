import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'main_screen.dart';
import 'menu_screen.dart';

class NewPage extends StatelessWidget {
  String email;

  NewPage({required this.email});

  @override
  Widget build(BuildContext context) {
       return ZoomDrawer(
        style: DrawerStyle.Style1,
        menuScreen: MenuScreen(email: email, coinName: "",), mainScreen: MainScreen(email: email,));
  }
}
