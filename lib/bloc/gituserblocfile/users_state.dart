part of 'users_bloc.dart';

@immutable
abstract class UsersState {}

class SearchUsersSuccessState extends UsersState{}
class SearchUsersLoadingState extends UsersState{}
class SearchUsersErrorState extends UsersState{}

class UsersInitial extends UsersState {}
