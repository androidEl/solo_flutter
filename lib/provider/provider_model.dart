import 'package:flutter/cupertino.dart';

class DataProvider with ChangeNotifier {
  String img;
  String name = '';
  String address = '';
  String birthDay = '';
  String tinggi = '';
  String berat = '';

  void addImg(String n) {
    img = n;
    notifyListeners();
  }

  void addName(String n) {
    name = n;
    notifyListeners();
  }

  void addBD(String n) {
    birthDay = n;
    notifyListeners();
  }

  void addAddress(String n) {
    address = n;
    notifyListeners();
  }

  void addTinggi(String n) {
    tinggi = n;
    notifyListeners();
  }

  void addBerat(String n) {
    berat = n;
    notifyListeners();
  }
}
