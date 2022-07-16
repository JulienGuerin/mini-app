import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/styles.dart';

class DescPost extends StatelessWidget {
  final String urlprofil;
  final String name;
  final String time;
  final String desc;
  final bool postFocus;
  const DescPost({Key? key, required this.urlprofil, required this.name, required this.time, required this.desc, required this.postFocus}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black54,
                Colors.black87,
                Colors.black87,
                Colors.black87,
              ],
            )
      ),
      padding: postFocus ? const EdgeInsets.symmetric(vertical: 32.0, horizontal: 24.0) : const EdgeInsets.all(20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            width: 50,
            height: 50,
            child: CircleAvatar(
              backgroundColor: subtextCompteColor,
              backgroundImage: NetworkImage(urlprofil),
            ),
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: name,
                    style: namePostPageText,
                    children: <TextSpan>[
                      TextSpan(
                        text: time,
                        style: timePostText,
                      )
                    ],
                  ),
                ),
                Text(
                  desc,
                  style: descPostText,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
