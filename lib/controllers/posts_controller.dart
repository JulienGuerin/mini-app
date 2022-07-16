import 'package:get/get.dart';
import 'package:miniapp/services/database.dart';

import '../models/post.dart';

class PostController extends GetxController {
  Rx<List<PostModel>> postList = Rx<List<PostModel>>([]);
  List<PostModel> get posts => postList.value;

  @override
  void onReady() {
    postList.bindStream(Database().postsStream());
  }
}