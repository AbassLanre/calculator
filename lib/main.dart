import 'package:calculator/the_calculator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: TheCalculator(),
    title: 'Calculator',
    theme: ThemeData(primarySwatch: Colors.green),
  ));
}
