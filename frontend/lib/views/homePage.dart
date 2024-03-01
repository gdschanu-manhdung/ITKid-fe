import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BANANA'),
      ),
      body: Column(
        children: [
          // Phần title
          Text('Nhà cái đến từ châu phi',style: TextStyle(fontSize: 20),),
          SizedBox(
            height: 50,
          ),
          // 4 ô button xếp theo 2 hàng 2 cột
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            children: List.generate(4, (index) {
              return ElevatedButton(
                onPressed: () {},
                child: Text(' $index'),
              );
            }),
          ),
          // 3 icon button

        ],
      ),
      bottomNavigationBar:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.home),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}