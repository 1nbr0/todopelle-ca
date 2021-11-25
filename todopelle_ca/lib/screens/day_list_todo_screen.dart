import 'package:flutter/material.dart';

class DayListTodoScreen extends StatelessWidget {
  const DayListTodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daily ToDo List"),
        centerTitle: true,
      ),
      backgroundColor: Colors.blueAccent,
    );
  }
}