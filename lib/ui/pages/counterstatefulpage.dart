import 'package:flutter/material.dart';
import 'package:project_lastest/ui/widgets/maindrawerwidget.dart';

class CounterStateFul extends StatefulWidget {
  const CounterStateFul({Key key}) : super(key: key);

  @override
  State<CounterStateFul> createState() => _CounterStateFulState();
}

class _CounterStateFulState extends State<CounterStateFul> {
  int counter = 0;
  String errorMessage="";
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title : const Text("Counter StateFul")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Counter Value => $counter"),
            (errorMessage!="")?
                Text(errorMessage, style: const TextStyle(fontSize: 22, color: Colors.red)): const Text("")
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "dec",
            onPressed: (){
              setState(() {
                if(counter>0){
                  counter--;
                  errorMessage = "";
                }
                else{
                  errorMessage="Counter Value can not be less than 0";
                }
              });
              print("Counter Value=> $counter");
            },
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 8,),
          FloatingActionButton(
            heroTag: "inc",
            onPressed: (){
              setState(() {
                if(counter<10){
                  counter++;
                  errorMessage = "";
                }
                else{
                  errorMessage="Counter Value can not be more exceed 10";
                }
              });
              print("Counter Value=> $counter");
            },
            child: const Icon(Icons.add),
          )
        ],
      ),
    );
  }
}
