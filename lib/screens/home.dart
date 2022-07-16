import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniapp/controllers/user_controller.dart';

import '../constants/styles.dart';
import '../controllers/posts_controller.dart';
import '../widgets/post.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final UserController userController = Get.put(UserController());
  final PostController postController = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: primaryColor.withOpacity(.2)),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(() => Text(
                          'Bonjour, ${userController.user.firstName} 👋',
                          style: helloText,
                        )),
                    Text(
                      'Fil d\'actualités',
                      style: helloTitleText,
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed('/settings');
                  },
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    width: 50,
                    height: 50,
                    child: Obx(() => CircleAvatar(
                          backgroundColor: subtextCompteColor,
                          backgroundImage: userController.user.profilURL.isEmpty
                              ? null
                              : NetworkImage(userController.user.profilURL),
                          child: userController.user.profilURL.isEmpty
                              ? Icon(
                                  Icons.person,
                                  size: 35,
                                  color: Colors.grey[50],
                                )
                              : null,
                        )),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0, left: 20.0, right: 20.0),
            child: Text(
              'Récents',
              style: titlePostText,
            ),
          ),
          Expanded(
            child: Obx(() => ListView.builder(
                itemCount: postController.posts.length,
                itemBuilder: (BuildContext context, int index) {
                  final postModel = postController.posts[index];
                  return Post(
                      id: postModel.id,
                      urlBackground: postModel.photoURL,
                      urlprofil: postModel.profilURL,
                      name: postModel.name,
                      time: '  ${postModel.time}',
                      desc: postModel.desc,
                      postFocus: false);
                })),
          ),
        ],
      ),
    );
  }
}
