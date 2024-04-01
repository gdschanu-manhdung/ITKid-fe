
import 'package:flutter/material.dart';
import 'package:frontend/views/home/course.dart';

import 'component/status_bar.dart';

class PaymentCourse extends StatefulWidget {
  final String name_course;
  final int balance;
  final int course_fee;

  const PaymentCourse(
      {super.key,
      required this.name_course,
      required this.balance,
      required this.course_fee});

  @override
  State<PaymentCourse> createState() => _PaymentCourseState();
}

class _PaymentCourseState extends State<PaymentCourse> {
  bool PaySuccessfully = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(207, 254, 255, 1.0),
        actions: <Widget>[
          NavigationBar1(),
        ],
      ),
      body: Container(
        color: Colors.orange.shade50,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Payment',
                style: TextStyle(
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
            Card(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        '${widget.name_course}' ' Course',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Your Wallet    ' '${widget.balance}' ' ITK',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: !this.PaySuccessfully
                                  ? Colors.blue
                                  : Colors.grey,
                              fontSize: 22)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          'Course free    ' '${widget.course_fee}' ' ITK',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: !this.PaySuccessfully
                                  ? Colors.orange
                                  : Colors.grey,
                              fontSize: 22)),
                    ),
                    Container(
                      width: 250,
                      height: 1,
                      color: Colors.blue,
                    ),
                    resultPay(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget resultPay() {
    if (widget.balance < widget.course_fee) {
      return Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('You need to fund in to pay',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    fontSize: 22)),
          ),
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    shadowColor: MaterialStateProperty.all<Color>(Colors.grey),
                    elevation: MaterialStateProperty.all<double>(5),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.orangeAccent),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Fund In',
                      style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  )))
        ],
      );
    } else {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                'Rest                 '
                '${widget.balance - widget.course_fee}'
                ' ITK',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    fontSize: 22)),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: !this.PaySuccessfully
                ? ElevatedButton(
                    onPressed: () {
                      setState(() {
                        PaySuccessfully = true;
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
                      backgroundColor:
                          MaterialStateProperty.all(Colors.orangeAccent),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Pay',
                        style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ))
                : Column(
                  children: [
                    const Text(
                        "Pay successfully!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.orangeAccent),
                      ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Course( true, widget.name_course)),
                        );
                      },
                      style: ButtonStyle(
    shadowColor: MaterialStateProperty.all<Color>(Colors.grey),
    elevation: MaterialStateProperty.all<double>(5),
    shape: MaterialStateProperty.all(
    RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(30.0),
    ),
    ),
    backgroundColor:
    MaterialStateProperty.all(Colors.orangeAccent),
    ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          " Let's learn",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
          )
        ],
      );
    }
  }
}
