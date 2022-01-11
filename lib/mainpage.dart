import 'dart:math';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  double? _bmi;
  String _message = 'Please enter your height and weight';
  void _calculate() {
    double? height = double.tryParse(_heightController.value.text);
    double? weight = double.tryParse(_weightController.value.text);
    // Check if the inputs are valid
    if (height == null || height <= 0 || weight == null || weight <= 0) {
      setState(() {
        _message = "Your height and weigh must be positive numbers";
      });
      return;
    }
    setState(() {
      _bmi = weight / pow(height / 100, 2);
      if (_bmi! < 18.5) {
        _message = "You are underweight";
      } else if (_bmi! < 25) {
        _message = 'Your body is fine';
      } else if (_bmi! < 30) {
        _message = 'You are overweight';
      } else {
        _message = 'You are obese';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("BMI Calculator"),
        ),
        body: Center(
            child: SizedBox(
          height: 480,
          width: 300,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 18,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _heightController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          labelText: "Height:",
                          hintText: "Enter your height in Cm",
                          hintStyle: TextStyle(
                            fontSize: 10,
                          )),
                    ),
                    TextFormField(
                      controller: _weightController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          labelText: "Weight:",
                          hintText: "Enter your weight in Kg",
                          hintStyle: TextStyle(
                            fontSize: 10,
                          )),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        child: Text("Calculate"),
                        onPressed: _calculate,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      _bmi == null ? 'No Result' : _bmi!.toStringAsFixed(2),
                      style: TextStyle(fontSize: 40),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Text(
                        _message,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    const Text("Vicky Cruise")
                  ],
                ),
              ),
            ),
          ),
        )));
  }
}
