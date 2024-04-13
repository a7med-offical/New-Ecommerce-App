
import 'package:app/provider/add_favourite.dart';
import 'package:app/services/all_catagory.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(centerTitle: true, title: const Text('Favourite')),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: FutureBuilder(
                future: ServiceProduct().getAllProduct(),
                builder: ((context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    const Text('Error');
                  }
                  var Data = Provider.of<ProviderFav>(context).ProdcutFav;
                  return ListView.builder(
                      itemCount: Data.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 10,
                          shadowColor: Colors.black,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            height: 180,
                            width: 130,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                    child: Image.network(Data[index].image)),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        Data[index].title,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        Data[index].price.toString(),
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.grey),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            '\$1290',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                Provider.of<ProviderFav>(
                                                        context,listen: false)
                                                    .removeProduct(Data[index]);
                                              },
                                              icon: Icon(
                                                Icons.favorite,
                                                color: Colors.red,
                                              ))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                }))));
  }
}
