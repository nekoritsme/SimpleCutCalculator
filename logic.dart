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
  static Future<String> jsonString() async =>
      await File(filePath).readAsString();

  static Future writeData(dynamic contenttosave) async =>
      await File(filePath).writeAsString(jsonEncode(contenttosave));
  static dynamic getJsonDecode() async => jsonDecode(await jsonString());

  static Future showDatabase() async {
    List<dynamic> database = await getJsonDecode();

    for (var i = 0; i < database.length; i++) {
      print("[$i] ${database[i]["product"]}");
    }
  }

  static void clearDatabase() async {
    writeData([]);
    print("Database was successfully cleaned");
  }

  static Future deleteproduct(int index) async {
    List<dynamic> database = await getJsonDecode();

    database.removeAt(index);

    writeData(database);
    print("Successfully deleted");
  }

  String calculate() {
    final accurate_grams = 100 / this.grams;
    return "${this.productName}: ${this.calories / accurate_grams} calories ${this.protein / accurate_grams} protein";
  }

  void addproduct() async {
    List<dynamic> database = await getJsonDecode();

    database.add({
      "product": this.productName,
      "calories": this.calories,
      "protein": this.protein
    });

    writeData(database);
    print("Product ${this.productName} was successfully added!");
  }
}
