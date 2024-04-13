import 'package:app/models/all_popular_product.dart';
import 'package:app/provider/search_provider.dart.dart';
import 'package:app/services/search_to_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProviderSearch>(context);
    return Scaffold(
     appBar: AppBar(centerTitle: true, title: const Text('Search')),

      body: Column(
  children: [
    SearchBar(
      onChanged: (value) {
        Provider.of<ProviderSearch>(context,listen: false).searchProduct(value);
      },
    ),
    const SizedBox(
      height: 30,
    ),
    Expanded(
      child: FutureBuilder<List<ProductModel>>(
        future: SearchProduct().getTotalProduct(NameOfProduct: provider.NameOfProduct),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Text('error'); // You missed the return statement here
          }

          List<ProductModel>? model = snapshot.data;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ListView.builder(
              itemCount: model!.length,
              itemBuilder: ((context, index) {
                return Card(
                  elevation: 10,
                  child: Container(
                    height: 150,
                    color: Colors.white,
                    child: ListTile(
                      title: Text(
                        model[index].title,
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text(model[index].title, style: const TextStyle(fontSize: 18)),
                      leading: Image.network(model[index].image),
                      trailing: const IconButton(
                        onPressed: null,
                        icon: Icon(Icons.keyboard_control_rounded),
                      ),
                    ),
                  ),
                );
              }),
            ),
          );
        },
      ),
    ),
  ],
),);
  }
}
