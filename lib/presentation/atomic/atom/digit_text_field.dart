import 'package:flutter/material.dart';
import 'package:notif/core/context_extension.dart';

class DigitTextField extends StatefulWidget {
  const DigitTextField({
    super.key,
    required this.focusNode,
    required this.controller,
    this.nextFocusNode,
    required this.onChanged,
  });

  final FocusNode focusNode;
  final TextEditingController controller;
  final FocusNode? nextFocusNode;
  final VoidCallback onChanged;

  @override
  _DigitTextFieldState createState() => _DigitTextFieldState();
}

class _DigitTextFieldState extends State<DigitTextField> {
  static const int _maxLength = 1;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      maxLength: _maxLength,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.w700,
          ),
      focusNode: widget.focusNode,
      controller: widget.controller,
      onChanged: _handleOnChanged,
      textAlign: TextAlign.center,
      textAlignVertical: TextAlignVertical.top,
      decoration: InputDecoration(
        counterText: '',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(context.sp.small),
        ),
        constraints: const BoxConstraints.tightFor(width: 44, height: 48),
      ),
    );
  }

  void _handleOnChanged(String value) {
    if (value.length == 1) {
      widget.nextFocusNode != null
          ? widget.nextFocusNode!.requestFocus()
          : widget.focusNode.unfocus();
    }
    widget.onChanged();
  }
}
