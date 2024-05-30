import 'package:flutter/material.dart';
import 'package:shoes_app/ui/favourite/iteminformationscreen.dart';
import 'package:shoes_app/widgets/productitem.dart';

class ActiveScreen extends StatelessWidget {
  const ActiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProductItemWidget(),
        ProductItemWidget(),
        ProductItemWidget(),
        ProductItemWidget(),
      ],
    );
  }
}
