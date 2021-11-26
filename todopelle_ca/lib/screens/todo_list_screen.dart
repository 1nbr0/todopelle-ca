import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todopelle_ca/main.dart';


class TodoListScreen extends StatefulWidget {
final List<String> testList;

/*@override
void initState(){
    super.initState();
    _focusNode.addListener(_focusNodeListener); 
}

@override
void dispose(){
    _focusNode.removeListener(_focusNodeListener);
    super.dispose();
}*/


  const TodoListScreen({
    Key? key,
    required this.testList,
    }) : super(key: key);



  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
  }


class _TodoListScreenState extends State<TodoListScreen> {


  final TextEditingController _contentController = TextEditingController();

  @override
  void dispose(){
    super.dispose();
  }


  void _modal(BuildContext context) => showModalBottomSheet(
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TODO List"),
        centerTitle: true,
      ),
      backgroundColor: Colors.blueAccent,


      body: ListView.builder(
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
            child: const Card(
              child: ListTile(
              ),
            ),
          );
        },
      ),


      floatingActionButton: FloatingActionButton(
                  onPressed: () => _modal(context),
                  backgroundColor: Colors.white,
                  child: const Icon(Icons.add, color: Colors.blueAccent,),
                ),

    );
  }
}