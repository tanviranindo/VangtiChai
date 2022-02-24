import 'package:flutter/foundation.dart';

/// @author Tanvir Rahman
/// @ID 19101268

class Calculation extends ChangeNotifier {
  var total = "";
  double remaining = 0;
  List<int> notes = [500, 100, 50, 20, 10, 5, 2, 1];
  List<int> noteCounts = [0, 0, 0, 0, 0, 0, 0, 0];

  void setTotal(var userInput) {
    total += userInput;
    notifyListeners();
    calculation(total);
  }

  getTotal() {
    return total;
  }

  void calculation(var userInput) {
    remaining = double.parse(userInput);

    noteCounts[0] = remaining ~/ 500;
    remaining = (remaining - noteCounts[0] * 500);
    noteCounts[1] = remaining ~/ 100;
    remaining = (remaining - noteCounts[1] * 100);
    noteCounts[2] = remaining ~/ 50;
    remaining = (remaining - noteCounts[2] * 50);
    noteCounts[3] = remaining ~/ 20;
    remaining = (remaining - noteCounts[3] * 20);
    noteCounts[4] = remaining ~/ 10;
    remaining = (remaining - noteCounts[4] * 10);
    noteCounts[5] = remaining ~/ 5;
    remaining = (remaining - noteCounts[5] * 5);
    noteCounts[6] = remaining ~/ 2;
    remaining = (remaining - noteCounts[6] * 2);
    noteCounts[7] = remaining ~/ 1;
    remaining = (remaining - noteCounts[7] * 1);
  }

  clear() {
    total = "";
    noteCounts = [0, 0, 0, 0, 0, 0, 0, 0];
    notifyListeners();
  }
}
