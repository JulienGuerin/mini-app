import 'package:flutter/material.dart';

import '../constants/styles.dart';

class CompteRowText extends StatelessWidget {
  final String name;
  const CompteRowText({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.only(left: 24.0, right: 12),
      margin: const EdgeInsets.only(top: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: mailCompteColor.withOpacity(.67),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
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
