import 'dart:async';

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
      /*print("****************Bloc Event Processing");
      print(event);
      print(event.keyword);
      print("=====================================");*/
      emit(SearchUsersLoadingState());
      try {
        ListUser listUser = await userRepository.searchUsers(event.keyword, 0, 20);
        emit(SearchUsersSuccessState(listUser));
      } catch (ex) {
        emit(SearchUsersErrorState(ex.toString()));
      }


    });
  }
}
