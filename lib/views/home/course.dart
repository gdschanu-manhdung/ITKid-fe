
import 'package:flutter/material.dart';
import 'package:frontend/views/home/payment_course.dart';
import 'package:frontend/views/lesson/lesson-summary.dart';
import 'package:frontend/views/lesson/lesson-theory.dart';


import '../../base.dart';
import '../../core/theme/theme_helper.dart';
import 'component/status_bar.dart';

class Course extends StatefulWidget {
  final String name_course;
  final bool isFree;
  const Course(this.isFree, this.name_course,{super.key});

  @override
  State<Course> createState() => _Course();
}

class _Course extends State<Course> {
  bool _showNotification= false;

  // @override
  // void initState() {
  //   _name_course = 'Python';
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: const Color.fromRGBO(207, 254, 255, 1.0),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 25,),
          color: appTheme.black900,
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Menu(),
              ),
            );
          },
        ),
        actions: <Widget> [

          NavigationBar1(),
        ],
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.orange.shade50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('${widget.name_course}' ' Course',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30,shadows: [
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
                      getCard(widget.name_course, 'Lesson 1: Tutorial'),
                      getCard(widget.name_course, 'Lesson 2: Fundamentals'),
                      getCard(widget.name_course, 'Lesson 3: Variable'),
                      getCard(widget.name_course, 'Lesson 4: Summary'),

                    ],
                  ),
                )
              ],
            ),
          ),
          if (_showNotification)
            Container(
              color: Colors.black.withOpacity(0.5), // Màu đen với độ mờ
              child: Center(
                child: Container(
                  width: 350,
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0), // Độ cong của góc
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.all(8.0),

                  child: Column(

                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(8.0, 8,8,0),
                        child:  Text('You have to pay for the course to learn',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  _showNotification = false;
                                });
                              },
                              style: ButtonStyle(
                                shadowColor: MaterialStateProperty.all<Color>(Colors.grey),
                                elevation: MaterialStateProperty.all<double>(5),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                ),
                                backgroundColor: MaterialStateProperty.all(Colors.greenAccent),
                              ),
                              child: const Text('Cancel', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),

                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => PaymentCourse(name_course: widget.name_course, course_fee: 150),),
                                );
                              },
                              style:   ButtonStyle(
                                shadowColor: MaterialStateProperty.all<Color>(Colors.grey),
                                elevation: MaterialStateProperty.all<double>(5),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                ),
                                backgroundColor: MaterialStateProperty.all(Colors.orange),
                              ),
                              child: const Text('Pay course',
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),

                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),

    );
  }
  Widget getCard(String name_course, String _lesson) {

    // String first_lession= _lesson.substring(0, 10);
    // String second_lession= _lesson.substring(10, _lesson.length);

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
                child: getImage(name_course)
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
                    child: Text(_lesson,style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),),
                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     Text('$first_lession',
                    //       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,
                    //       ),),
                    //     Text('$second_lession',
                    //       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,
                    //       ),),
                    //   ],
                    // ),
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
                            setState(() {
                              if(widget.isFree) {
                                if(_lesson == 'Lesson 4: Summary') {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) =>
                                          LessonSummary(
                                              title: widget.name_course))
                                  );
                                }
                                else {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) =>
                                          LessonTheory(
                                              title: widget.name_course))
                                  );
                                }
                              }
                              else
                                {
                                  _showNotification = true;
                                }

                            });

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
                            child: Text('Learn', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
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