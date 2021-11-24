import 'package:flutter/material.dart';

class TodoListScreen extends StatelessWidget {
final List<Map<String, dynamic>> users;

  const TodoListScreen({
    Key? key,
    required this.users,
    }) : super(key: key);

  void _modal(BuildContext context, Map<String, dynamic> users) => showModalBottomSheet(
    context: context,
    builder: (context) => SizedBox(
      height: 200,
        child: Center(
          child: Column(children: users.entries.map((e) => Text(e.value.toString())).toList(),
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Page"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return Dismissible(
            direction: DismissDirection.endToStart,
            key: Key(index.toString()),
            background: Container(
              color: Colors.red,
            ),
            child: Card(
              child: ListTile(
                onTap: () => _modal(
                  context,
                  users[index],
                ),
                title: Text(users[index]["name"]),
                subtitle: Text(users[index]["status"]),
              ),
            ),
          );
        },
      ),
    );
  }
}