import 'package:hive_flutter/hive_flutter.dart';

class ManageHistory {
  final zero = "Zero";
  final oneToNine = [
    "One",
    "Two",
    "Three",
    "Four",
    "Five",
    "Six",
    "Seven",
    "Eight",
    "Nine"
  ];

  final tenToNinteen = [
    "Ten",
    "Eleven",
    "Twelve",
    "Thirteen",
    "Fourteen",
    "Fifteen",
    "Sixteen",
    "Seventeen",
    "Eighteen",
    "Nineteen"
  ];

  final dozens = [
    "Ten",
    "Twenty",
    "Thirty",
    "Forty",
    "Fifty",
    "Sixty",
    "Seventy",
    "Eighty",
    "Ninety"
  ];

  final history = Hive.box("History");
  List<Map<String, dynamic>> historyItems = [];
  String toWord(int number) {
    if (number == 0) {
      return zero;
    }
    return generate(number).trim();
  }

  String generate(int number) {
    if (number >= 10000000) {
      return "${generate(number ~/ 10000000)} Crore ${generate(number % 10000000)}";
    } else if (number >= 100000) {
      return "${generate(number ~/ 100000)} Lakh ${generate(number % 100000)}";
    } else if (number >= 1000) {
      return "${generate(number ~/ 1000)} Thousand ${generate(number % 1000)}";
    } else if (number >= 100) {
      return "${generate(number ~/ 100)} Hundred ${generate(number % 100)}";
    }
    return generate1To99(number);
  }

  String generate1To99(int number) {
    if (number == 0) {
      return "";
    } else if (number <= 9) {
      return oneToNine[number - 1];
    } else if (number <= 19) {
      return tenToNinteen[number % 10];
    } else {
      return "${dozens[number ~/ 10 - 1]} ${generate1To99(number % 10)}";
    }
  }

  getHistory() {
    final data = history.keys.map((key) {
      var item = history.get(key);
      return {
        "key": key,
        "date": item["date"],
        "total": item['total'],
        "2000": item['2000'],
        "500": item['500'],
        "200": item['200'],
        "100": item["100"],
        "50": item['50'],
        "20": item['20'],
        "10": item['10'],
        "5": item['5'],
        "2": item['2'],
        "1": item['1']
      };
    }).toList();
    return data.reversed.toList();
  }

  addHistory(
      dateTime, iTotal, i2000, i500, i200, i100, i50, i20, i10, i5, i2, i1) {
    history.add({
      "date": dateTime.toString().substring(0, 18),
      "total": iTotal,
      "2000": i2000,
      "500": i500,
      "200": i200,
      "100": i100,
      "50": i50,
      "20": i20,
      "10": i10,
      "5": i5,
      "2": i2,
      "1": i1
    });
  }

  deleteHistory() {
    history.clear();
  }

  deleteHistoryKey(key) {
    history.delete(key);
  }
}
