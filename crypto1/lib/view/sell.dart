import 'package:crypto1/view/wallet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../controller/firebase_controller.dart';

class Sell extends StatelessWidget {
  TextEditingController t1 = TextEditingController();
  FireBaseController controller = Get.put(FireBaseController());
  String email;
  double coinPrice;
  String coinName;


  Sell({required this.email, required this.coinPrice, required this.coinName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.orange,
        leading: IconButton(onPressed: () => Get.back(), icon: Icon(Icons.arrow_back)),
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.orange,
          child:  Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: Colors.red,// set border color
                        width: 3.0),   // set border width
                    borderRadius: BorderRadius.all(
                        Radius.circular(10.0)), // set rounded corner radius
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: t1,
                    maxLength: 20,
                    decoration: InputDecoration(
                      hintText: 'SATILACAK ADET',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: CupertinoButton(
                      color: Colors.white,
                      child: Text("ONAYLA",style: TextStyle(color: Colors.black),), onPressed: (){
                    controller.sell(email, coinName);
                    Wallet(email: email, coinName: coinName);
                  }),
                )
              ],
            ),
          )
      ),
    );
  }
}
