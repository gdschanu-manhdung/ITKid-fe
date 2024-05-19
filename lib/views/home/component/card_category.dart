import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/views/home/course.dart';

class CardCategory extends StatelessWidget {
  final String name;
  const CardCategory(this.name, {super.key} );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          border: Border.all(
            color: Colors.black12,
            width: 2.0,
          ),
        ),
        width: MediaQuery.of(context).size.width/2-16,
        height: 150,
        child: Row(
          children: <Widget>[

            // Ảnh trong thẻ
            ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(15.0)),
                child: getImage(name)
            ),

            Container(
              color: Colors.grey,
              width: 1,
              height: 100,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("$name" "Course",style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),),

                  ),
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.end,

                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                          onPressed:(){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>
                                    Course(true, name))
                            );

                          } ,
                          style: ButtonStyle(
                            shadowColor: MaterialStateProperty.all<Color>(Colors.grey),
                            elevation: MaterialStateProperty.all<double>(5),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
                          ),
                          child: const Padding(
                            padding:  EdgeInsets.fromLTRB(16,0,16,0),
                            child: Text('Watch', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                          ),


                        ),
                      ),
                    ],
                  ),


                ],
              ),
            )
            // Tiêu đề trong thẻ

          ],
        ),
      ),
    );
  }

  Widget getImage(String name_course) {
    final image = {
      'Java': Image.asset(
        'assets/images/logo_java.png',
        width: 170,
        height: 100,
        fit: BoxFit.cover,
      ),
      'Python': Image.asset(
        'assets/images/logo_python.png',
        width: 160,
        height: 120,
        fit: BoxFit.cover,
      ),
      'C++': Image.asset(
        'assets/images/C++.png',
        width: 170,
        height: 100,
        fit: BoxFit.cover,
      ),
      'C#': Image.asset(
        'assets/images/C#.png',
        width: 170,
        height: 100,
        fit: BoxFit.cover,
      ),
      'Dart': Image.asset(
        'assets/images/logo_dart.png',
        width: 170,
        height: 100,
        fit: BoxFit.cover,
      ),
      'JavaScript': Image.asset(
        'assets/images/javascript.png',
        width: 170,
        height: 100,
        fit: BoxFit.cover,
      ),
    };
    return image[name_course] ?? Image.asset(
      'assets/images/img_course.jpeg',
      width: 130,
      height: 120,
      fit: BoxFit.cover,
    );
  }
}