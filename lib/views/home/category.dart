import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/views/home/component/card_category.dart';

import 'component/status_bar.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
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
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Category',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30,shadows: [
                Shadow(
                  offset: Offset(1.0, 1.0),
                  blurRadius: 3.0,
                  color: Colors.black,
                ),
              ],),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
              CardCategory(1),
                CardCategory(2),
                CardCategory(3),
                CardCategory(1),
              ],
            ),
          )
        ],
      ),
    );
  }
}
