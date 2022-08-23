

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'models/kullanici.dart';

//void main() => runApp(MyApp());
void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  //
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fİreworks',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: AnaSayfa()
    );
  }
}
 class AnaSayfa extends StatefulWidget {
   const AnaSayfa({Key? key}) : super(key: key);



   @override
   State<AnaSayfa> createState() => _AnaSayfaState();

 }
final db =FirebaseFirestore.instance;

 class _AnaSayfaState extends State<AnaSayfa> {

   void kullanicilarigetir () async {
     var snapshot= await db.collection("kullanıcılar").get();
     //var snapshot= await db.collection("kullanıcılar").orderBy("yaş",descending: true).get();
     //orderbay tek olursa küçükten büyüğe yaşa göre sıralar ;descending: true dersek vüyükten küçüğe sıralar

     snapshot.docs.forEach((doc) {
       print(doc.data());
     });
   }
     void kimliklerigetir () async {
        var doc= await db.collection("kullanıcılar").doc("Co6au3031Ro6X2ijhx4v").get();

       if(doc.exists){
         print(doc.data());
       }else {
         print("Böyle bir kullancı bulunamadı.");
       }

     }

   void kullanicilariSorgula () async {
     var sorgu= await db.collection("kullanıcılar").where("isim",isEqualTo: "Elon").get();
     sorgu.docs.forEach((doc) {
       print(doc.data());
     });
   }

   void kullanicilariCokluSorgula () async {
     var sorgu= await db.collection("kullanıcılar").where("soyad",isEqualTo: "Çınar").where("isim",isEqualTo: "mehmet").get();
     sorgu.docs.forEach((doc) {
       print(doc.data());
     });
   }



   void kullanicigoster() async {
     var doc= await db.collection("kullanıcılar").doc("Co6au3031Ro6X2ijhx4v").get();
     kullanici kullanici1=kullanici.dokumandanuret(doc);
     
     print(kullanici1.id);
     print(kullanici1.isim);
     print(kullanici1.soyad);
     print(kullanici1.eposta);
     //print(kullanici1.avatar);
   }


   initState(){
    // kullanicilarigetir();
     //kimliklerigetir();
     //kullanicilariSorgula();
     //kullanicilariCokluSorgula();
     kullanicigoster();
     super.initState();
   }



   @override
   Widget build(BuildContext context) {

     return Scaffold(
       body: Center(


       ),
     );
   }
 }


