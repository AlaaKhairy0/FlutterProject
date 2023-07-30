import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_new/views/cubit/todos_cubit.dart';
import 'package:flutter_new/views/screens/todos_details_screen.dart';

class Index{
  int index;
  Index({required this.index});
}
class TodosScreen extends StatefulWidget {
  const TodosScreen({super.key});

  @override
  State<TodosScreen> createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => TodosCubit(),
        child: BlocConsumer<TodosCubit, TodosState>(
          listener: (context, state) {
            // TODO: implement listener
            if (state is TodosLoading){
              print("Loading");
            }
          },
          builder: (context, state) {
            return state is TodosLoading ? const Center(child: CircularProgressIndicator(),) :
                state is TodosSuccess ? ListView.builder(
                itemCount: context.watch<TodosCubit>().todos.length,
                itemBuilder: (BuildContext context , int index){
                  return ListTile(
                    onTap: (){
                      Navigator.pushNamed(context,
                          '/todoDetailsScreen',
                      arguments: Index(index: index));
                    },
                    title: Text("Title: ${context.watch<TodosCubit>().todos[index].title} ",
                        style: const TextStyle(fontSize: 18.0)),
                  );
                }
            )
                    : Center(
                  child: Text('Error'),);
          },
        ),
      )
    );
  }
}