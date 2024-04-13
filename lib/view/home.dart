import 'package:app/Constants/colors.dart';
import 'package:app/view/card.dart';
import 'package:app/view/favourite.dart';
import 'package:app/view/product.dart';
import 'package:app/view/search.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedView = 0;

  static final List<Widget> _optionWidget = [
    const ProductView(),
    const SearchView(),
    const FavouriteView(),
    const CardView()
  ];

  void _optionSelected(int index) {
    setState(() {
      selectedView = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _optionWidget.elementAt(selectedView),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outlined), label: 'Favourite'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: 'Card'),
          ],
          currentIndex: selectedView,
          selectedItemColor: pKcolor,
          unselectedItemColor: Colors.grey,
          elevation: 10,
          onTap: _optionSelected,
        ),
      ),
    );
  }
}
