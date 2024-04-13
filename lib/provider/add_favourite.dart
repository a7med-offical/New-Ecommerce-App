import 'package:flutter/material.dart';
import 'package:app/models/all_popular_product.dart';

class ProviderFav extends ChangeNotifier {
  List<ProductModel> ProdcutFav = [];

  addProduct(ProductModel model) {
    ProdcutFav.add(model);
    notifyListeners();
  }

  removeProduct(ProductModel model) {
    ProdcutFav.remove(model);
    notifyListeners();
  }
}
