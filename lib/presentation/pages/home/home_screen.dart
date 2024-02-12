import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notif/presentation/pages/home/home_bloc/home_bloc.dart';
import 'package:notif/presentation/pages/home/home_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = 'home';

  @override
  Widget build(BuildContext context) => BlocProvider<NotificationCubit>(
        create: (BuildContext context) => NotificationCubit(),
        child: const HomeLayout(),
      );
}
