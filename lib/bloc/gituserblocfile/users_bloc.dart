
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_lastest/model/usersmodel.dart';
import 'package:project_lastest/repositories/usersrepositories.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UserRepository userRepository=UserRepository();
  UsersBloc() : super(UsersInitial()) {
    on((SearchUsersEvent event, emit) async {
      // TODO: implement event handler
      emit(SearchUsersLoadingState(
        currentKeyword: state.currentKeyword,
        pageSize: state.pageSize,
        totalPages: state.totalPages,
        currentPage: state.currentPage,
        users: state.users
      ));
      try {
        ListUser listUser = await userRepository.searchUsers(event.keyword, event.page, event.pageSize);
        int totalPages = (listUser.totalCount / event.pageSize).floor();

        if(listUser.totalCount% event.pageSize!= 0) {
          totalPages =totalPages+1;
        }
        emit(SearchUsersSuccessState(users: listUser.user,currentPage: event.page,totalPages: totalPages, pageSize: event.pageSize,currentKeyword: event.keyword));
      } catch (ex) {
        emit(SearchUsersErrorState(
          users: state.users,
            currentKeyword: state.currentKeyword,
            currentPage: state.currentPage,
            pageSize: state.pageSize,
            totalPages: state.totalPages,
            errorMessage: ex.toString()));
      }


    });
    on((NextPageEvent event, emit) async {
      try {
        ListUser listUser = await userRepository.searchUsers(event.keyword, event.page, event.pageSize);
        int totalPages = (listUser.totalCount / event.pageSize).floor();

        if(listUser.totalCount% event.pageSize!= 0) {
          totalPages =totalPages+1;
        }
        List<User> currentList = [...state.users];
        currentList.addAll(listUser.user);
        emit(SearchUsersSuccessState(
            users: currentList,
            currentPage: event.page,
            totalPages: totalPages,
            pageSize: event.pageSize,
            currentKeyword: event.keyword));
      } catch (ex) {
        emit(SearchUsersErrorState(
            users: state.users,
            currentKeyword: state.currentKeyword,
            currentPage: state.currentPage,
            pageSize: state.pageSize,
            totalPages: state.totalPages,
            errorMessage: ex.toString()));
      }


    });
  }
}
