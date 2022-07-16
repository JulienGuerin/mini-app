import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/styles.dart';
import 'add_desc.dart';

class PicImage extends StatelessWidget {
  const PicImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Choisissez une image',
            style: createPostTitleText,
          ),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: () {},
            child: DottedBorder(
              color: primaryColor.withOpacity(0.41),
              borderType: BorderType.RRect,
              radius: const Radius.circular(8),
              padding: const EdgeInsets.all(6),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                child: SizedBox(
                  height: Get.height * 0.65,
                  width: double.infinity,
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
              ),
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: primaryColor.withOpacity(.3),
              minimumSize: const Size.fromHeight(50),
            ),
            onPressed: () => Get.to(AddDesc()),
            child: Text(
              'Suivant',
              style: buttonText,
            ),
          ),
        ]),
      ),
    );
  }
}
