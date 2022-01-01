import 'package:crypto1/controller/firebase_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class Profile extends StatelessWidget {

  FireBaseController controller = Get.put(FireBaseController());

  String email;
  Profile({required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red,
        leading: IconButton(onPressed: () => Get.back(), icon: Icon(Icons.arrow_back)),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.red,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipOval(
                child: Image.network(
                  'https://www.kindpng.com/picc/m/173-1731325_person-icon-png-transparent-png.png',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  margin: EdgeInsets.all(8.0),
                    width: MediaQuery.of(context).size.width / 1.3,
                    decoration: BoxDecoration(
                        color: Colors.white,
                    ),
                    child: Center(child: Text(email,style: TextStyle(fontSize: 20,color: Colors.black),))
                ),
              ),
              CupertinoButton(
                  color: Colors.white,
                  child: Text("ÇIKIŞ YAP",style: TextStyle(color: Colors.black),), onPressed: () => controller.logout())
            ],
          ),
        ),
      ),
    );
  }
}
