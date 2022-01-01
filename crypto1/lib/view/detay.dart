import 'package:crypto1/view/buy.dart';
import 'package:crypto1/controller/firebase_controller.dart';
import 'package:crypto1/view/wallet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class Detay extends StatelessWidget {
  FireBaseController controller = Get.put(FireBaseController());
  String coinName;
  double coinPrice;
  String image;
  String email;
  Detay({required this.coinName, required this.coinPrice, required this.image,required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.orange,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(coinName),
            Image.network(image,width: 25,height: 25,)
          ],
        ),
        centerTitle: true,
        leading: IconButton(onPressed: () => Get.back(), icon: Icon(Icons.arrow_back)),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.orange,
        child: Column(
          children: [
            Image.network("https://w7.pngwing.com/pngs/249/797/png-transparent-bitcoin-network-litecoin-chart-cryptocurrency-mining-angle-map-plot.png"),
            Expanded(child: Container()),
            Text(coinPrice.toString(),style: TextStyle(
                fontSize: 24,
                color: Colors.white),),
            Expanded(child: Container()),
            Row(
              children: [
                CupertinoButton(
                    color: Colors.white,
                    child: Text("AL",style: TextStyle(color: Colors.black),), onPressed: () {
                      Get.to(Buy(email: email,coinPrice: coinPrice,coinName: coinName,));
                } ),
                Expanded(child: Container()),
                CupertinoButton(
                    color: Colors.white,
                    child: Text("SAT",style: TextStyle(color: Colors.black),), onPressed: (){
                  Get.to(Wallet(email: email,coinName: coinName,));
                } ),
              ],
            )
          ],
        ) ,
      ),
    );
  }
}
