import 'package:flutter/foundation.dart';

class CartBadgeProvider with ChangeNotifier {
  int badge;
  CartBadgeProvider({this.badge});
  
  void increaseBadge() {
    this.badge++;
    notifyListeners();
  }
  
  void decreaseBadge() {
    if(this.badge == 0){
      return;
    }
    this.badge--;
    notifyListeners();
  }
}