import 'package:flutter/material.dart';
import 'package:shoes_app/ui/favourite/iteminformationscreen.dart';
import 'package:shoes_app/widgets/productitem.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => IteminformationScreen(),
                ),
              );
            },
            child: ProductItemWidget(),
          ),
        ],
      ),
    );
  }
}
