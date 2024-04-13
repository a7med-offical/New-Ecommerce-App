import 'package:app/Constants/colors.dart';
import 'package:app/services/name_catagory_service.dart';
import 'package:app/view/details_total.dart';
import 'package:flutter/material.dart';

class ListViewPopularCatagory extends StatelessWidget {
  ListViewPopularCatagory({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: NameOfCatagory().NameCatagory(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Text('error');
          }
          List<dynamic>? categoryNames = snapshot.data;
          return ListView.builder(
              itemCount: categoryNames!.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Stack(
                    children: [
                      Card(
                        elevation: 20,
                        shadowColor:  Color.fromARGB(255, 8, 39, 216),
                        child: Container(
                          height: 200,
                          width: 150,
                          decoration: BoxDecoration(
                              color:  color[index],
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Expanded(
                                  child:
                                      Image.asset('Assets/images/login.png')),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  categoryNames[index],
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 5,
                        right: 4,
                        child: IconButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return DetailsTotalProduct(
                                    catagoryName: categoryNames[index]);
                              }));
                            },
                            icon: const Icon(Icons.arrow_forward_ios_rounded)),
                      )
                    ],
                  ),
                );
              });
        });
  }
}
