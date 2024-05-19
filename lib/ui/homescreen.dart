import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:shoes_app/ui/profile/profile.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List _widgetOptions = [
    Text('Products'),
    Text('Favourite'),
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
      appBar: AppBar(
        title: Text('Products'),
        actions: [Icon(Icons.search)],
      ),
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
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.home_outlined,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 135.0),
                      child: Icon(
                        Icons.favorite_outline,
                        color: Colors.white,
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => Profile()),
                          (Route<dynamic> route) => false,
                        );
                      },
                      child: Icon(
                        Icons.person_outline_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
