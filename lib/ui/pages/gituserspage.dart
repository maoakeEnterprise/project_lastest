import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:project_lastest/bloc/gituserblocfile/users_bloc.dart';
import 'package:project_lastest/ui/themes/themes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GitUsersPage extends StatelessWidget {
  const GitUsersPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();

    return Scaffold(
        appBar: AppBar(
            title: BlocBuilder<UsersBloc,UsersState>(
                builder: (context,state){
                  if(state is SearchUsersSuccessState) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("users"),
                      Text("${state.currentPage}/${state.totalPages}")
                    ],
                  );
                  }
                  else{
                    return const Text("Users Page");
                  }
                },
            )
        ),
        body: Column(
            children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                    child: TextFormField(
                      controller: textEditingController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            width: 2,
                          )
                        ),
                      ),
                    )
                ),
                IconButton(
                    onPressed: () {
                      String kw = textEditingController.text;
                      context.read<UsersBloc>().add(SearchUsersEvent(keyword: kw, page: 0,pageSize: 20));
                    },
                    icon: const Icon(Icons.search)
                )
              ],
            ),
          ),
              BlocBuilder<UsersBloc,UsersState>(
                  // ignore: missing_return
                  builder: (context,state){
                    if(state is SearchUsersLoadingState){
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    else if(state is SearchUsersErrorState){
                      return Column(
                        children: [
                          Text(state.errorMessage, style: CustomThemes.errorStyle,),
                          ElevatedButton(
                              onPressed: (){

                              },
                              child: const Text("Retry")
                          )
                        ],
                      );
                    }
                    else if(state is SearchUsersSuccessState){


                      return Expanded(
                        child: LazyLoadScrollView(
                          onEndOfPage: (){
                            context.read<UsersBloc>().add(NextPageEvent(keyword: state.currentKeyword, page: state.currentPage+1, pageSize: state.pageSize));
                          },
                          child: ListView.separated(
                              // ignore: missing_return
                              itemBuilder: (context,index){
                                return ListTile(
                                  title: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 40,
                                            backgroundImage: NetworkImage(state.users[index].avatarUrl),
                                          ),
                                          const SizedBox(width: 10,),
                                          Text(state.users[index].login, style: Theme.of(context).textTheme.headline6,),
                                        ],
                                      ),
                                      CircleAvatar(child: Text("${state.users[index].score}"),)
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: (context,index){
                                return const Divider(
                                  height: 2,
                                );
                              },
                              itemCount: state.users.length
                          ),
                        ),
                      );
                    }
                    else{
                      return Container();
                    }
                  }
              ),
            ]
        )
    );
  }
}
