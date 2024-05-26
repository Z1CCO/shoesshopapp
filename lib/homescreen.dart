import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:shoes_app/ui/favourite/favourite.dart';
import 'package:shoes_app/ui/home/homepage.dart';
import 'package:shoes_app/ui/profile/profile.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // final List bottomnavbar = [
  //   Icon(Icons.home),
  //   Image(
  //     image: AssetImage('assets/images/favourite.png'),
  //   ),
  //   Image(
  //     image: AssetImage('assets/images/profile.png'),
  //   ),
  // ];

  final List _widgetOptions = [
    HomePage(),
    FavouriteScreen(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Stack(
        children: [
          _widgetOptions[_selectedIndex],
          Align(
            alignment: Alignment(0.0, 0.97),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 14),
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(_widgetOptions.length, (index) {
                      return IconButton(
                        color: Colors.white,
                        onPressed: () {
                          setState(() {
                            _selectedIndex = index;
                          });
                        },
                        icon: Icon(Icons.home),
                      );
                    })),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
