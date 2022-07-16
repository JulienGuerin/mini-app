import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../constants/styles.dart';
import '../controllers/auth_controller.dart';
import '../controllers/bool_controller.dart';
import '../widgets/little_bar.dart';
import '../widgets/textfield.dart';

class CreationCompte extends StatelessWidget {
  CreationCompte({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController emailTwoController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordTwoController = TextEditingController();
  final BoolController boolController = Get.put(BoolController());

  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: primaryColor),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
        child: Column(children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 55.0, right: 55.0, bottom: 80.0),
            child: Text(
              'Créez un compte.',
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
                const SizedBox(height: 20),
                Textfield(
                  obscureText: true,
                  label: 'Confirmation mot de passe',
                  hint: 'Confirmation mot de passe',
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
            onPressed: () => openBottomSheet(box),
            child: Text(
              'Connexion',
              style: buttonText,
            ),
          ),
        ]),
      ),
    );
  }

  void openBottomSheet(GetStorage box) {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    if (passwordController.text != passwordTwoController.text) {
      Get.snackbar(
        'Erreur',
        'Mot de passe différents !',
        colorText: Colors.white,
        backgroundColor: snackBarColor,
      );
      return;
    }
    Get.bottomSheet(
      Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
          color: Colors.white,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const LittleBar(),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 48.0),
                child: Text(
                  'CGVU et politique de confidentialité',
                  textAlign: TextAlign.center,
                  style: subTitle,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SizedBox(
                  height: Get.height * 0.5,
                  child: SingleChildScrollView(
                    child: Text(
                      lorem,
                      textAlign: TextAlign.center,
                      style: greyText,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Obx(() => CheckboxListTile(
                    title: Text(
                      'J\'accepte la politique de confidentialité et les conditions générales de ventes et d\'utilisation.',
                      style: checkBoxText,
                    ),
                    value: boolController.cgvCheckbox.value,
                    onChanged: (newValue) {
                      boolController.cgvCheckbox.value = newValue!;
                      box.write(
                          'cgvCheckbox', boolController.cgvCheckbox.value);
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  )),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size.fromWidth(180),
                  maximumSize: const Size.fromHeight(60),
                ),
                onPressed: dialogBoite,
                child: Text(
                  'Continuer',
                  style: buttonText,
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
      isScrollControlled: true,
    );
  }

  void dialogBoite() {
    AuthController.instance
        .register(emailController.text.trim(), passwordController.text.trim());

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
                const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 8.0),
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
              'Un email de vérification vous a été envoyé à l\'adresse john*****gmail.com',
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
