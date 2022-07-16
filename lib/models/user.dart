import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  late String id;
  late String firstName;
  late String name;
  late String email;
  late String profilURL;

  UserModel({
    required this.id,
    required this.firstName,
    required this.name,
    required this.email,
    required this.profilURL,
  });

  UserModel.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
    id = documentSnapshot.id;
    firstName = documentSnapshot['firstName'];
    name = documentSnapshot['name'];
    email = documentSnapshot['email'];
    profilURL = documentSnapshot['profilURL'];
  }

  UserModel.fromJson(json) {
    id = json['id'];
    firstName = json['firstName'];
    name = json['name'];
    email = json['email'];
    profilURL = json['profilURL'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'firstName': firstName,
        'name': name,
        'email': email,
        'profilURL': profilURL,
      };
}