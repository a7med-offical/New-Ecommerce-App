import 'package:cloud_firestore/cloud_firestore.dart';

class UserDatabase {
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  Future<void> addUser(String fullName) {
    return users
        .add({
          'full_name': fullName,
         
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));

  }

  // Add more methods for updating, deleting, fetching users as needed
}
