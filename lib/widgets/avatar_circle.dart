import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/styles.dart';
import '../controllers/user_controller.dart';

class AvatarCircle extends StatelessWidget {
  AvatarCircle({Key? key}) : super(key: key);

  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final action = CupertinoActionSheet(
          message: const Text(
            'Que souhaitez-vous faire ?',
            style: TextStyle(fontSize: 15.0),
          ),
          actions: <Widget>[
            CupertinoActionSheetAction(
              isDefaultAction: true,
              onPressed: () {
                Get.back();
                // prendre photo
              },
              child: const Text(
                'Prendre une photo/vidéo',
                style: TextStyle(color: Colors.blue),
              ),
            ),
            CupertinoActionSheetAction(
              isDefaultAction: true,
              onPressed: () {
                Get.back();
                // biblio photo
              },
              child: const Text(
                'Bibliothèque photos/vidéos',
                style: TextStyle(color: Colors.blue),
              ),
            )
          ],
          cancelButton: CupertinoActionSheetAction(
            child: const Text(
              'Annuler',
              style: TextStyle(color: Colors.blue),
            ),
            onPressed: () {
              Get.back();
            },
          ),
        );

        showCupertinoModalPopup(context: context, builder: (context) => action);
      },
      child: Stack(
        children: [
          SizedBox(
            child: Container(
              padding: const EdgeInsets.all(8),
              width: 120,
              height: 120,
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
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: const BoxDecoration(
                  color: Colors.black87, shape: BoxShape.circle),
              child: const Icon(Icons.edit_outlined,
                  color: Colors.white, size: 16),
            ),
          ),
        ],
      ),
    );
  }
}
