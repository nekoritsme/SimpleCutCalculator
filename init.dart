import 'dart:async';
import 'dart:ffi';
import 'dart:io';
import 'dart:convert';

import 'logic.dart';

void main() {
  print(
      "Calculate product [1] Add a new product [2] Delete selected Product [3] Clear entire database [901]");
  start(stdin.readLineSync()!);
}

void start(String line) async {
  if (line == "1") {
    print("Type product: ");
    String product = stdin.readLineSync()!;

    print("Type calories: ");
    double calories = double.parse(stdin.readLineSync()!);

    print("Type protein: ");
    double protein = double.parse(stdin.readLineSync()!);

    print("Type grams: ");
    double grams = double.parse(stdin.readLineSync()!);

    calculator(
            productName: product,
            calories: calories,
            protein: protein,
            grams: grams)
        .addproduct();
  }

  if (line == "2") {}

  if (line == "3") {}

  if (line == "901") {
    calculator.clearDatabase();
  }
}
