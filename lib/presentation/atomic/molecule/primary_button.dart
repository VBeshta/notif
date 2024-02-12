import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.onButtonPressed,
    required this.buttonText,
    required this.focusNode,
    this.padding,
  });

  final VoidCallback? onButtonPressed;
  final String buttonText;
  final FocusNode focusNode;
  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ??
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
      child: FilledButton(
        focusNode: focusNode,
        onPressed: onButtonPressed,
        style: FilledButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          minimumSize: const Size(double.infinity, 56),
        ),
        child: Text(
          buttonText,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Colors.white, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
