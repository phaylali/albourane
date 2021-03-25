import 'package:admin/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void getCurrentUser() async {
    User userr = FirebaseAuth.instance.currentUser!;
    Get.find<UserController>().user = await Database().getUser(userr.uid);
  }

  Future<bool> createNewUser(UserModel user) async {
    try {
      await _firestore.collection("users").doc(user.id!).set({
        "name": user.name,
        "email": user.email,
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<UserModel> getUser(String uid) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection("users").doc(uid).get();

      return UserModel.fromDocumentSnapshot(doc);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}

class UserModel {
  String? id;
  String? name;
  String? email;
  //UserModel() : super();
  UserModel({
    this.id,
    this.name,
    this.email,
  });

  UserModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    id = doc.id;
    name = doc["name"];
    email = doc["email"];
  }
}

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<UserController>(() => UserController());
  }
}

class UserController extends GetxController {
  String? id;
  String? name;
  String? email;
  Rx<UserModel> _userModel = UserModel().obs;

  UserModel get user => _userModel.value!;

  set user(UserModel value) => this._userModel.value = value;

  void clear() {
    _userModel.value = UserModel();
  }
}

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<User> _firebaseUser = Rx<User>();

  User? get user => _firebaseUser.value;

  @override
  onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());

    super.onInit();
  }

  void createUser(String name, String email, String password) async {
    try {
      UserCredential _authRes = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      //create user in database.dart
      UserModel _user =
          UserModel(id: _authRes.user!.uid, name: name, email: email);
      if (await Database().createNewUser(_user)) {
        Get.find<UserController>().user = _user;
        Get.back();
      }

      //id =_authRes.credential,
      //name = name,
      //email = _authRes.
      //    );
      //_user.id = _authResult.uid;
      // _user.name = name;
      // _user.email = _authResult.email;
      //(
      //id: _authResult.uid,
      //name: name,
      //email: _authResult.email,
      // );
      //if (await Database().createNewUser(_user)) {
      //  Get.find<UserController>().user = _user;
      //  Get.back();
      //}
      Get.offAll(Root());
    } catch (e) {
      Get.snackbar(
        "Error creating Account",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
      print(e);
    }
  }

  void login(String email, String password) async {
    try {
      UserCredential _authRes = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      Get.find<UserController>().user =
          await Database().getUser(_authRes.user!.uid);
    } catch (e) {
      Get.snackbar(
        "Error signing in",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
      print(e);
    }
  }

  void signOut() async {
    try {
      await _auth.signOut();
      Get.find<UserController>().clear();
    } catch (e) {
      Get.snackbar(
        "Error signing out",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
      print(e);
    }
  }
}
