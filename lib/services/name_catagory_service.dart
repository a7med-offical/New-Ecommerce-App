import 'dart:convert';
import 'package:http/http.dart' as http;

class NameOfCatagory {
  // ignore: non_constant_identifier_names
  Future<List<dynamic>> NameCatagory() async {
    var response =
        await http.get(Uri.parse('https://dummyjson.com/products/categories'));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List categoryNames = [];
      categoryNames.addAll(data);
      return categoryNames;
      
    } else {
      throw Exception('Failed to load category names');
    }
  }
}
