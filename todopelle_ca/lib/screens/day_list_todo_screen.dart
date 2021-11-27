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
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Vous n'avez pas de tâches assignées aujourd'hui",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      )
    );
  }
}