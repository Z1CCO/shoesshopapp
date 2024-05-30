import 'package:flutter/material.dart';
import 'package:shoes_app/ui/favourite/favourite.dart';
import 'package:shoes_app/ui/home/homepage.dart';
import 'package:shoes_app/ui/profile/profile.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  List bottomItem = [
    'assets/images/home.png',
    'assets/images/favourite.png',
    'assets/images/profile.png',
  ];

  final List _widgetOptions = [
    const HomePage(),
    const FavouriteScreen(),
    const Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Stack(
        children: [
          _widgetOptions[_selectedIndex],
          Align(
            alignment: const Alignment(0.0, 0.97),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 14),
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
                  children: List.generate(
                    bottomItem.length,
                    (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIndex = index;
                          });
                        },
                        child: SizedBox(
                          width: 22,
                          height: 22,
                          child: Image(
                            color: Colors.white,
                            image: AssetImage(
                              bottomItem[index],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey[300],
    );
  }
}
