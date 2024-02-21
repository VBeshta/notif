import 'dart:async';
import 'package:rive/rive.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notif/core/context_extension.dart';
import 'package:notif/presentation/atomic/molecule/primary_button.dart';
import 'package:notif/presentation/atomic/organism/screen.dart';
import 'package:notif/presentation/atomic/organism/time_form_widget.dart';
import 'package:notif/presentation/pages/home/home_screen.dart';

class LoginLayout extends StatelessWidget {
  const LoginLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScreenWidget(
      titleText: 'Log in',
      body: LoginBody(),
    );
  }
}

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final FocusNode buttonFocusNode = FocusNode();

  String _currentTime = '';
  String _enteredTime = '';

  late Timer timer;

  @override
  void initState() {
    _currentTime = _formatDateTime(DateTime.now());
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 72.0),
              child: Column(
                children: [
                  Text(
                    'Log in',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Enter current time in hh : mm format',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: const Color.fromRGBO(116, 115, 119, 1),
                        ),
                  ),
                  const SizedBox(
                    height: 42,
                  ),
                  Text(
                    _currentTime,
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 42,
                  ),
                  TimeFormWidget(
                    onSubmit: (String value) => _enteredTime = value,
                  ),
                ],
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                width: 300,
                height: 300,
                child: RiveAnimation.asset(
                  'assets/animations/cat_bread.riv',
                  stateMachines: ['loading'],
                ),
              ),
              if (!timeFromFormEqualsCurrentTime && _enteredTime.length == 4)
                Container(
                  decoration: const BoxDecoration(color: Color(0xFFF3F3F4)),
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.info_outline_rounded,
                        color: Color(0xFFF43528),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'The time is wrong. Try again.',
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              color: const Color(0xFFF43528),
                            ),
                      ),
                    ],
                  ),
                ),
              PrimaryButton(
                focusNode: buttonFocusNode,
                onButtonPressed: _enteredTime.isNotEmpty
                    ? () {
                        if (timeFromFormEqualsCurrentTime) {
                          context.r.pushReplacement(HomeScreen.routeName);
                        }
                      }
                    : null,
                buttonText: 'Confirm',
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() => _currentTime = formattedDateTime);
  }

  String _formatDateTime(DateTime time) => DateFormat(DateFormat.HOUR24_MINUTE)
      .format(time); //TODO: move to utils, maybe as extension

  bool get timeFromFormEqualsCurrentTime => _enteredTime == _currentTime;

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
