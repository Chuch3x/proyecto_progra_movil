import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class FireStore {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> uploadUser(String username, String email) async {
    CollectionReference collRef = firestore.collection("users");
    await collRef.add({
      "email": email,
      "favorites": [],
      "preferences": [],
      "username": username
    });
  }

  Future<void> uploadRestaurant(
      String resName, String email, String street, String description) async {
    final String resID = resName.replaceAll(" ", "_");
    Map<String, int> coordinates = {
      "xcoords": 0,
      "ycoords": 0,
    };
    //probably will have to change to float at some point
    CollectionReference collRef = firestore.collection("restaurants");
    await collRef.add({
      "coordinates": coordinates,
      "description": description,
      "email": email,
      "logo": "",
      "name": resName,
      "restaurant_id": resID,
      "street": street,
    });
  }
}
