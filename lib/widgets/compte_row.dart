import 'package:flutter/material.dart';

import '../constants/styles.dart';

class CompteRow extends StatelessWidget {
  final String urlprofil;
  final String name;
  final String desc;
  final Icon icon;
  final bool haveUrl;
  final Widget widget;
  const CompteRow({
    Key? key,
    required this.urlprofil,
    required this.name,
    required this.desc,
    required this.icon,
    required this.haveUrl,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      margin: const EdgeInsets.only(top: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: mailCompteColor.withOpacity(.67),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            width: 50,
            height: 50,
            child: haveUrl
                ? CircleAvatar(
                    backgroundColor: subtextCompteColor,
                    backgroundImage: NetworkImage(urlprofil),
                  )
                : CircleAvatar(
                    backgroundColor: primaryColor,
                    child: icon,
                  ),
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: compteNameText,
                ),
                Text(
                  desc,
                  style: compteSubText,
                ),
              ],
            ),
          ),
          widget,
        ],
      ),
    );
  }
}
