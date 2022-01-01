import 'package:crypto1/view/profile.dart';
import 'package:crypto1/view/wallet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/menu.dart';
import 'help.dart';
import 'info.dart';

class MenuScreen extends StatelessWidget {
    Menu items = Menu();
    String email;
    String coinName;
    MenuScreen({required this.email,required this.coinName});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        backgroundColor: Colors.orange,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => Get.to(Wallet(coinName: coinName,email: email,)),
                child: ListTile(
                  leading: Icon(items.wallet.icon),
                  title: Text(items.wallet.title),
                ),
              ),
              GestureDetector(
                onTap: () => Get.to(Profile(email: email,)),
                child: ListTile(
                  leading: Icon(items.profile.icon),
                  title: Text(items.profile.title),
                ),
              ),
              GestureDetector(
                onTap: () => Get.to(Info()),
                child: ListTile(
                  leading: Icon(items.info.icon),
                  title: Text(items.info.title),
                ),
              ),
              GestureDetector(
                onTap: () => Get.to(Help()),
                child: ListTile(
                  leading: Icon(items.help.icon),
                  title: Text(items.help.title),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


