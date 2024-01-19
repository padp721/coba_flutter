import 'package:flutter/material.dart';
import 'package:padp_app/shared/drawer.dart';

import '../cars/car_list.dart';
import '../todos/todo_list.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        drawer: const AppDrawer(),
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Home Page"),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.task)),
              Tab(icon: Icon(Icons.directions_bike)),
              Tab(icon: Icon(Icons.directions_boat)),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            CarList(),
            TodoList(),
            Icon(Icons.directions_bike),
            Icon(Icons.directions_boat),
          ],
        ),
      ),
    );
  }
}