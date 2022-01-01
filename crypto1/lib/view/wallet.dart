import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto1/controller/firebase_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class Wallet extends StatelessWidget {
  FireBaseController controller = Get.put(FireBaseController());
  String email;
  String coinName;
  Wallet({required this.email, required this.coinName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue,
        leading: IconButton(onPressed: () => Get.back(), icon: Icon(Icons.arrow_back)),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.blue,
        child: Column(
          children: [
            StreamBuilder<QuerySnapshot>(
                stream: controller.getSnapshots(email, coinName),
                builder: (BuildContext context , AsyncSnapshot async){
                  if(async.hasError){
                    return Center(child: Text("Bir hata Oluştu, Lütfen Daha Sonra Tekrar Deneyiniz"),);
                  }
                  else{
                    if(async.hasData){
                      final  List liste = async.data!.docs;
                      return Flexible(
                          child: ListView.builder(
                              itemCount: liste.length,
                              itemBuilder: (context,index){
                                  return Card(
                                    color: Colors.white,
                                    child: ListTile(
                                      title: Row(children: [
                                        Text(liste[index].data()["coinName"].toString(),style: TextStyle(color: Colors.black),),
                                        Expanded(child: Container()),
                                        Text(liste[index].data()["data"].toString(),style: TextStyle(color: Colors.black),),
                                        Expanded(child: Container()),
                                        CupertinoButton(
                                            color: Colors.blue,
                                            child: Text("SAT",style: TextStyle(color: Colors.white),), onPressed: () { liste[index].reference.delete();})
                                      ],)
                                    ),
                                  );
                              }));
                    }
                         else{
                                  return Center(child: CircularProgressIndicator(),);
                  }
                }})
          ],
        ),
      ),
    );
  }
}
