import 'package:flutter/material.dart';
import 'package:todopelle_ca/screens/home_screen.dart';


  List<String> testList = ["oui", "non"];

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
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(

        testList: testList,

      ),
    );
  }
}


