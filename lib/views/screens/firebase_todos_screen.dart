import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebaseTodosScreen extends StatefulWidget {
  const FirebaseTodosScreen({super.key});

  @override
  State<FirebaseTodosScreen> createState() => _FirebaseTodosScreenState();
}

class _FirebaseTodosScreenState extends State<FirebaseTodosScreen> {
  final Stream<QuerySnapshot> _todosStream = FirebaseFirestore.instance.collection('Todos').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title : Text('Todos'),
      ),
      body:
      StreamBuilder<QuerySnapshot>(
        stream: _todosStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
              return ListTile(
                title:Text('Title: ${data['title']}'),
                subtitle:Text('Id: ${data['id']}'),
               // Text(data['completed']),

              );
            }).toList(),
          );
        },
      ),
    );
  }
}
