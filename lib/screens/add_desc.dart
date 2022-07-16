import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/styles.dart';
import '../controllers/auth_controller.dart';
import '../controllers/user_controller.dart';
import '../models/post.dart';
import '../services/database.dart';

class AddDesc extends StatelessWidget {
  AddDesc({Key? key}) : super(key: key);

  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: textCompteColor,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 30,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Ajouter une description',
            style: createPostTitleText,
          ),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: Get.height * 0.65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: primaryColor.withOpacity(.03),
              ),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Décrivez votre post..',
                      style: hintText,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: primaryColor.withOpacity(.3),
              minimumSize: const Size.fromHeight(50),
            ),
            onPressed: () async {
              PostModel post = PostModel(
                id: AuthController.instance.userFirebase.value!.uid,
                name:
                    '${userController.user.firstName} ${userController.user.name}',
                time: '22 min',
                desc:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
                profilURL: userController.user.profilURL,
                photoURL:
                    'https://images.unsplash.com/photo-1634111564236-486610630975?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fGNhc3RlbHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60',
              );
              if (await Database().createNewPost(post)) {
                Get.back();
                Get.back();
                Get.snackbar(
                  'Poste publié !',
                  'Votre poste a bien été publié.',
                  colorText: Colors.white,
                  backgroundColor: snackBarColor,
                );
              }
            },
            child: Text(
              'Publier',
              style: buttonText,
            ),
          ),
        ]),
      ),
    );
  }
}
