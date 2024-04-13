import 'package:app/models/all_popular_product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ServiceProduct {
  Future<List<ProductModel>> getAllProduct() async {
    var response = await http.get(Uri.parse('https://dummyjson.com/products'));
    
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);

      List<dynamic> productList = jsonData['products'];

      List<ProductModel> modelList = [];

      for (var productData in productList) {
        modelList.add(ProductModel.fromJson(productData));
      }

      return modelList;
    } else {
      throw Exception('Failed to load products');
    }
  }
}
