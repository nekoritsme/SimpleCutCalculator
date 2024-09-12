import 'dart:convert';
import 'dart:io';

class calculator {
  calculator(
      {required this.productName,
      required this.calories,
      required this.protein,
      required this.grams});

  String productName;
  double calories;
  double protein;
  double grams;

  static String filePath = './database.json';

  static void showDatabase() async {
    String jsonString = await File(filePath).readAsString();
    List<dynamic> database = jsonDecode(jsonString);

    if (database.isEmpty) {
      throw FormatException("Database shouldnt be empty.");
    }

    for (var i = 0; i < database.length; i++) {
      print("[$i] ${database[i]["product"]}");
    }
  }

  static void clearDatabase() async {
    await File(filePath).writeAsString(jsonEncode([]));
    print("Database was successfully cleaned");
  }

  String calculate() {
    final accurate_grams = 100 / this.grams;
    return "${this.productName}: ${this.calories / accurate_grams} calories ${this.protein / accurate_grams} protein";
  }

  void addproduct() async {
    String jsonString = await File(filePath).readAsString();
    List<dynamic> database = jsonDecode(jsonString);

    database.add({
      "product": this.productName,
      "calories": this.calories,
      "protein": this.protein
    });

    await File(filePath).writeAsString(jsonEncode(database));
    print("Product ${this.productName} was successfully added!");
  }
}
