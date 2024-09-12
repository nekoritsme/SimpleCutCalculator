import 'dart:io';
import 'logic.dart';

void main() {
  print(
      "Calculate product [1] Add a new product [2] Delete selected Product [3] Clear entire database [901]");
  start(stdin.readLineSync()!);
}

void start(String line) async {
  switch (line) {
    case "1":
      await SimpleCutCalculator.showDatabase();

      print("Choose number to calculate: ");
      int index = int.parse(stdin.readLineSync()!);

      print("Type grams: ");
      double grams = double.parse(stdin.readLineSync()!);

      SimpleCutCalculator.calculate(index, grams);
      break;
    case "2":
      print("Type product: ");
      String product = stdin.readLineSync()!;

      print("Type calories: ");
      double calories = double.parse(stdin.readLineSync()!);

      print("Type protein: ");
      double protein = double.parse(stdin.readLineSync()!);

      SimpleCutCalculator.addproduct(product, calories, protein);
      break;
    case "3":
      await SimpleCutCalculator.showDatabase();

      print("Choose number to delete product");
      int index = await int.parse(stdin.readLineSync()!);
      await SimpleCutCalculator.deleteproduct(index);

      print("Updated list");
      SimpleCutCalculator.showDatabase();
      break;
    case "901":
      SimpleCutCalculator.clearDatabase();
      break;
    default:
      print("You typed a wrong number");
      break;
  }
}
