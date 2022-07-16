import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniapp/services/database.dart';
import 'package:miniapp/widgets/avatar_circle.dart';
import 'package:miniapp/widgets/compte_row.dart';
import 'package:miniapp/widgets/compte_row_text.dart';
import 'package:get_storage/get_storage.dart';

import '../constants/styles.dart';
import '../controllers/auth_controller.dart';
import '../controllers/bool_controller.dart';
import '../controllers/user_controller.dart';
import '../widgets/compte_row_text_leading_icon.dart';

class Settings extends StatelessWidget {
  Settings({Key? key}) : super(key: key);

  final UserController userController = Get.put(UserController());
  final BoolController boolController = Get.put(BoolController());

  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: IconButton(
              icon: const Icon(
                Icons.more_horiz,
                size: 30,
              ),
              onPressed: () {
                final action = CupertinoActionSheet(
                  message: const Text(
                    'Que souhaitez-vous faire ?',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  actions: <Widget>[
                    CupertinoActionSheetAction(
                      isDestructiveAction: true,
                      onPressed: () {
                        AuthController.instance.logOut();
                      },
                      child: const Text('Se déconnecter'),
                    ),
                    CupertinoActionSheetAction(
                      isDestructiveAction: true,
                      onPressed: () {
                        Get.back();
                        dialogBoite();
                      },
                      child: const Text('Supprimer mon profil'),
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

                showCupertinoModalPopup(
                    context: context, builder: (context) => action);
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(bottom: 24.0),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: primaryColor.withOpacity(.2)),
                    ),
                  ),
                  child: Column(
                    children: [
                      AvatarCircle(),
                      GestureDetector(
                        onTap: () => Get.toNamed('/modifier'),
                        child: Obx(() => Column(
                              children: [
                                Text(
                                  '${userController.user.firstName} ${userController.user.name}',
                                  style: compteNameTitleText,
                                ),
                                Text(
                                  userController.user.email,
                                  style: compteMailText,
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mon compte',
                        style: compteTitleSectionText,
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 4),
                      GestureDetector(
                        onTap: () => Get.toNamed('/modifier'),
                        child: Obx(() => CompteRow(
                              urlprofil: userController.user.profilURL.isEmpty
                                  ? 'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8cm91c3NlJTIwZmFjZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60'
                                  : userController.user.profilURL,
                              name: userController.user.firstName.isEmpty
                                  ? 'John Doe'
                                  : '${userController.user.firstName} ${userController.user.name}',
                              desc: userController.user.email.isEmpty
                                  ? 'john.doe@gmail.com'
                                  : userController.user.email,
                              icon: const Icon(Icons.lock),
                              haveUrl: true,
                              widget: const Icon(
                                Icons.arrow_forward_ios,
                                color: iconTrailingCompteColor,
                                size: 20,
                              ),
                            )),
                      ),
                      GestureDetector(
                        onTap: () => Get.toNamed('/securite'),
                        child: const CompteRow(
                          urlprofil: '',
                          name: 'Sécurité',
                          desc: 'Mot de passe, email..',
                          icon: Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),
                          haveUrl: false,
                          widget: Icon(
                            Icons.arrow_forward_ios,
                            color: iconTrailingCompteColor,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Paramètres',
                        style: compteTitleSectionText,
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 4),
                      CompteRow(
                        urlprofil: '',
                        name: 'Notification push',
                        desc: 'Activées',
                        icon: const Icon(
                          Icons.notifications_none,
                          color: Colors.white,
                        ),
                        haveUrl: false,
                        widget: Obx(
                          () => Switch(
                            value: boolController.isSwitched.value,
                            onChanged: (value) {
                              boolController.isSwitched.value = value;
                              box.write('isSwitched',
                                  boolController.cgvCheckbox.value);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Autres',
                        style: compteTitleSectionText,
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 4),
                      const CompteRow(
                        urlprofil: '',
                        name: 'Aide',
                        desc: 'Contactez-nous par email',
                        icon: Icon(
                          Icons.help_outline,
                          color: Colors.white,
                        ),
                        haveUrl: false,
                        widget: Icon(
                          Icons.arrow_forward_ios,
                          color: iconTrailingCompteColor,
                          size: 20,
                        ),
                      ),
                      const CompteRow(
                        urlprofil: '',
                        name: 'Partager l\'app',
                        desc: 'Soutenez-nous en partageant l\'app',
                        icon: Icon(
                          Icons.ios_share,
                          color: Colors.white,
                        ),
                        haveUrl: false,
                        widget: Icon(
                          Icons.arrow_forward_ios,
                          color: iconTrailingCompteColor,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Liens',
                        style: compteTitleSectionText,
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 4),
                      const CompteRowText(
                        name: 'Politique de confidentialité',
                      ),
                      const CompteRowText(
                        name:
                            'Conditions générales de ventes et d\'utilisation',
                      ),
                      const CompteRowText(
                        name: 'Mentions légales',
                      ),
                      const CompteRowText(
                        name: 'À propos',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Liens',
                        style: compteTitleSectionText,
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 4),
                      const CompteRowTextIcon(
                        name: 'Notre page Facebook de confidentialité',
                        color: Colors.blue,
                        icon: Icon(
                          Icons.facebook,
                          color: Colors.white,
                        ),
                      ),
                      const CompteRowTextIcon(
                        name: 'Notre Instagram',
                        color: Colors.pink,
                        icon: Icon(
                          Icons.photo_camera_outlined,
                          color: Colors.white,
                        ),
                      ),
                      const CompteRowTextIcon(
                        name: 'Notre Twitter',
                        color: Colors.lightBlue,
                        icon: Icon(
                          Icons.airplanemode_active_outlined,
                          color: Colors.white,
                        ),
                      ),
                      const CompteRowTextIcon(
                        name: 'Notre Snapchat',
                        color: Colors.yellow,
                        icon: Icon(
                          Icons.snapchat,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Édité par ',
                    style: subTitleEndCompte,
                    children: <TextSpan>[
                      TextSpan(
                        text: 'kosmos-digital.com',
                        style: subTitleEndCompte.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
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
              'Supprimer mon compte',
              style: dialogTitleText,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
            child: Text(
              'Souhaitez-vous vraiment supprimer votre compte ?',
              style: greyText,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () async {
              // Delete user from dataBase
              if (await Database().deleteUser(userController.user.id)) {
                Get.back();
                Get.back();
                Get.snackbar(
                  'Succes',
                  'Utilisateur supprimé de la base de donnée',
                  colorText: Colors.white,
                  backgroundColor: snackBarColor,
                );
              }
            },
            style: ElevatedButton.styleFrom(
              fixedSize: const Size.fromWidth(150),
              maximumSize: const Size.fromHeight(60),
            ),
            child: Text(
              'Oui',
              style: buttonText,
            ),
          ),
          TextButton(
              onPressed: () => Get.back(),
              child: Text(
                'Non',
                style: compteModifierTitleText,
              ))
        ],
      ),
    );
  }
}
