import 'package:flutter/foundation.dart';
import 'package:products_app/export.dart';

class DrawerProvider with ChangeNotifier{
  AppStateEnum _appStateEnum;
  DrawerProvider(this._appStateEnum);

  void change({AppStateEnum enumState}){
    _appStateEnum = enumState;
    notifyListeners();
  }

  get getState => this._appStateEnum;
}