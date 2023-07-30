import 'package:dio/dio.dart';
import 'package:flutter_new/models/todo_model.dart';

class TodoService{
  String url = "https://jsonplaceholder.typicode.com/todos";

  Future <List<TodoModel>> getTodos() async {
    List<TodoModel> todos =[];
    Response response = await Dio().get(url);
    var data = response.data;
    data.forEach((element){
      TodoModel todo = TodoModel.fromJson(element);
      todos.add(todo);
    });
    return todos;

  }

}