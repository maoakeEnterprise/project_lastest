part of 'users_bloc.dart';

@immutable
abstract class UsersEvent {}

class SearchUsersEvent extends UsersEvent{
  final String keyword;

  SearchUsersEvent({this.keyword});
}
