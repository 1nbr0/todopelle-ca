import 'package:flutter/material.dart';
import 'package:todopelle_ca/screens/todo_list_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<String> testList;


  const HomeScreen({
    Key? key,
    required this.testList,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello World !"),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                  child: const Center(
                    child: Text("1"),
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                  child: const Center(
                    child: Text("2"),
                  ),
                )
              ],
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TodoListScreen(
                    testList: testList,
                  ),
                ),
              ),
              child: const Text("Go to second screen"),
              ),
          const Text("Hello astronaut"),
        ],),
      )
    );
  }
}