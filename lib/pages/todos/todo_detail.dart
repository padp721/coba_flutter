import 'package:flutter/material.dart';

import '../../models/todo.dart';

class TodoDetail extends StatelessWidget {
  final Todo todo;

  const TodoDetail({ super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Todo Detail"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Todo ID : ${todo.id}'),
            Text('Todo User ID : ${todo.userId}'),
            Text('Todo Title : ${todo.title}'),
            Checkbox(value: todo.completed, onChanged: (value) {},)
          ],
        ),
      ),
    );
  }
}