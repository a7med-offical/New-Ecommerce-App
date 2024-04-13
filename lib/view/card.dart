import 'package:app/Constants/colors.dart';
import 'package:app/provider/add_favourite.dart';
import 'package:app/provider/add_to_card.dart';
import 'package:app/services/all_catagory.dart';
import 'package:app/widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardView extends StatelessWidget {
  const CardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar( centerTitle: true, title: const Text('Card')),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                Expanded(
                  child: FutureBuilder(
                      future: ServiceProduct().getAllProduct(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text('Error: ${snapshot.error}'),
                          );
                        }
                        var Data = Provider.of<ProviderCard>(context).CardList;
                        return ListView.builder(
                            itemCount: Data.length,
                            itemBuilder: ((context, index) {
                              return Card(
                                elevation: 10,
                                shadowColor: Colors.black,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  height: 130,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Expanded(
                                          child: Image.network(
                                        Data[index].image,
                                      )),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              Data[index].title,
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              ' \$${Data[index].price}',
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.grey),
                                            ),
                                            IconButton(
                                                onPressed: () {
                                                
                                                  Provider.of<ProviderCard>(
                                                          context,
                                                          listen: false)
                                                      .removeProduct(
                                                          Data[index]);
 
                                    
                                                },
                                                icon: const Icon(
                                                    Icons.remove_circle))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }));
                      }),
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  color: pKcolor,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         Text(
                          'Checkout',
                          style: TextStyle(
                            color: Colors.white,
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        Consumer<ProviderCard>(
                            builder: ((context, value, child) {
                          return Text('  \$ ${value.checkout}',style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w300,color: Colors.white,),);
                        }))
                      ],
                    ),
                  ),
                )
              ],
            )));
  }
}
