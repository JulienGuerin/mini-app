import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniapp/controllers/auth_controller.dart';

import '../constants/styles.dart';
import '../controllers/bool_controller.dart';
import '../widgets/textfield.dart';

class MotDePasse extends StatelessWidget {
  MotDePasse({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController emailTwoController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordTwoController = TextEditingController();
  final BoolController boolController = Get.put(BoolController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mot de passe',
          style: compteModifierTitleText,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: textCompteColor,
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Textfield(
                    obscureText: false,
                    label: 'Mot de passe actuel*',
                    hint: 'Mot de passe',
                    erreurMessage: 'Entrer un mot de passe',
                    emailController: emailController,
                    visibilityIcon: false,
                  ),
                  const SizedBox(height: 20),
                  Textfield(
                    obscureText: true,
                    label: 'Nouveau mot de passe*',
                    hint: 'Nouveau mot de passe',
                    erreurMessage: 'Entrer un mot de passe',
                    emailController: passwordController,
                    visibilityIcon: true,
                  ),
                  const SizedBox(height: 20),
                  Textfield(
                    obscureText: true,
                    label: 'Confirmez nouveau mot de passe*',
                    hint: 'Confirmez nouveau mot de passe',
                    erreurMessage: 'Entrer un mot de passe',
                    emailController: passwordTwoController,
                    visibilityIcon: true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: dialogBoite,
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
    );
  }

  void dialogBoite() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    if (passwordController.text != passwordTwoController.text) {
      Get.snackbar(
        'Erreur',
        'Mot de passe différents !',
        colorText: Colors.white,
        backgroundColor: Colors.redAccent,
      );
      return;
    }
    AuthController.instance.changePassword(passwordController.text.trim());
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
              'Vérifiez votre boîte mail',
              style: dialogTitleText,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
            child: Text(
              'Vos nouveaux identifiants vous ont été envoyés par email !',
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
