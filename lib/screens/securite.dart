import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/styles.dart';
import '../controllers/auth_controller.dart';

class Securite extends StatelessWidget {
  const Securite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sécurité',
          style: compteModifierTitleText,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: textCompteColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () => Get.toNamed('/mail'),
              child: Container(
                padding: const EdgeInsets.all(12.0),
                margin: const EdgeInsets.only(top: 8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: mailCompteColor.withOpacity(.67),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Adresse email',
                            style: compteNameText,
                          ),
                          Obx(() => Text(
                                AuthController.instance.userFirebase.value !=
                                        null
                                    ? AuthController
                                        .instance.userFirebase.value!.email
                                        .toString()
                                    : 'marie.doe@gmail.com',
                                style: compteSubText,
                              )),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: iconTrailingCompteColor,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Get.toNamed('/mot-de-passe'),
              child: Container(
                padding: const EdgeInsets.all(12.0),
                margin: const EdgeInsets.only(top: 8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: mailCompteColor.withOpacity(.67),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Mot de passe',
                            style: compteNameText,
                          ),
                          Text(
                            'Dernière modification : il y a 3j',
                            style: compteSubText,
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: iconTrailingCompteColor,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
