import 'package:flutter/material.dart';
import 'package:shoes_app/widgets/myelevatedbutton.dart';

class IteminformationScreen extends StatefulWidget {
  const IteminformationScreen({super.key});

  @override
  State<IteminformationScreen> createState() => _IteminformationScreenState();
}

class _IteminformationScreenState extends State<IteminformationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 300,
            decoration: const BoxDecoration(color: Colors.amber),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 30, 12, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          12,
                        ),
                        color: Colors.white),
                    width: 40,
                    height: 40,
                    child: GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const Text(
                    'Nike',
                    style: TextStyle(fontSize: 25),
                  ),
                  const SizedBox(
                    width: 40,
                    height: 40,
                  ),
                ],
              ),
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.account_circle,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Nike',
                  style: TextStyle(fontSize: 25),
                ),
              ),
              SizedBox(
                width: 50,
                height: 20,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(6, (context) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.blue,
                    ),
                    width: 40,
                    height: 40,
                  );
                })),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Text(
                  '4',
                  style: TextStyle(fontSize: 30),
                ),
                Row(
                  children: List.generate(
                    5,
                    (context) {
                      return const Icon(
                        Icons.star_rounded,
                        size: 40,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: MyElevatedButtonWithLogin(
        onTap: () {},
        text: 'Buy',
      ),
    );
  }
}
