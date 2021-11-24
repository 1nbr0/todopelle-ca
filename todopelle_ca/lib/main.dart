import 'package:flutter/material.dart';
import 'package:todopelle_ca/screens/home_screen.dart';

  const List<Map<String, dynamic>> userList = [
  {
    "name": "Jhon",
    "status": "J'aime manger du blé !",
    "age": "24"
  },
  {
    "name": "Jane",
    "status": "J'aime !",
    "age": "55"
  },
  {
    "name": "Nelson",
    "status": "Ment de là",
    "age": "100"
  },
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.purple,
      ),
      home: const HomeScreen(
        users: userList,
      ),
    );
  }
}


