import 'package:app/Constants/colors.dart';
import 'package:app/models/all_popular_product.dart';
import 'package:app/provider/add_favourite.dart';
import 'package:app/provider/add_to_card.dart';
import 'package:app/services/all_catagory.dart';
import 'package:app/widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListViewCatagoryItem extends StatelessWidget {
  const ListViewCatagoryItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductModel>>(
      future: ServiceProduct().getAllProduct(),
      builder: (context, AsyncSnapshot<List<ProductModel>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (snapshot.hasData) {
          List<ProductModel>? data = snapshot.data;
          return ListView.builder(
            itemCount: data!.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Card(
                  elevation: 10,
                  shadowColor: Colors.black,
                  child: Container(
                    height: 220,
                    width: 180,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  data[index].title,
                                  overflow: TextOverflow.clip,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                   SnackbarUtil.showSnackbar(
                                      context, 'You add ${data[index].title} to Favourite',() {
                                         Provider.of<ProviderFav>(
                                                          context,
                                                          listen: false)
                                                      .removeProduct(
                                                          data[index]);
                                      },);

                                  Provider.of<ProviderFav>(context,
                                          listen: false)
                                      .addProduct(data[index]);
                                },
                                icon: const Icon(
                                  Icons.favorite,
                                  size: 30.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Image.network(data[index].image),
                        ),
                        Container(
                          height: 50,
                          width: 180,
                          color: pKcolor.withOpacity(0.2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                '\$ ${(data[index].price)}',
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              IconButton(
                                onPressed: () {
                                  SnackbarUtil.showSnackbar(
                                      context, 'You add ${data[index].title}',() {
                                         Provider.of<ProviderCard>(
                                                          context,
                                                          listen: false)
                                                      .removeProduct(
                                                          data[index]);
                                      },);

                                  Provider.of<ProviderCard>(context,
                                          listen: false)
                                      .addProduct(data[index]);

                                  Provider.of<ProviderCard>(context,
                                          listen: false)
                                      .add_to_card(data[index].price);
                                },
                                icon: const Icon(
                                  Icons.add,
                                  color: Colors.black,
                                  size: 30,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        } else {
          // Handle the case where snapshot has no data
          return const Center(
            child: Text('No data available'),
          );
        }
      },
    );
  }
}
