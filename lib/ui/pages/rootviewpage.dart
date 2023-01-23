import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_lastest/bloc/themeblocfile/theme_bloc.dart';
import 'package:project_lastest/ui/pages/counterblocpage.dart';
import 'package:project_lastest/ui/pages/counterstatefulpage.dart';
import 'package:project_lastest/ui/pages/gituserspage.dart';
import 'package:project_lastest/ui/pages/homepage.dart';

class RootView extends StatelessWidget {
  const RootView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          theme: state.themeData,
          routes: {
            "/": (context) => const Homepage(),
            "counter1": (context) => const CounterStateFul(),
            "counter2": (context) => const CounterBlocPage(),
            "users": (context) => const GitUsersPage(),
          },
        );
      },
    );
  }
}