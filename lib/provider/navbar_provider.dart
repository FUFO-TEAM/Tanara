import 'package:flutter/material.dart';

class NavbarProvider extends ChangeNotifier{
  int _index = 0;

  void changeIndex(int index) {
    this._index = index;
  }

  int getIndex() => this._index;
}