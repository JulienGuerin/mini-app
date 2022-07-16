import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


const primaryColor = Color(0xFF02132B);
const backgroundColor = Color(0xFFFFFFFF);
const greyIconColor = Color(0xFF9299A4);
const textLightColor = Color(0xFFA7ADB5);
const textCardColor = Color(0xFF88888B);
const bottomBarIconColor = Color(0xFF26292B);
const snackBarColor = Color(0xFF34E694);
const mailCompteColor = Color(0xFFF5F5F5);
const iconTrailingCompteColor = Color(0xFFC3C3C3);
const textCompteColor = Color(0xFF222222);
const subtextCompteColor = Color(0xFFBBBBBB);
const barBottomSheetColor = Color(0xFFDBDBDB);
const closeColor = Color(0xFFD8D8D8);

MaterialColor materialPrimaryColor = MaterialColor(0xFF02132B, color);

Map<int, Color> color =
{
50:const Color(0xFF02132B),
100:const Color(0xFF02132B),
200:const Color(0xFF02132B),
300:const Color(0xFF02132B),
400:const Color(0xFF02132B),
500:const Color(0xFF02132B),
600:const Color(0xFF02132B),
700:const Color(0xFF02132B),
800:const Color(0xFF02132B),
900:const Color(0xFF02132B),
};

TextStyle title =
  const TextStyle(color: primaryColor, fontSize: 23, fontWeight: FontWeight.bold);

TextStyle subTitle = 
  const TextStyle(color: primaryColor, fontSize: 17, fontWeight: FontWeight.w600);

TextStyle subTitleEndCompte = 
  const TextStyle(color: primaryColor, fontSize: 14, fontWeight: FontWeight.w500);

TextStyle dialogTitleText = 
  const TextStyle(color: primaryColor, fontSize: 19, fontWeight: FontWeight.w600);

TextStyle checkBoxText = 
  TextStyle(color: primaryColor.withOpacity(0.75), fontSize: 11, fontWeight: FontWeight.w500);

TextStyle labelText = 
  const TextStyle(color: primaryColor, fontSize: 12, fontWeight: FontWeight.w500);

TextStyle hintText = 
  TextStyle(color: primaryColor.withOpacity(0.41), fontSize: 13, fontWeight: FontWeight.w500);

TextStyle greyCGVText = 
  TextStyle(color: primaryColor.withOpacity(0.35), fontSize: 13, fontWeight: FontWeight.w500);

TextStyle buttonText = 
  const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600);

TextStyle greyText = 
  const TextStyle(color: textLightColor, fontSize: 14, fontWeight: FontWeight.w500);

TextStyle helloText = 
  GoogleFonts.openSans(color: primaryColor.withOpacity(0.35), fontSize: 14, fontWeight: FontWeight.w600);

TextStyle helloTitleText = 
  GoogleFonts.openSans(color: primaryColor, fontSize: 24, fontWeight: FontWeight.w600);

TextStyle titlePostText = 
  GoogleFonts.openSans(color: primaryColor, fontSize: 15, fontWeight: FontWeight.w600);

TextStyle namePostText = 
  GoogleFonts.openSans(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600);

TextStyle namePostPageText = 
  GoogleFonts.openSans(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600);

TextStyle timePostText = 
  GoogleFonts.openSans(color: textCardColor, fontSize: 12, fontStyle: FontStyle.italic);

TextStyle descPostText = 
  GoogleFonts.openSans(color: textCardColor, fontSize: 12, fontWeight: FontWeight.w500);

TextStyle createPostTitleText = 
  const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold);

TextStyle createDescText = 
  const TextStyle(color: primaryColor, fontSize: 13, fontWeight: FontWeight.w500);

TextStyle snackBarTitleText = 
  const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600);

TextStyle snackBarDescText = 
  const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500);

TextStyle compteNameTitleText = 
  const TextStyle(color: primaryColor, fontSize: 20, fontWeight: FontWeight.bold);

TextStyle compteMailText = 
  const TextStyle(color: textLightColor, fontSize: 13, fontWeight: FontWeight.w500);

TextStyle compteTitleSectionText = 
  const TextStyle(color: primaryColor, fontSize: 16, fontWeight: FontWeight.w600);

TextStyle compteNameText = 
  const TextStyle(color: textCompteColor, fontSize: 13, fontWeight: FontWeight.w500);

TextStyle compteMailSecondaireText = 
  const TextStyle(color: subtextCompteColor, fontSize: 10, fontWeight: FontWeight.w500);

TextStyle compteSubText = 
  const TextStyle(color: subtextCompteColor, fontSize: 11, fontWeight: FontWeight.w500);

TextStyle compteModifierTitleText = 
  const TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w600);

TextStyle compteModifLabelText = 
  const TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.w500);

TextStyle compteHintText = 
  const TextStyle(color: primaryColor, fontSize: 13, fontWeight: FontWeight.w500);

String lorem = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. Cras elementum ultrices diam. Maecenas ligula massa, varius a, semper congue, euismod non, mi. \n\nProin porttitor, orci nec nonummy molestie, enim est eleifend mi, non fermentum diam nisl sit amet erat. Duis semper. Duis arcu massa, scelerisque vitae, consequat in, pretium a, enim. Pellentesque congue. Ut in risus volutpat libero pharetra tempor. Cras vestibulum bibendum augue. Praesent egestas leo in pede. Praesent blandit odio eu enim. Pellentesque sed dui ut augue blandit sodales. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aliquam nibh. Mauris ac mauris sed pede pellentesque fermentum. Maecenas adipiscing ante non diam sodales hendrerit. Ut velit mauris, egestas sed, gravida nec, ornare ut, mi. Aenean ut orci vel massa suscipit pulvinar. Nulla sollicitudin. Fusce varius, ligula non tempus aliquam, nunc turpis ullamcorper nibh, in tempus sapien eros vitae ligula. Pellentesque rhoncus nunc et augue. Integer id felis. Curabitur aliquet pellentesque diam. Integer quis metus vitae elit lobortis egestas. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi vel erat non mauris convallis vehicula. Nulla et sapien. Integer tortor tellus, aliquam faucibus, convallis id, congue eu, quam. Mauris ullamcorper felis vitae erat. Proin feugiat, augue non elementum posuere, metus purus iaculis lectus, et tristique ligula justo vitae magna.';