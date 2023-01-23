part of 'theme_bloc.dart';

@immutable
abstract class ThemeState {
  ThemeData themeData;
  ThemeState({this.themeData});
}

class ThemeSuccessState extends ThemeState{
  ThemeSuccessState({ThemeData themeData}) : super(themeData: themeData);

}

class ThemeInitial extends ThemeState {
  ThemeInitial({ThemeData themeData}) : super(themeData: ThemeData(primarySwatch: Colors.deepOrange));
}
