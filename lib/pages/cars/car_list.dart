import 'package:flutter/material.dart';
import 'add_car.dart';

class CarList extends StatelessWidget {
  const CarList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.directions_car),
            Text("Car List"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddCar()),
          );
        },
        tooltip: "Add new car",
        child: const Icon(Icons.add),
      ),
    );
  }
}
