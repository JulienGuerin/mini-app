import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  late String id;
  late String name;
  late String time;
  late String desc;
  late String profilURL;
  late String photoURL;

  PostModel({
    required this.id,
    required this.name,
    required this.time,
    required this.desc,
    required this.profilURL,
    required this.photoURL,
  });

  PostModel.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
    id = documentSnapshot.id;
    name = documentSnapshot['name'];
    time = documentSnapshot['time'];
    desc = documentSnapshot['desc'];
    profilURL = documentSnapshot['profilURL'];
    photoURL = documentSnapshot['photoURL'];
  }

  PostModel.fromJson(json) {
    id = json['id'];
    name = json['name'];
    time = json['time'];
    desc = json['desc'];
    profilURL = json['profilURL'];
    photoURL = json['photoURL'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'time': time,
        'desc': desc,
        'profilURL': profilURL,
        'photoURL': photoURL,
      };
}