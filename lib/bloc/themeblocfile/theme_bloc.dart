import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:project_lastest/ui/themes/themes.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  int currentThemeIndex = 0;
  List<ThemeData> themes = CustomThemes.themes;
  ThemeBloc() : super(ThemeInitial()) {
    on((SwitchThemeEvent event, emit) {
      // TODO: implement event handler
      currentThemeIndex++;
      if(currentThemeIndex>=themes.length){
        currentThemeIndex = 0;
      }
      print(" test = $currentThemeIndex");
      print(themes[currentThemeIndex]);
      emit(ThemeSuccessState(themeData: themes[currentThemeIndex]));
    });
  }
}
