import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_lastest/bloc/counterblocfile/counter_bloc.dart';
import 'package:project_lastest/bloc/gituserblocfile/users_bloc.dart';
import 'package:project_lastest/ui/pages/counterblocpage.dart';
import 'package:project_lastest/ui/pages/counterstatefulpage.dart';
import 'package:project_lastest/ui/pages/gituserspage.dart';
import 'package:project_lastest/ui/pages/homepage.dart';
import 'package:project_lastest/ui/pages/rootviewpage.dart';

import 'bloc/themeblocfile/theme_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context)=>CounterBloc()),
          BlocProvider(create: (context)=>ThemeBloc()),
          BlocProvider(create: (context)=>UsersBloc()),
        ],
    child: const RootView());
  }
}




