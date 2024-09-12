import 'dart:cli';
import 'dart:io';
import 'logic.dart';

void main() {
  print(
      "Calculate product [1] Add a new product [2] Delete selected Product [3] Clear entire database [901]");
  start(stdin.readLineSync()!);
}

Map getInputs() {
  print("Type product: ");
  String product = stdin.readLineSync()!;

  print("Type calories: ");
  double calories = double.parse(stdin.readLineSync()!);

  print("Type protein: ");
  double protein = double.parse(stdin.readLineSync()!);

  print("Type grams: ");
  double grams = double.parse(stdin.readLineSync()!);

  Map<String, dynamic> inputs = {
    "product": product,
    "calories": calories,
    "protein": protein,
    "grams": grams
  };
  return inputs;
}

void start(String line) async {
  await calculator.showDatabase();
  print("Choose product to calculate");

  if (line == "1") {
    final inputs = getInputs();
    calculator(
            productName: inputs["product"],
            calories: inputs["calories"],
            protein: inputs["protein"],
            grams: inputs["grams"])
        .calculate();
  }

  if (line == "2") {
    final inputs = getInputs();

    calculator.addproduct(
        inputs["product"], inputs["calories"], inputs["protein"]);
  }

  if (line == "3") {
    await calculator.showDatabase();

    print("Choose number to delete product");
    int index = await int.parse(stdin.readLineSync()!);
    await calculator.deleteproduct(index);

    print("Updated list");
    calculator.showDatabase();
  }

  if (line == "901") {
    calculator.clearDatabase();
  }
}
