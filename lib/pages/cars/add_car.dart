import 'package:flutter/material.dart';
import 'car_form.dart';

class AddCar extends StatelessWidget {
  const AddCar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Add New Car"),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.directions_car),
            Text("Add Car Form"),
            FormAddCar(),
          ],
        ),
      ),
    );
  }
}