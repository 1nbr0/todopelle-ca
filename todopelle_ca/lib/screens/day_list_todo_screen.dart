import 'package:flutter/material.dart';

class DayListTodoScreen extends StatelessWidget {
  const DayListTodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daily TODO List"),
        centerTitle: true,
      ),
      backgroundColor: Colors.blueAccent,
      body:
        const Text("Vous n'avez pas de tâche assigné aujourd'hui"),
    );
  }
}