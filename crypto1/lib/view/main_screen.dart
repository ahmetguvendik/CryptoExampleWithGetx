import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import 'detay.dart';
import '../controller/firebase_controller.dart';

class MainScreen extends StatelessWidget {
  FireBaseController controller = Get.put(FireBaseController());
  String email;
  MainScreen({required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.orange,
        title: Text("BİTAHMETSEN"),
        centerTitle: true,
        leading: IconButton(onPressed: () => ZoomDrawer.of(context)!.toggle(), icon: Icon(Icons.menu)),
        actions: [IconButton(onPressed: ()=> controller.logout(), icon: Icon( Icons.logout))],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.orange,
        child: Column(
          children: [
            buildCoin(
              email: email,
              coinName: "BİTCOİN",coinPrice: 47.28690, image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoLfWKncugc0YegqvB8XrgyQG78NTsSiGOzgeKoH6UbwueiG2J1Ed9wSiRzpdPu6TkwSQ&usqp=CAU",
            ),
            buildCoin(
                email: email,
              coinName: "ETHEREUM ", coinPrice: 3.74198, image: "https://w7.pngwing.com/pngs/368/176/png-transparent-ethereum-cryptocurrency-blockchain-bitcoin-logo-bitcoin-angle-triangle-logo-thumbnail.png"
            ),
            buildCoin(
              email: email,
              coinName: "ALGO", coinPrice: 1.5272, image: "https://assets.coingecko.com/coins/images/4380/large/download.png?1547039725",
            ),
            buildCoin(
              email: email,
              coinName: "ADA", coinPrice: 1.369, image: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/19/Coin-ada-big.svg/2048px-Coin-ada-big.svg.png",
            ),
            buildCoin(
                email: email,
                coinName: "SHIBA", coinPrice: 00000.3435, image: "https://www.telegramtr.net/wp-content/uploads/2021/06/shiba-inu.jpg")
          ],
        ),
      ),
    );
  }
}

class buildCoin extends StatelessWidget {
  String coinName;
  double coinPrice;
  String image;
  String email;

  buildCoin({required this.coinName, required this.coinPrice, required this.image,required this.email});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(Detay(
        coinPrice: coinPrice,
        coinName: coinName,
        image: image,
        email: email,
      )),
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.network(image,height: 50,width: 50,),
            Text(coinName),
            Text(coinPrice.toString()),
          ],
        ),
      ),);
  }
}


