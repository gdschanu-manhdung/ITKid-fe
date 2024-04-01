import 'package:flutter/material.dart';
import 'package:frontend/views/home/course.dart';
import '../home/component/status_bar.dart';

class LessonResult extends StatefulWidget {
  final String title;

  const LessonResult({super.key, required this.title});

  @override
  State<LessonResult> createState() => _LessonResult();
}

class _LessonResult extends State<LessonResult> {
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
          const SizedBox(height: 100,),
          Center(
            widthFactor: double.infinity,
            child: Image.asset('assets/images/result.png'),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 50, 16,16),
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
