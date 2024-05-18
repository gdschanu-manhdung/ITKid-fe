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
      child: SizedBox(
        width: MediaQuery.of(context).size.width/2-16,
        height: 150,
        child: Card(

          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Row(
            children: <Widget>[

              // Ảnh trong thẻ
              ClipRRect(
                borderRadius: const BorderRadius.all( Radius.circular(15.0)),
                child: getImage(name),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text("$name" ' Course',style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),),
                  ),
                  const SizedBox(height: 10,),
                  Row(

                    children: [
                      const SizedBox(width: 100,),
                      TextButton(
                        onPressed:(){
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Course( true, name)),
                          );
                        } ,
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(16,0,16,0),
                          child: Text('Learn', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                        ),

                      )
                    ],
                  ),

                ],
              )
              // Tiêu đề trong thẻ

            ],
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
        height: 110,
        fit: BoxFit.cover,
      ),
      'Python': Image.asset(
        'assets/images/logo_python.png',
        width: 130,
        height: 120,
        fit: BoxFit.cover,
      ),
      'C++': Image.asset(
        'assets/images/C++.png',
        width: 130,
        height: 120,
        fit: BoxFit.cover,
      ),
      'C#': Image.asset(
        'assets/images/C#.png',
        width: 130,
        height: 120,
        fit: BoxFit.cover,
      ),
      'Dart': Image.asset(
        'assets/images/logo_dart.png',
        width: 130,
        height: 120,
        fit: BoxFit.cover,
      ),
      'JavaScript': Image.asset(
        'assets/images/javascript.png',
        width: 130,
        height: 120,
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