import 'package:flutter/material.dart';
import 'package:notif/presentation/atomic/atom/digit_text_field.dart';

class TimeFormWidget extends StatefulWidget {
  const TimeFormWidget({
    super.key,
    required this.onSubmit,
    this.mainAxisAlignment,
  });

  final void Function(String value) onSubmit;
  final MainAxisAlignment? mainAxisAlignment;

  @override
  State<TimeFormWidget> createState() => _TimeFormWidgetState();
}

class _TimeFormWidgetState extends State<TimeFormWidget> {
  final FocusNode _focusNode1 = FocusNode();
  final TextEditingController controller1 = TextEditingController();
  final FocusNode _focusNode2 = FocusNode();
  final TextEditingController controller2 = TextEditingController();
  final FocusNode _focusNode3 = FocusNode();
  final TextEditingController controller3 = TextEditingController();
  final FocusNode _focusNode4 = FocusNode();
  final TextEditingController controller4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: widget.mainAxisAlignment ?? MainAxisAlignment.center,
      children: [
        DigitTextField(
          focusNode: _focusNode1,
          controller: controller1,
          nextFocusNode: _focusNode2,
          onChanged: onChanged,
        ),
        const SizedBox(
          width: 12,
        ),
        DigitTextField(
          focusNode: _focusNode2,
          controller: controller2,
          nextFocusNode: _focusNode3,
          onChanged: onChanged,
        ),
        const SizedBox(
          width: 12,
        ),
        Text(
          ':',
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                fontWeight: FontWeight.w700,
                color: const Color(0xFFB8B8B8),
              ),
        ),
        const SizedBox(
          width: 12,
        ),
        DigitTextField(
          focusNode: _focusNode3,
          controller: controller3,
          nextFocusNode: _focusNode4,
          onChanged: onChanged,
        ),
        const SizedBox(
          width: 12,
        ),
        DigitTextField(
          focusNode: _focusNode4,
          controller: controller4,
          onChanged: onChanged,
        ),
      ],
    );
  }

  void onChanged() => widget.onSubmit(_enteredTime);

  String get _enteredTime =>
      '${controller1.text}${controller2.text}:${controller3.text}${controller4.text}';
}
