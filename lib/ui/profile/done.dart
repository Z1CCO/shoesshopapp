import 'package:flutter/material.dart';
import 'package:shoes_app/widgets/productitem.dart';

class AllDoneScreen extends StatelessWidget {
  const AllDoneScreen({super.key});

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
