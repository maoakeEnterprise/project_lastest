import 'package:flutter/material.dart';
import 'package:project_lastest/ui/widgets/maindrawerwidget.dart';

class GitUsersPage extends StatelessWidget {
  const GitUsersPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();

    return Scaffold(
        appBar: AppBar(title: const Text("GIT USER ")),
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
                      print("TOUCH TOUCH");
                      print(textEditingController.text);
                      print("TOUCH TOUCH");
                      textEditingController.text = "";
                    },
                    icon: const Icon(Icons.search)
                )
              ],
            ),
          )
            ]
        )
    );
  }
}
