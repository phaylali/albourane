import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  late String id;
  late int price;
  late int oldPrice;
  late int quantity;
  late String name;
  late String description;
  late String reference;
  late String type;
  late String image;
  late String video;

  /*ProductModel(this.id, this.name, this.description, this.reference, this.type,
      this.image, this.price, this.oldPrice, this.quantity, this.video);*/

  ProductModel.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    id = documentSnapshot.id;
    reference = documentSnapshot["reference"];
    name = documentSnapshot["name"];
    price = documentSnapshot["price"];
    oldPrice = documentSnapshot["oldPrice"];
    description = documentSnapshot["description"];
    type = documentSnapshot["type"];
    quantity = documentSnapshot["quantity"];
    image = documentSnapshot["image"];
    video = documentSnapshot["video"];
  }
}
