part of 'users_bloc.dart';

@immutable
abstract class UsersState {}

class SearchUsersSuccessState extends UsersState{
  final ListUser listUser;

  SearchUsersSuccessState(this.listUser);
}
class SearchUsersLoadingState extends UsersState{}
class SearchUsersErrorState extends UsersState{
  final String errorMessage;

  SearchUsersErrorState(this.errorMessage);
}

class UsersInitial extends UsersState {}
