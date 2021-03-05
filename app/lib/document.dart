import 'package:cloud_firestore/cloud_firestore.dart';

class DocumentModel {
  late String id;
  late String name;
  late String description;
  late String dateCreation;
  late String dateEdited;
  late String attachment;
  late String preview;

  DocumentModel.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    id = documentSnapshot.id;
    dateCreation = documentSnapshot["dateCreation"];
    name = documentSnapshot["name"];
    description = documentSnapshot["description"];
    dateEdited = documentSnapshot["dateEdited"];
    attachment = documentSnapshot["attachment"];
    preview = documentSnapshot["preview"];
  }
}
