import 'dart:convert';
import 'dart:io';

class SimpleCutCalculator {
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

  static clearDatabase() async {
    writeData([]);
    print("Database was successfully cleared");
  }

  static Future deleteproduct(int index) async {
    List<dynamic> database = await getJsonDecode();

    database.removeAt(index);

    writeData(database);
    print("Successfully deleted");
  }

  static void calculate(int index, double grams) async {
    List<dynamic> database = await getJsonDecode();
    final db = database[index];
    final accurate_grams = 100 / grams;
    print(
        "${db["product"]}: ${db["calories"] / accurate_grams} calories ${db["protein"] / accurate_grams} protein");
  }

  static void addproduct(
      String productName, double calories, double protein) async {
    List<dynamic> database = await getJsonDecode();

    database.add(
        {"product": productName, "calories": calories, "protein": protein});

    writeData(database);
    print("Product ${productName} was successfully added!");
  }
}
