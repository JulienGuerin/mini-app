import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/styles.dart';
import '../controllers/auth_controller.dart';
import '../widgets/textfield.dart';

class AdresseMail extends StatelessWidget {
  AdresseMail({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController mailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Adresse email',
          style: compteModifierTitleText,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: textCompteColor,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Obx(() => Textfield(
                    obscureText: false,
                    label: 'Adresse email*',
                    hint: AuthController.instance.userFirebase.value != null
                        ? AuthController.instance.userFirebase.value!.email
                            .toString()
                        : 'marie.doe@gmail.com',
                    erreurMessage: 'Entrer un email',
                    emailController: mailController,
                    visibilityIcon: false,
                  )),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }
                  AuthController.instance
                      .resetEmail(mailController.text.trim());
                  dialogBoite();
                },
                child: Text(
                  'Modifier',
                  style: buttonText,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                '* Les champs sont obligatoires',
                style: greyText,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void dialogBoite() {
    Get.defaultDialog(
      title: '',
      titleStyle: const TextStyle(fontSize: 0),
      content: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 12.0),
            child: IconButton(
              padding: const EdgeInsets.all(0),
              icon: const Icon(
                Icons.close,
                color: closeColor,
                size: 30,
              ),
              onPressed: () {
                Get.back();
              },
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 8.0),
            child: Text(
              'Confirmez votre adresse email',
              style: dialogTitleText,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
            child: Text(
              'Vous venez de recevoir un email de vérification sur john*****com',
              style: greyText,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              Get.toNamed('/profil');
            },
            style: ElevatedButton.styleFrom(
              fixedSize: const Size.fromWidth(150),
              maximumSize: const Size.fromHeight(60),
            ),
            child: Text(
              'Fermer',
              style: buttonText,
            ),
          ),
        ],
      ),
    );
  }
}
