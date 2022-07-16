import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniapp/controllers/auth_controller.dart';
import 'package:miniapp/services/database.dart';

import '../constants/styles.dart';
import '../controllers/user_controller.dart';
import '../models/user.dart';
import '../widgets/textfield.dart';

class InfosPerso extends StatelessWidget {
  InfosPerso({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nomController = TextEditingController();
  final TextEditingController prenomController = TextEditingController();
  final UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Infos personnelles',
          style: compteModifierTitleText,
        ),
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
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Textfield(
                obscureText: false,
                label: 'Prénom*',
                hint: userController.user.id.isEmpty ? 'Anna': userController.user.firstName,
                erreurMessage: 'Entrer un prénom',
                emailController: prenomController,
                visibilityIcon: false,
              ),
              const SizedBox(height: 20),
              Textfield(
                obscureText: false,
                label: 'Nom*',
                hint: userController.user.id.isEmpty ? 'Clark': userController.user.name,
                erreurMessage: 'Entrer un nom',
                emailController: nomController,
                visibilityIcon: false,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () async {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }
                  UserModel user = UserModel(
                    id: AuthController.instance.userFirebase.value!.uid,
                    firstName: prenomController.text.trim(),
                    name: nomController.text.trim(),
                    email: AuthController.instance.userFirebase.value!.email
                        .toString(),
                    profilURL:
                        'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8cm91c3NlJTIwZmFjZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60',
                  );
                  if (await Database().createNewUser(user)) {
                    userController.user =
                        await Database().getUser(AuthController.instance.userFirebase.value!.uid);
                  }
                },
                child: Text(
                  'Enregistrer',
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
}
