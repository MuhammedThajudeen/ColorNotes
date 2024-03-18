import 'package:flutter/material.dart';

class deleteflag extends ChangeNotifier {
  bool _isSelected=false;
  bool get isSelected => _isSelected;

  // List <int>_flaglist =[];
  // List<int> get flaglist => _flaglist;
  
  List _notekey = [];
  List get notekey => _notekey;

  setnewflag(newflag){
    _isSelected = newflag;
  }
  
  addnotekeylist (int key){
    if (!_notekey.contains(key)) {
      _notekey.add(key);  
      notifyListeners();
    }
  }

  // deleteflaglist (){
  //   _flaglist.removeLast();  
  //   notifyListeners();
  // }

  notekeylist(int key) {
    _notekey.contains(key) ? _notekey.remove(key) : _notekey.add(key);
    notifyListeners();
  }

  // clearFlagList() {
  //   _flaglist.clear();
  //   notifyListeners();
  // }

  clearNoteKeyList() {
    _notekey.clear();
    notifyListeners();
  }

  List<int> getSelectedNoteKeys() {
    return List.from(_notekey);
  }
  
}