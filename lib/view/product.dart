import 'package:app/Constants/colors.dart';
import 'package:app/widgets/List_Popular_Catagory.dart';
import 'package:app/widgets/List_catagry_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:app/helper/database.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});
  
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _usersStream =
        FirebaseFirestore.instance.collection('users').snapshots();

    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StreamBuilder<QuerySnapshot>(
                  stream: _usersStream,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return const Text('Something went wrong');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Text("Loading");
                    }
                    if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                      // Accessing the first document in the snapshot
                      DocumentSnapshot document = snapshot.data!.docs.first;
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;

                      return Column(
                        children: [
                          Text(
                            'Hello ${data['full_name']}',
                            style: const TextStyle(
                                fontSize: 24,
                                color: pKcolor,
                                fontWeight: FontWeight.w600),
                          ),
                          const Text(
            'Good Morning',
            style: TextStyle(fontSize: 18),
          ),
                        ],
                      );
                    } else {
                      return const Text('No data available');
                    }
                  }),
              const CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('Assets/images/login.png'),
              ),
            ],
          ),
          
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Popular Brands',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w700, color: Colors.grey),
          ),
          const SizedBox(
            height: 20,
          ),
          const Expanded(child: ListViewCatagoryItem()),
          const SizedBox(
            height: 20,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Catagories',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 62, 90, 104)),
              ),
              Text(
                'More',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(child: ListViewPopularCatagory())
        ],
      ),
    ));
  }
}
