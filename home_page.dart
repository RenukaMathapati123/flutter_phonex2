import 'package:flutter/material.dart';
import 'package:flutter_phonex2/model/todo.dart';
import 'package:flutter_phonex2/provider/todo_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

@override
void initState() {
  super.initState();
  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    Provider.of<TodoProvider>(context, listen: false).getAllTodos();
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Data'),
        centerTitle:true,
      ),
      body: Consumer<TodoProvider>(
        builder: (context, value, child) {
          final todos = value.todos;
          return Expanded(
            child:ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return Card(
                shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15.0),
  ),
  shadowColor: Colors.green,
                child: ListView(
                  children:  [
                  ListTile(
                    leading: Icon(Icons.people,
                    size: 20,
                    ),
                    title: Text(todo.customerName),
                    // trailing: Icon(Icons.more_vert),
                  ),
                  ListTile(
                    leading: Icon(Icons.email_outlined,
                    size: 20,
                    ),
                    title: Text(todo.email),
                    
                  ),
                  ListTile(
                    leading: Icon(Icons.wheelchair_pickup_outlined,
                    size: 20,
                    ),
                    title: Text(todo.pickupAddress),
                    
                  ),
                  
                  ],
                  shrinkWrap: true,
                ),
              );
            },
            )
          );
        }
        ),
    );
  }
}