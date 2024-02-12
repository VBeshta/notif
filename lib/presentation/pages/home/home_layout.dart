import 'package:flutter/material.dart';
import 'package:notif/presentation/atomic/molecule/primary_button_with_icon.dart';
import 'package:notif/presentation/atomic/organism/notification_item.dart';
import 'package:notif/presentation/atomic/organism/screen.dart';
import 'package:notif/presentation/atomic/organism/two_option_switch.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  var isFirstItemSelected = true;
  @override
  Widget build(BuildContext context) {
    return CustomScreenWidget(
      titleText: 'Notifications',
      titleWidget: TwoOptionSwitcher(
        //https://api.flutter.dev/flutter/cupertino/CupertinoSlidingSegmentedControl-class.html
        onPressed: () =>
            setState(() => isFirstItemSelected = !isFirstItemSelected),
        isFirstItemSelected: isFirstItemSelected,
        options: const ['One-time', 'Reccuring'],
      ),
      body: ListView(
        children: [
          NotificationItem(
            dateTime: DateTime.now(),
            description: 'Don\'t forget to do this',
            onTriggerOne: () {},
            onTriggerTwo: () {},
            onRemove: () {},
          ),
          PrimaryButtonWithIcon(
            focusNode: FocusNode(),
            onButtonPressed: () {},
            buttonText: 'Add new notification',
          ),
        ],
      ),
    );
  }
}
