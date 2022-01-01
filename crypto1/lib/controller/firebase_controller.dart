import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto1/view/home_page.dart';
import 'package:crypto1/view/new_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FireBaseController extends GetxController{

  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> createUser(String email, String password) async{
    await _auth.createUserWithEmailAndPassword(email: email, password: password).then((value) => Get.snackbar("ONAYLANDI", "Kayıt Başarılı")).catchError((onError)=>
        Get.snackbar("HATA", onError.message));
  }

  Future<void> signIn(String email, String password) async{
    await _auth.signInWithEmailAndPassword(email: email, password: password).then((value) => Get.to(NewPage(email: email))).catchError((onError) =>
        Get.snackbar("HATA", onError.message));
  }

  Future<void> logout() async{
    await _auth.signOut().then((value) => Get.to(HomePage()));
  }

  Future<void> buy(String email,int data,double coinPrice,String coinName) async{
    await firestore.collection("users").doc(email).collection("buy").doc(coinName).set(
      {"data": data*coinPrice,
      "coinName": coinName}
    ).then((value) => Get.snackbar("ONAYLANDI", "SATIN ALMA İŞLEMİNİZ BAŞARILI")).catchError((onError) =>
      Get.snackbar("HATA", onError.message));
  }

  Stream<QuerySnapshot> getSnapshots(String email,String coinName) {
   return firestore.collection("users").doc(email).collection("buy").snapshots();
  }

  Future<void> sell(String email,String coinName) async{
    await firestore.collection("users").doc(email).collection("buy").doc(coinName).delete()
      .then((value) => Get.snackbar("ONAYLANDI", "SATMA İŞLEMİNİZ BAŞARILI")).catchError((onError) =>
        Get.snackbar("HATA", onError.message));
  }

}

  