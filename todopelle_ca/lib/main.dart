import 'package:flutter/material.dart';
import 'package:todopelle_ca/screens/home_screen.dart';



  final List<String> testList = [];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(

        testList: testList,

      ),
    );
  }
}


