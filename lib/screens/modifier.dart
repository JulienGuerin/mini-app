import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/styles.dart';

class Modifier extends StatelessWidget {
  const Modifier({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modifier', style: compteModifierTitleText,),
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
        child: Column(
          children: [
            GestureDetector(
              onTap: () => Get.toNamed('/infos-perso'),
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
                            'Informationds personnelles',
                            style: compteNameText,
                          ),
                          Text(
                            'Nom, Prénom, Date de naissance..',
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
