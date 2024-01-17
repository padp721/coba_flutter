import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../models/todo.dart';
import 'todo_detail.dart';

Future<List<Todo>> fetchTodo() async {
  final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos"));
  if (response.statusCode == 200) {
    List<dynamic> resBody = jsonDecode(response.body);

    List<Todo> result = [];
    for (var row in resBody) {
      Todo todo = Todo.fromJson(row as Map<String, dynamic>);
      result.add(todo);
    }

    return result;
  } else {
    throw Exception('Error loading todos!');
  }
}

class TodoListView extends StatelessWidget {
  final List<Todo> todoList;

  const TodoListView({ super.key, required this.todoList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todoList.length,
      prototypeItem: ListTile(
        title: Text(todoList.first.title),
        leading: Checkbox(
          value: todoList.first.completed,
          onChanged: (value) {},
        ),
      ),
      itemBuilder: (context, index) {
        Todo todo = todoList[index];
        return ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TodoDetail(todo: todo)
              )
            );
          },
          title: Text(todo.title),
          leading: Checkbox(
            value: todo.completed,
            onChanged: (value) {},
          ),
        );
      }
    );
  }
}

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  late Future<List<Todo>> futureTodoList;

  @override
  void initState() {
    super.initState();
    futureTodoList = fetchTodo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: futureTodoList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Todo> todoList = snapshot.data!;
            return TodoListView(todoList: todoList);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: "Add new todo",
        child: const Icon(Icons.add),
      ),
    );
  }
}