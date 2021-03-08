import 'package:cloud_firestore/cloud_firestore.dart';

class BoatModel {
  late String id;
  late String name;
  late String reference;
  late String owner;
  late String image;
  late String type;
  BoatModel.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    id = documentSnapshot.id;
    reference = documentSnapshot["reference"];
    name = documentSnapshot["name"];
    owner = documentSnapshot["owner"];
    image = documentSnapshot["image"];
    type = documentSnapshot["type"];
  }
}
