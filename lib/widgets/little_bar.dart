import 'package:flutter/material.dart';

import '../constants/styles.dart';

class LittleBar extends StatelessWidget {
  const LittleBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      width: 43,
      margin: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: barBottomSheetColor,
      ),
    );
  }
}
