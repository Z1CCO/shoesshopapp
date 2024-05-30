import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> tabtitle = ['ALL', 'PUMA', 'NIKE', 'ADIDAS', 'LACOSTE'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Products'),
        actions: [const Icon(Icons.search)],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 75,
            child: Expanded(
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(tabtitle.length, (index) {
                    return Container(
                      
                      margin: EdgeInsets.symmetric(horizontal: 4, vertical: 12),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 20),
                        child: Text(
                          tabtitle[index],
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)),
                    );
                  })),
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            itemCount: 4,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 4 / 5,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              return Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 6.0, left: 10, right: 10, bottom: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 35,
                            child: Image(
                                image: AssetImage('assets/images/adidas.png')),
                          ),
                          Spacer(),
                          SizedBox(
                            width: 28,
                            child: Image(
                                image:
                                    AssetImage('assets/images/yulduzcha.png')),
                          ),
                          Text(
                            '5.0',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Container(
                          width: 185,
                          height: 108,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/krasofkanike.png')),
                            color: Colors.grey[350],
                          ),
                        ),
                      ),
                      Spacer(),
                      Text(
                        '\$ 150',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'puma zoom air max',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 15,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 35,
                            child: Image(
                                image:
                                    AssetImage('assets/images/favourite.png')),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18)),
              );
            },
          ),
        ],
      ),
    );
  }
}
