import 'dart:cli';
import 'dart:io';
import 'logic.dart';

void main() {
  print(
      "Calculate product [1] Add a new product [2] Delete selected Product [3] Clear entire database [901]");
  start(stdin.readLineSync()!);
}

void start(String line) async {
  if (line == "2") {
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
