import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_new/models/todo_model.dart';
import 'package:flutter_new/services/todo_service.dart';
part 'todos_state.dart';

class TodosCubit extends Cubit<TodosState> {
  TodosCubit() : super(TodosInitial()) {
    getTodos();
  }
  List <TodoModel> todos =[];
  getTodos() async {
    try {
      emit(TodosLoading());
      todos = await TodoService().getTodos();
      emit(TodosSuccess());
    } catch (e) {
      print(e.toString());
      emit(TodosError());
    }
  }
}
