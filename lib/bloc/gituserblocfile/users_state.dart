part of 'users_bloc.dart';

@immutable
abstract class UsersState {
  final List<User> users;
  final int currentPage;
  final int totalPages;
  final int pageSize;
  final String currentKeyword;

  const UsersState(
      {this.users,
      this.currentPage,
      this.totalPages,
      this.pageSize,
      this.currentKeyword});
}

class SearchUsersSuccessState extends UsersState{


  SearchUsersSuccessState({List<User> users,int currentPage,int totalPages,int pageSize,String currentKeyword}) :
        super(users: users,currentPage: currentPage,totalPages: totalPages,pageSize: pageSize,currentKeyword: currentKeyword);
}
class SearchUsersLoadingState extends UsersState{
  SearchUsersLoadingState({List<User> users,int currentPage,int totalPages,int pageSize,String currentKeyword}) :
        super(users: users,currentPage: currentPage,totalPages: totalPages,pageSize: pageSize,currentKeyword: currentKeyword);

}

class SearchUsersErrorState extends UsersState{
  final String errorMessage;
  SearchUsersErrorState({List<User> users,int currentPage,int totalPages,int pageSize,String currentKeyword,this.errorMessage}) :
        super(users: users,currentPage: currentPage,totalPages: totalPages,pageSize: pageSize,currentKeyword: currentKeyword);
}

class UsersInitial extends UsersState {
  UsersInitial() :
        super(users: [],currentPage: 0,totalPages: 0,pageSize: 20,currentKeyword: "");
}
