import 'package:flutter/material.dart';
import 'package:app/models/all_popular_product.dart';

class ProviderCard extends ChangeNotifier {
  List<ProductModel> CardList = [];
  double checkout = 0;

  addProduct(ProductModel model) {
    CardList.add(model);
    notifyListeners();
  }

  removeProduct(ProductModel model) {
    CardList.remove(model);
    delete_from_card(model.price);
    notifyListeners();
  }

  add_to_card(double x) {
    checkout += x;
    notifyListeners();
  }

  delete_from_card(double x) {
    checkout -= x;
    notifyListeners();
  }
}
