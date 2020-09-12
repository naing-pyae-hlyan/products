import 'package:flutter/foundation.dart';

class RefreshProvider with ChangeNotifier {
  void refresh() {
    notifyListeners();
  }
}