
import 'package:crypto1/controller/firebase_controller.dart';
import 'package:crypto1/view/menu_screen.dart';
import 'package:crypto1/view/new_page.dart';
import 'package:crypto1/view/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';


class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();
    FireBaseController controller = Get.put(FireBaseController());

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.orange,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 1.3,
              decoration: BoxDecoration(
                  color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  topRight: Radius.circular(20)
                )
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: emailcontroller,
                  decoration: InputDecoration(
                    hintText: "E MAİL",
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                width: MediaQuery.of(context).size.width / 1.3,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        topRight: Radius.circular(20)
                    )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    obscureText: true,
                    controller: passwordcontroller,
                    decoration: InputDecoration(
                      hintText: "PASSWORD",
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: CupertinoButton(
                color: Colors.white,
                child: Text("GİRİŞ YAP",style: TextStyle(color: Colors.black),),
              onPressed: (){
                controller.signIn(emailcontroller.text, passwordcontroller.text);
                NewPage(email: emailcontroller.text);
              },
              )
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                child: CupertinoButton(
                  color: Colors.white,
                  child: Text("KAYIT OL",style: TextStyle(color: Colors.black),),
                  onPressed: (){
                    controller.createUser(emailcontroller.text, passwordcontroller.text);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


}
