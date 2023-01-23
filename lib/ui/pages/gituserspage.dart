import 'package:flutter/material.dart';
import 'package:project_lastest/ui/widgets/maindrawerwidget.dart';

class GitUsersPage extends StatelessWidget {
  const GitUsersPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title : const Text("Counter StateFul")),
      body: const Center(
        child: Text("Home Page"),
      ),
    );
  }
}
