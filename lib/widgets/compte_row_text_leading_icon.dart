import 'package:flutter/material.dart';

import '../constants/styles.dart';

class CompteRowTextIcon extends StatelessWidget {
  final String name;
  final Icon icon;
  final Color color;
  const CompteRowTextIcon({
    Key? key,
    required this.name, required this.icon, required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
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
            child: CircleAvatar(
                    backgroundColor: color,
                    child: icon,
                  ),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Text(
              name,
              style: compteNameText,
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: iconTrailingCompteColor,
            size: 20,
          ),
        ],
      ),
    );
  }
}
