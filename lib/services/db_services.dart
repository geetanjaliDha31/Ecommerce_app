import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices {
  final String? uid;
  DatabaseServices({this.uid});

  //reference for our collections
  final CollectionReference userCollections =
      FirebaseFirestore.instance.collection("users");

    final CollectionReference productCollections =
      FirebaseFirestore.instance.collection("product");

  //updating user data
  Future saveUserData(
    String fullName,
    String dob,
    String email,
  ) async {
    return await userCollections.doc(uid).set({
      "fullName": fullName,
      "email": email,
      "dob": dob,
      "products":[],
      "uid": uid,
    });
  }

  //getting user data
  Future getUserData(String email) async {
    QuerySnapshot snapshot =
        await userCollections.where("email", isEqualTo: email).get();
    return snapshot;
  }

  
}


