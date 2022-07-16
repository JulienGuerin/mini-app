import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/post.dart';
import '../models/user.dart';

class Database{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> createNewUser(UserModel user) async {
    try {
      await _firestore.collection('users').doc(user.id).set({
        'firstName': user.firstName,
        'name': user.name,
        'email': user.email,
        'profilURL': user.profilURL,
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

   Future<bool> updateUser(UserModel user) async {
    try {
      await _firestore.collection('users').doc(user.id).update({
        'firstName': user.firstName,
        'name': user.name,
        'email': user.email,
        'profilURL': user.profilURL,
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> deleteUser(id) async {
    try {
      await _firestore.collection('users').doc(id).delete();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<UserModel> getUser(String uid) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection('users').doc(uid).get();

      return UserModel.fromDocumentSnapshot(documentSnapshot: doc);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
  

  Future<bool> createNewPost(PostModel post) async {
    try {
      await _firestore.collection('posts').doc().set({
        'name': post.name,
        'time': post.time,
         'desc': post.desc,
        'profilURL': post.profilURL,
        'photoURL': post.photoURL,
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> deletePost(id) async {
    try {
      await _firestore.collection('posts').doc(id).delete();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<PostModel> getPost(String uid) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection('posts').doc(uid).get();

      return PostModel.fromDocumentSnapshot(documentSnapshot: doc);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Stream<List<PostModel>> postsStream() {
    return _firestore
        .collection('posts')
        .snapshots()
        .map((QuerySnapshot query) {
      List<PostModel> posts = [];
      for (var post in query.docs) {
        final postModel =
            PostModel.fromDocumentSnapshot(documentSnapshot: post);
        posts.add(postModel);
      }
      return posts;
    });
  }
}