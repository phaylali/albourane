import 'dart:async';
import 'package:admin/document.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DocumentsController extends GetxController {
  Rx<List<DocumentModel>> documentsList = Rx<List<DocumentModel>>();
  List<DocumentModel>? get documents => documentsList.value;
  final FirebaseFirestore firestoro = FirebaseFirestore.instance;

  onInit() {
    documentsList.bindStream(documentsStream());

    documentsList.refresh();

    super.onInit();
  }

  start() {
    documentsList.bindStream(documentsStream());
  }

  Stream<List<DocumentModel>> documentsStream() {
    return firestoro
        .collection('documents')
        .snapshots(includeMetadataChanges: false)
        .map((QuerySnapshot query) {
      List<DocumentModel> retVal = [];
      query.docs.forEach((element) {
        retVal.add(DocumentModel.fromDocumentSnapshot(element));
      });
      return retVal;
    });
  }
}
