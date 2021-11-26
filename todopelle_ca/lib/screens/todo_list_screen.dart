import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todopelle_ca/main.dart';


class TodoListScreen extends StatefulWidget {

final List<String> testList;


  const TodoListScreen({
    Key? key,
    required this.testList,
    }) : super(key: key);



  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
  }


class _TodoListScreenState extends State<TodoListScreen> {


  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _modifyerController = TextEditingController();

  @override
  void dispose(){
    super.dispose();
  }

  void _addTodoItem(String title) {
    setState(() {
      testList.add(title);
    });
  }

  void _modifyTodoItem(String title, int index) {
    setState(() {
      testList[index] = title;
    });
  }


  // Widget _buildTodoItem(String title) {
  //   return ListTile(title: Text(title));
  // }


  void _modal(BuildContext context, Function(String) onSend) => showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
    return Padding( 
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 10.0,
          right: 10.0,
          top: 10.0,
      ),       
      child: Wrap(
        children: [
          const Text("TODO Editor"),
          TextField(
            controller: _contentController,
            decoration: const InputDecoration(
              labelText: "enter your TODO",
            ),
          ),
          Padding(padding: const EdgeInsets.only(
            bottom: 10.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: () {
                  onSend(_contentController.text);
                  _contentController.clear();
                  Navigator.of(context).pop();
                }, 
                child: const Text("Create",))
              ],
            )
          )
        ]
      )
      );
    },
  
  );

  void _modalModify(BuildContext context,TextEditingController controller, Function(String) onSend) => showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return Padding( 
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 10.0,
          right: 10.0,
          top: 10.0,
        ),       
        child: Wrap(
          children: [
            const Text("TODO Editor"),
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: "Modify your TODO",
              ),
            ),
            Padding(padding: const EdgeInsets.only(
              bottom: 10.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: () {
                  onSend(controller.text);
                  controller.clear();
                  Navigator.of(context).pop();
                }, 
                child: const Text("Modify",))
              ],
            )
          )
        ]
      )
      );
    },
  
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TODO List"),
        centerTitle: true,
      ),
      backgroundColor: Colors.blueAccent,


      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: widget.testList.length,
        itemBuilder: (context, index) {
          return Slidable(
            // Specify a key if the Slidable is dismissible.
            key: const ValueKey(0),

            // The start action pane is the one at the left or the top side.
            endActionPane: ActionPane(
              extentRatio: 0.20,
              // A motion is a widget used to control how the pane animates.
              motion: const ScrollMotion(),

              // A pane can dismiss the Slidable.
              dismissible: DismissiblePane(onDismissed: () {}),

              // All actions are defined in the children parameter.
              children: [
                // A SlidableAction can have an icon and/or a label.
                SlidableAction(
                  onPressed: (context) {
                    setState(() {
                      widget.testList.removeAt(index);
                    });
                  },
                  backgroundColor: const Color(0xFFFE4A49),
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                ),
              ],
            ),
            child: Card(
              child: ListTile(
                title: Text(testList[index]),
                onTap: () {
                  _modifyerController.text = testList[index];
                  _modalModify(context,_modifyerController, (value){_modifyTodoItem(_modifyerController.text, index);});
                },
              ),
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
                  onPressed: () => _modal(context, (value){_addTodoItem(value);}),
                  backgroundColor: Colors.white,
                  child: const Icon(Icons.add, color: Colors.blueAccent,),
      ),
    );
  }
}