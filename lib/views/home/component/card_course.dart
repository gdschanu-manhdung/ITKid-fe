import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../course.dart';

class CardCourse extends StatelessWidget {
  final String name_course;
  final bool ?isFree;
  const CardCourse(this.isFree,this.name_course,{super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width/2 - 16,
        height: 150,
        child: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Course( isFree!, name_course)),
            );
          },
          child: Card(
            color: Colors.white,

            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        name_course,
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // Ảnh trong thẻ
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: ClipRRect(
                      borderRadius: const BorderRadius.all( Radius.circular(15.0)),
                      child: getImage(name_course),
                                        ),
                    ),
                    // Tiêu đề trong thẻ

                  ],
                ),
                Positioned(
                  top: 30,
                  right: 30,
                  child: Visibility (
                      visible: !((isFree)?? false),
                      child: const Icon(Icons.diamond_outlined, color: Colors.orange, size: 35,)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget getImage(String name_course) {
    final image = {
      'Java': Image.asset(
        'assets/images/logo_java.png',
        width: 140,
        height: 90,
        fit: BoxFit.cover,
      ),
      'Python': Image.asset(
        'assets/images/logo_python.png',
        width: 130,
        height: 100,
        fit: BoxFit.cover,
      ),
      'C++': Image.asset(
        'assets/images/C++.png',
        width: 140,
        height: 90,
        fit: BoxFit.cover,
      ),
      'C#': Image.asset(
        'assets/images/C#.png',
        width: 140,
        height: 90,
        fit: BoxFit.cover,
      ),
      'Dart': Image.asset(
        'assets/images/logo_dart.png',
        width: 140,
        height: 90,
        fit: BoxFit.cover,
      ),
      'JavaScript': Image.asset(
        'assets/images/javascript.png',
        width: 140,
        height: 90,
        fit: BoxFit.cover,
      ),
    };
    return image[name_course] ?? Image.asset(
      'assets/images/img_course.jpeg',
      width: 140,
      height: 90,
      fit: BoxFit.cover,
    );
  }
}