import 'package:admin/models/boatModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class BoatsController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<QuerySnapshot<Boat>> getBoats() async {
    boatsRef;

    return boatsRef.get();
  }

  final boatsRef =
      FirebaseFirestore.instance.collection('boats').withConverter<Boat>(
            fromFirestore: (snapshots, _) => Boat.fromJson(snapshots.data()!),
            toFirestore: (movie, _) => movie.toJson(),
          );
}
