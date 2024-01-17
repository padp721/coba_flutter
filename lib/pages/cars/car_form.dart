import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:padp_app/models/car.dart';


class FormAddCar extends StatefulWidget {
  const FormAddCar({super.key});

  @override
  State<FormAddCar> createState() => _FormAddCarState();
}

class _FormAddCarState extends State<FormAddCar> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String manufacture = '';
  String model = '';
  int year = DateTime.now().year;

  void _addNewCar() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Processing Data")));
      final Car newCar = Car(
        manufacture: manufacture,
        model: model,
        year: year
      );
      log("${newCar.manufacture}, ${newCar.model}, ${newCar.year}");
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Done Processing Data")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(hintText: "Enter Manufacturer"),
              validator: (String? value) {
                if (value!.isEmpty) {
                  return "Please enter manufacturer";
                }
                return null;
              },
              initialValue: manufacture,
              onChanged: (value) => setState(() { manufacture = value; }),
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: "Enter Model"),
              validator: (String? value) {
                if (value!.isEmpty) {
                  return "Please enter model";
                }
                return null;
              },
              initialValue: model,
              onChanged: (value) => setState(() { model = value; }),
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: "Enter Year"),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              initialValue: year.toString(),
              onChanged: (value) => setState(() { year = int.tryParse(value) ?? 0; }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: ElevatedButton(onPressed: _addNewCar, child: const Text("Submit")),
            )
          ],
        )
      )
    );
  }
}
