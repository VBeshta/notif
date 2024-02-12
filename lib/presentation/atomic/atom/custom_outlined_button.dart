import 'package:flutter/material.dart';

class CustomOutlinedButton extends OutlinedButton {
  CustomOutlinedButton({
    super.key,
    required String textLabel,
    required void Function() super.onPressed,
  }) : super(
          child: Text(textLabel),
          style: ButtonStyle(
            side: MaterialStateProperty.resolveWith<BorderSide>(
              (Set<MaterialState> states) => const BorderSide(
                color: Color.fromRGBO(106, 77, 186, 1),
              ),
            ),
            shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
              (Set<MaterialState> states) => RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            textStyle: MaterialStateProperty.resolveWith<TextStyle>(
              (Set<MaterialState> states) => const TextStyle(
                color: Color.fromRGBO(106, 77, 186, 1),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        );
}
