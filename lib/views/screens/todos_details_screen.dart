import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_new/views/cubit/todos_cubit.dart';
import 'package:flutter_new/views/screens/todos_screen.dart';


class TodoDetailsScreen extends StatelessWidget {
  const TodoDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Index num = ModalRoute.of(context)!.settings.arguments as Index;
    int theIndex = num.index;
    return Scaffold(
      appBar: AppBar(

        title: BlocProvider(
            create: (context) => TodosCubit(),
            child: BlocBuilder<TodosCubit, TodosState>(
              builder: (context, state) {
                return state is TodosLoading ? const Center(child: CircularProgressIndicator(),) :
                  Text("${context.watch<TodosCubit>().todos[theIndex].title}");
              },
            )
        ),
      ),
      body: BlocProvider(
        create: (context) => TodosCubit(),
        child: BlocBuilder<TodosCubit, TodosState>(
          builder: (context, state) {
            return state is TodosLoading ? const Center(child: CircularProgressIndicator(),) :
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("User Id : ${context.watch<TodosCubit>().todos[theIndex].userId}",
                      style: TextStyle(fontSize: 18)),
                      Text("Id : ${context.watch<TodosCubit>().todos[theIndex].id}",
                          style: TextStyle(fontSize: 18)),
                      Text("Completed : ${context.watch<TodosCubit>().todos[theIndex].completed}",
                          style: TextStyle(fontSize: 18)),
                    ],
                  ),
                );
          },
        )
      )
    );
  }
}
