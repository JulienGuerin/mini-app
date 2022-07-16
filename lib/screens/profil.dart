import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/styles.dart';
import '../widgets/textfield.dart';

class Profil extends StatelessWidget {
  Profil({Key? key}) : super(key: key);

  final TextEditingController nomController = TextEditingController();
  final TextEditingController prenomController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: primaryColor),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
        child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 55.0, right: 55.0, bottom: 40.0),
                child: Text(
                  'Créez votre profil',
                  style: title,
                  textAlign: TextAlign.center,
                ),
              ),
              Column(
                children: [
                  Textfield(
                    obscureText: false,
                    label: 'Nom*',
                    hint: 'Ex. Doe',
                    erreurMessage: 'Entrer un nom',
                    emailController: nomController,
                    visibilityIcon: false,
                  ),
                  const SizedBox(height: 20),
                  Textfield(
                    obscureText: false,
                    label: 'Prénom*',
                    hint: 'Ex. John',
                    erreurMessage: 'Entrer un prénom',
                    emailController: prenomController,
                    visibilityIcon: false,
                  ),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Photo de profil*',
                        style: labelText,
                      ),
                      Container(
                        height: Get.height * 0.15,
                        width: double.infinity,
                        color: primaryColor.withOpacity(.03),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.cloud_upload_outlined,
                              color: primaryColor.withOpacity(0.41),
                            ),
                            Text(
                              'Appuyer pour choisir une photo',
                              style: hintText,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () {
                  Get.toNamed('/home');
                },
                child: Text(
                  'Terminer l\'inscription',
                  style: buttonText,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                '* Les champs marqués sont obligatoires',
                style: labelText,
                textAlign: TextAlign.center,
              ),
            ]),
      ),
    );
  }
}
