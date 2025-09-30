import 'package:flutter/foundation.dart';

class BufferPoolProvider with ChangeNotifier {
  double _bufferAmount = 0.0;

  double get bufferAmount => _bufferAmount;

  void setBufferAmount(double amount) {
    _bufferAmount = amount;
    notifyListeners();
  }

  void addToBufferAmount(double amount) {
    _bufferAmount += amount;
    notifyListeners();
  }

  void resetBufferAmount() {
    _bufferAmount = 0.0;
    notifyListeners();
  }
}
