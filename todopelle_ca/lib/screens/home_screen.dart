import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:todopelle_ca/screens/day_list_todo_screen.dart';
import 'package:todopelle_ca/screens/list_todo_screen.dart';
import 'package:todopelle_ca/screens/todo_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.testList,}) : super(key: key);
  final List<String> testList;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);

    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.blueAccent,
        key: _bottomNavigationKey,
        items: const <Widget> [
          Icon(Icons.home, size: 30),
          Icon(Icons.check_box, size: 30),
        ],
        onTap: (index) {
          setState(() {
          controller.jumpToPage(index);
          });
        },
      ),
      
      body: PageView(
        onPageChanged: (index) {
          final CurvedNavigationBarState? navBarState = _bottomNavigationKey.currentState;
          navBarState?.setPage(index);
        },
        scrollDirection: Axis.horizontal,
        controller: controller,
        children: const <Widget>[
          DayListTodoScreen(),
          TodoListScreen(testList: testList),
        ],

      )
    );
  }
}