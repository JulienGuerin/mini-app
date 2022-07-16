import 'package:flutter/material.dart';

import '../constants/styles.dart';

class Textfield extends StatelessWidget {
  final String label;
  final String hint;
  final String erreurMessage;
  final bool visibilityIcon;
  final bool obscureText;
  final TextEditingController emailController;
  const Textfield({
    Key? key,
    required this.label,
    required this.hint,
    required this.erreurMessage,
    required this.visibilityIcon,
    required this.obscureText,
    required this.emailController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: labelText,
        ),
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: primaryColor.withOpacity(.03),
          ),
          child: TextFormField(
              obscureText: obscureText,
              decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: hintText,
                  border: InputBorder.none,
                  suffixIcon: visibilityIcon
                      ? IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.visibility,
                            color: subtextCompteColor,
                          ),
                        )
                      : const SizedBox()),
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return erreurMessage;
                }
                return null;
              },
            ),
        ),
      ],
    );
  }
}
