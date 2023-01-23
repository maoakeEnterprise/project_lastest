import 'package:flutter/material.dart';
import 'package:project_lastest/ui/widgets/maindrawerwidget.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(title : const Text("HOME PAGE")),
      body: const Center(
        child: Text("Home Page"),
      ),
    );
  }
}
