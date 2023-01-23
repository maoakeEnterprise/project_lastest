import 'package:flutter/material.dart';

import 'draweritemwidget.dart';
import 'maindrawerheaderwidget.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<dynamic> menus=[
      {"title":"Home","route":"/","leading":Icons.home,"trailing":Icons.arrow_forward},
      {"title":"Counter Stful","route":"counter1","leading":Icons.event,"trailing":Icons.arrow_forward},
      {"title":"Counter Bloc","route":"counter2","leading":Icons.account_tree,"trailing":Icons.arrow_forward},
      {"title":"Git User","route":"users","leading":Icons.group,"trailing":Icons.arrow_forward},
    ];

    return Drawer(
      child: Column(
        children: [
          const MainDrawerHeader(),
          Expanded(
            child: ListView.separated(//ceci permet de creer un menu sans le repeter a partir du tableau menus
                itemBuilder: (context,index){
                  return DrawerItemWidget(
                    title: menus[index]['title'],
                    leading: menus[index]['leading'],
                    trailing: menus[index]['trailing'],
                    onAction: (){
                      Navigator.pop(context);
                      Navigator.pushNamed(context, menus[index]['route']);
                    },

                  );
                },
                separatorBuilder: (context,index){
                  return const Divider(height: 6,);
                },
                itemCount: menus.length)
          )
        ],
      ),
    );
  }
}
