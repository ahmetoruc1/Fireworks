import 'package:cloud_firestore/cloud_firestore.dart';

class kullanici {


  final String id;
  final String isim;
  final String soyad;
  final String eposta;
  //final String avatar;

  kullanici({required this.id,  required this.isim, required this.soyad, required this.eposta, });
  factory  kullanici.dokumandanuret(var doc){
    var temp =doc.data();
    return kullanici(
        id: doc.id,
        isim: temp["isim"],
        soyad: temp["soyad"],
        eposta: temp["mail"]
    );
  }

}