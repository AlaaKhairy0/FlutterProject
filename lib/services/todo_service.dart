import 'package:dio/dio.dart';
import 'package:flutter_new/models/todo_model.dart';

class TodoService{
  String url = "https://jsonplaceholder.typicode.com/todos";

  Future <List<Welcome>> getTodos() async {
    List<Welcome> todos =[];
    Response response = await Dio().get(url);
    var data = response.data;
    data.forEach((element){
      Welcome todo = Welcome.fromJson(element);
      todos.add(todo);
    });
    return todos;

  }

}