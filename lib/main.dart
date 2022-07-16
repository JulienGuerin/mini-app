import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miniapp/screens/adresse_mail.dart';
import 'package:miniapp/screens/infos_perso.dart';
import 'package:miniapp/screens/modifier.dart';
import 'package:miniapp/screens/mot_de_passe.dart';
import 'package:miniapp/screens/pic_image.dart';

import 'constants/styles.dart';
import 'controllers/auth_controller.dart';
import 'controllers/user_controller.dart';
import 'screens/connexion.dart';
import 'screens/creation_compte.dart';
import 'screens/home_page.dart';
import 'screens/profil.dart';
import 'screens/securite.dart';
import 'screens/settings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mini App',
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        primarySwatch: materialPrimaryColor,
      ),
      getPages: [
        GetPage(name: '/', page: () => Connexion()),
        GetPage(name: '/creationCompte', page: () => CreationCompte()),
        GetPage(name: '/profil', page: () => Profil()),
        GetPage(name: '/home-page', page: () => HomePage()),
        GetPage(name: '/home', page: () => HomePage(),binding: BindingsBuilder(() => {Get.put(UserController())})),
        GetPage(name: '/settings', page: () => Settings()),
        GetPage(name: '/modifier', page: () => const Modifier()),
        GetPage(name: '/infos-perso', page: () => InfosPerso()),
        GetPage(name: '/securite', page: () => const Securite()),
        GetPage(name: '/mail', page: () => AdresseMail()),
        GetPage(name: '/mot-de-passe', page: () => MotDePasse()),
        GetPage(name: '/pic-image', page: () => const PicImage()),
      ],
      defaultTransition: Transition.topLevel,
      initialRoute: '/',
    );
  }
}
