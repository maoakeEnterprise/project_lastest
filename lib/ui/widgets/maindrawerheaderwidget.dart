import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_lastest/bloc/themeblocfile/theme_bloc.dart';

class MainDrawerHeader extends StatelessWidget {
  const MainDrawerHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.white, Theme.of(context).primaryColor]
            )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.amber,
              //backgroundImage : AssetsImage("images/profile.png"),
            ),
            IconButton(
                onPressed: (){
                  context.read<ThemeBloc>().add(SwitchThemeEvent());
                  print("test");
                },
                icon: const Icon(Icons.settings))
          ],
        )
    );
  }
}
