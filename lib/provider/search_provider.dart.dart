import 'package:flutter/material.dart';

class ProviderSearch extends ChangeNotifier {
  String? NameOfProduct;

  void searchProduct(String name) {
    NameOfProduct = name;
       notifyListeners();
  

  }
 
  
}
