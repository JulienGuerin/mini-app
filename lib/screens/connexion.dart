import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/styles.dart';
import '../controllers/auth_controller.dart';
import '../widgets/little_bar.dart';
import '../widgets/textfield.dart';

class Connexion extends StatelessWidget {
  Connexion({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController emailTwoController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48),
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 55.0, right: 55.0, bottom: 80.0),
                child: Text(
                  'Connectez-vous ou créez un compte.',
                  style: title,
                  textAlign: TextAlign.center,
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Textfield(
                      obscureText: false,
                      label: 'Adresse email',
                      hint: 'john.doe@gmail.com',
                      erreurMessage: 'Entrer une adresse mail',
                      emailController: emailController,
                      visibilityIcon: false,
                    ),
                    const SizedBox(height: 20),
                    Textfield(
                      obscureText: true,
                      label: 'Mot de passe',
                      hint: 'Mot de passe',
                      erreurMessage: 'Entrer un mot de passe',
                      emailController: passwordController,
                      visibilityIcon: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Mot de passe oublié ? ',
                  style: compteMailText,
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Réinitialiser',
                      style: compteMailText.copyWith(
                        decoration: TextDecoration.underline,
                        color: primaryColor,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = openBottomSheet,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50), // NEW
                ),
                onPressed: () {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }
                  AuthController.instance.login(emailController.text.trim(),
                      passwordController.text.trim());
                },
                child: Text(
                  'Connexion',
                  style: buttonText,
                ),
              ),
              const SizedBox(height: 40),
              const LittleBar(),
              const SizedBox(height: 12),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Pas de compte ? ',
                  style: compteMailText,
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Créer maintenant',
                      style: compteMailText.copyWith(
                          decoration: TextDecoration.underline,
                          color: primaryColor,
                          fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.toNamed('/creationCompte');
                        },
                    )
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  void openBottomSheet() {
    Get.bottomSheet(
      Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
          color: Colors.white,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey2,
            child: Column(
              children: [
                const LittleBar(),
                const SizedBox(height: 12),
                Text(
                  'Réinitialiser mot de passe',
                  textAlign: TextAlign.center,
                  style: subTitle,
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'Entrer l\'adresse email associée à votre compte. Nous vous enverrons un email de réinitialisation sur celle-ci.',
                    textAlign: TextAlign.center,
                    style: greyText,
                  ),
                ),
                const SizedBox(height: 20),
                Textfield(
                  obscureText: false,
                  label: 'Adresse email',
                  hint: 'john.doe@gmail.com',
                  erreurMessage: 'Entrer une adresse mail',
                  emailController: emailTwoController,
                  visibilityIcon: false,
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                  ),
                  onPressed: dialogReinitialiser,
                  child: Text(
                    'Réinitialiser',
                    style: buttonText,
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void dialogReinitialiser() {
    if (!_formKey2.currentState!.validate()) {
      return;
    }
    AuthController.instance.sendPasswordResetEmail(emailTwoController.text.trim());
    Get.defaultDialog(
      title: '',
      titleStyle: const TextStyle(fontSize: 0),
      content: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 12.0),
            child: IconButton(
              padding: EdgeInsets.zero,
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
                const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 8.0),
            child: Text(
              'Vérifiez votre boîte mail',
              style: dialogTitleText,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Vous avez reçu un email afin de réinitialiser votre mot de passe.',
              style: greyText,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              Get.back();
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
