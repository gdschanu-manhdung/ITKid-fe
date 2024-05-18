import 'package:flutter/material.dart';
import 'package:frontend/views/home/component/card_category.dart';


import 'component/status_bar.dart';

class Category extends StatefulWidget {
  final String query;
  const Category({super.key, required this.query});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List<String> languages = ['Java', 'C++', 'C#', 'Dart', 'JavaScript', 'Python'];
  List<String> result = [];
  @override
  void initState() {
    for (String language in languages) {
      if (language.toLowerCase().contains(widget.query.toLowerCase())) {
        result.add(language);
      }
    }
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: const Color.fromRGBO(207, 254, 255, 1.0),
        actions: <Widget> [

          NavigationBar1(),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Search results for:' "${widget.query}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24,),
            ),
          ),
          Expanded(
              child: ListView(
                children: result.isEmpty
                    ? [const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Icon(Icons.search_off_outlined, color: Colors.red, size: 70,),
                      Text("No Result! Please try again",
                        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 22),),
                    ],
                  ),
                )]
                    : [
                  for (String str in result)
                    CardCategory(str),
                ],
              )

          )

        ],
      ),
    );
  }
}