import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'logic.dart';

Stream<String> readLine() =>
    stdin.transform(utf8.decoder).transform(const LineSplitter());
void main() {
  print(
      "Calculate product [1] Add a new product [2] Delete selected Product [3] Clear entire database [4]");
  readLine().listen(processLine);
}

void processLine(String line) {
  if (line == "1") {

  }

  if (line == "2") {

  }

  if (line == "3") {

  }

  if (line == "4") {
    
  }
}
