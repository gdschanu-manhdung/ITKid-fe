
import 'package:flutter/material.dart';
import 'package:frontend/views/home/course.dart';
import 'package:frontend/views/lesson/lesson-summary.dart';
import '../home/component/status_bar.dart';

class LessonResultSummary extends StatefulWidget {
  final String title;
  final int point;

  const LessonResultSummary({super.key, required this.title, required this.point});

  @override
  State<LessonResultSummary> createState() => _LessonResultSummaryStage();
}

class _LessonResultSummaryStage extends State<LessonResultSummary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(207, 254, 255, 1.0),
        actions: <Widget>[
          NavigationBar1(),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              widget.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                shadows: [
                  Shadow(
                    offset: Offset(1.0, 1.0),
                    blurRadius: 3.0,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
          Text('Points: ' '${widget.point}''/10',
            style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 20,
                color: (widget.point>7)? Colors.green: Colors.pink
            )
            ,),
          const SizedBox(height: 100,),
          Center(
            widthFactor: double.infinity,
            child: (widget.point>7)?Image.asset('assets/images/result.png')
            :Image.asset('assets/images/missionFailed.png'),
          ),
          const SizedBox(height: 20,),
          ((widget.point<8))? TextButton(
              style: ButtonStyle(
                shadowColor: MaterialStateProperty.all<Color>(Colors.grey),
                elevation: MaterialStateProperty.all<double>(5),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LessonSummary(  title: 'widget.title',)),
                );
              },
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('Try again', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),),
              ))
          : const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextButton(
                style: ButtonStyle(
                  shadowColor: MaterialStateProperty.all<Color>(Colors.grey),
                  elevation: MaterialStateProperty.all<double>(5),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Course(true, widget.title)),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('Back to home', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),),
                )),
          ),

        ],
      ),
    );
  }
}
