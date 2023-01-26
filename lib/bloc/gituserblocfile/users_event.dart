part of 'users_bloc.dart';

@immutable
abstract class UsersEvent {}

class SearchUsersEvent extends UsersEvent{
  final String keyword;
  final int page;
  final int pageSize;

  SearchUsersEvent({this.keyword,this.page,this.pageSize});
}

class NextPageEvent extends SearchUsersEvent{
  NextPageEvent({String keyword, int page, int pageSize}): super(keyword: keyword,page: page, pageSize: pageSize);
}
