import 'package:flutter/material.dart';
import 'package:flutter_new/models/todo_model.dart';
import 'package:flutter_new/services/todo_service.dart';

class TodosScreen extends StatefulWidget {
  const TodosScreen({super.key});

  @override
  State<TodosScreen> createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  List <Welcome> todos =[];
  bool isLoading = true;
  getTodosFromApi() async{
    todos = await TodoService().getTodos();
    isLoading = false;
    setState(() {});
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTodosFromApi();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: isLoading ? const Center(child: CircularProgressIndicator(),):
      ListView.builder(
          itemCount: todos.length,
          itemBuilder: (BuildContext context , int index){
            return ListTile(title: Text("Title: ${todos[index].title} ",style: const TextStyle(fontSize: 18.0)),
            );
          }
      ) ,
    );
  }
}
