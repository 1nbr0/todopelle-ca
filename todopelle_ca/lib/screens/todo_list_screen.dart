import 'package:flutter/material.dart';
import 'package:todopelle_ca/main.dart';


class TodoListScreen extends StatefulWidget {
//final List<Map<String, dynamic>> users;
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
         children: <Widget> [
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
                  print(_contentController.text);
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
        // actions: [
        //   IconButton(
        //     onPressed: () => Navigator.pop(context),
        //   icon: const Icon(
        //     Icons.arrow_back,
        //     ),
        //   ),
        // ],
      ),
      backgroundColor: Colors.blueAccent,


      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: widget.testList.length,
        itemBuilder: (context, index) {
          return Dismissible(
            direction: DismissDirection.endToStart,
            key: Key(index.toString()),
            background: Container(
              color: Colors.red,
            ),
            child: Card(
              child: ListTile(
                title: Text(testList[index]),
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