import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String lable;
  final IconData icons;
  final TextEditingController Onchange;
  final bool obscureText;
  const MyTextField(
      {super.key,
      required this.lable,
      required this.icons,
      required this.obscureText,
      required this.Onchange});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            obscureText: obscureText,
            controller: Onchange,
            decoration: InputDecoration(
              prefixIcon: Icon(icons),
              filled: true,
              hintText: lable,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        )
      ],
    );
  }
}
