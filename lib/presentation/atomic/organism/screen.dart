import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomScreenWidget extends StatelessWidget {
  const CustomScreenWidget({
    super.key,
    required this.titleText,
    this.body,
    this.titleWidget,
  });

  final String titleText;
  final Widget? body;
  final Widget? titleWidget;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: TitleLabel(titleText: titleText),
          bottom: titleWidget != null
              ? PreferredSize(
                  preferredSize: const Size.fromHeight(72),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 24.0,
                      left: 16,
                      right: 16,
                      bottom: 16,
                    ),
                    child: titleWidget!,
                  ),
                )
              : null,
          backgroundColor: Colors.black,
        ),
        body: body,
      ),
    );
  }
}

class TitleLabel extends StatelessWidget {
  const TitleLabel({
    super.key,
    required this.titleText,
  });

  final String titleText;

  @override
  Widget build(BuildContext context) {
    return Text(
      titleText,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
    );
  }
}
