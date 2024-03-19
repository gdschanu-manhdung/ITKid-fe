import 'package:flutter/material.dart';
import 'package:frontend/views/home/component/card_course.dart';
import 'package:frontend/views/home/component/search_bar.dart';
import 'package:frontend/views/home/component/status_bar.dart';

import 'category.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Color.fromRGBO(207, 254, 255, 1.0),
        actions: <Widget> [

      NavigationBar1(),
      ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Text('HELLO, ',  style: TextStyle(fontSize:17 ,fontWeight: FontWeight.bold, color: Colors.orangeAccent),),
                  Text('Hua Khanh Doan!', style: TextStyle(fontSize:17 ,fontWeight: FontWeight.bold, color: Colors.blueAccent.shade200),),
                  SizedBox(width: 70),
                  Text('300', style: TextStyle(fontSize:17 ,fontWeight: FontWeight.bold, color: Colors.blueAccent.shade200),),
                  Image.asset(
                    'assets/images/coin.png', // Đường dẫn tới ảnh trong thư mục assets
                    width: 30, // Chiều rộng của ảnh
                    height: 30, // Chiều cao của ảnh
                    fit: BoxFit.cover, // Cách hiển thị ảnh trong khung
                  )
                ],
              ),
            ),
          ),
           SearchBarApp(),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,10,0,10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Category()),
                      );
                    },

                    child: Container(
                      color: Color.fromRGBO(207, 254, 255, 1.0),
                      width: 200,
                      height: 220,
                      child: Column(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(' Trending ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                              Icon(Icons.trending_up, size: 40,color: Colors.orange,)
                            ],
                          ),
                          Row(
                            children: [
                            CardCourse('Java'),
                              CardCourse('Python'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(0,10,0,10),
                  child: Container(
                    color: Color.fromRGBO(110, 237, 217, 1.0),
                    width: 200,
                    height: 220,
                    child: Column(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(' Top Free ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                            Icon(Icons.money_off_sharp, size: 40,color: Colors.orange,)
                          ],
                        ),
                        Row(
                          children: [
                            CardCourse('C++'),
                            CardCourse('C#'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(0,10,0,10),
                  child: Container(
                    color: Color.fromRGBO(207, 254, 255, 1.0),
                    width: 200,
                    height: 220,
                    child: Column(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('Top fee ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                            Icon(Icons.monetization_on, color: Colors.orange, size: 40,)
                          ],
                        ),
                        Row(
                          children: [
                            CardCourse('JavaScript'),
                            CardCourse('Dart'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}