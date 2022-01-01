import 'package:crypto1/model/menu_item.dart';
import 'package:flutter/material.dart';

class Menu{
  final wallet =  MenuItem(title: "Wallet", icon: Icons.account_balance_wallet);
  final profile = MenuItem(title: "Profil", icon: Icons.person);
  final help = MenuItem(title: "Yardım", icon: Icons.help);
  final info = MenuItem(title: "Hakkımızda", icon: Icons.info);

}