import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:frontend/core/app_export.dart';
import 'package:frontend/views/compete/compete_result.dart';
import 'package:frontend/views/compete/component/status_bar_compete.dart';
import '../home/homePage.dart';
import './component/option_input.dart';
import './component/inputscore_right.dart';
import './component/inputscore_left.dart';
// import './component/timecount.dart';

class CompeteMatch extends StatefulWidget {
  CompeteMatch({Key? key}) : super(key: key);

  @override
  _CompeteMatchState createState() => _CompeteMatchState();
}

class _CompeteMatchState extends State<CompeteMatch> with SingleTickerProviderStateMixin  {
  late AnimationController controller;
  List responseData = [];
  int number = 0;
  List<String> shuffledOptions = [];
  // late Timer _timer;
  int _secondRemaining = 10;

  bool _isAnswered = false;
  int _correctAns = 0;
  int _selectedAns = 0;
  int _numOfCorrectAns = 0;

  Future api() async{
    final response = await http.get(Uri.parse('https://opentdb.com/api.php?amount=10&category=18&difficulty=medium&type=multiple'));
    if(response.statusCode == 200) {
      var data = jsonDecode(response.body)['results'];
      setState(() {
        responseData = data;
        updateShuffledOption();
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    controller = AnimationController(
      /// [AnimationController]s can be created with `vsync: this` because of
      /// [TickerProviderStateMixin].
      vsync: this,
      duration: const Duration(seconds: 10),
    )..addListener(() {
      setState(() {
        if (_secondRemaining > 0) {
          _secondRemaining--;
        } else {
          _secondRemaining = 10;
        }
      });
    });
    controller.forward().whenComplete(nextQuestion);
    super.initState();
    api();
    // startTimer();
  }

  void updateShuffledOption() {
    setState(() {
      shuffledOptions = shuffledOption(
          [
            responseData[number]['correct_answer'],
            ... (responseData[number]['incorrect_answers'] as List),
          ]
      );
    });
  }

  List<String> shuffledOption(List<String> option) {
    List<String> shuffledOptions = List.from(option);
    shuffledOptions.shuffle();

    return shuffledOptions;
  }

  void nextQuestion() {
    setState(() {
      if (number < responseData.length - 1) {
        number++;
        updateShuffledOption();
        controller.reset();
        controller.forward().whenComplete(nextQuestion);
      }
      if (number == responseData.length - 1) {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => CompeteResult(),
            transitionDuration: Duration(seconds: 2),
          ),
        );
      }
    });
  }

  void checkAns(int index) {
    if (!_isAnswered) {
      _isAnswered = true;
      _selectedAns = index;
      if (responseData[index]['correct_answer'] == shuffledOptions[index]) {
        _correctAns = index;
        _numOfCorrectAns++;
      }
      setState(() {
        controller.stop();
      });
      Future.delayed(Duration(seconds: 1), nextQuestion);
    }
  }

  // function for timer
  // void startTimer() {
  //   _timer = Timer.periodic(Duration(seconds: 1), (timer) {
  //     setState(() {
  //       if (_secondRemaining > 0) {
  //         _secondRemaining--;
  //       } else {
  //         nextQuestion();
  //         _secondRemaining = 10;
  //         updateShuffledOption();
  //       }
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(255, 153, 175, 1),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, size: 35,),
            color: Color.fromRGBO(246, 0, 52, 1),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                ),
              );
            },
          ),
          actions: <Widget>[
            NavigationBar2(),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(4.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 4,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SizedBox(
            width: SizeUtils.width,
            child: SingleChildScrollView(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom
                ),
                child: Column(
                    children: [
                      SizedBox(
                          width: double.maxFinite,
                          child: Column(
                              children: [
                                SizedBox(height: 15.v),
                                Align(
                                  child: Text(
                                    "Question ${number + 1}/10",
                                    style: theme.textTheme.headlineLarge!.copyWith(
                                      color: Color.fromRGBO(246, 0, 52, 1),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 26,
                                    )
                                  )
                                ),
                                SizedBox(height: 20.v),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                          child: Padding(
                                              padding: EdgeInsets.only(left: 20.h, right: 8.h),
                                              child: InputScoreLeft(
                                                player: "You",
                                                point: "40",
                                              )
                                          )
                                      ),
                                      Expanded(
                                          child: Padding(
                                              padding: EdgeInsets.only(left: 8.h, right: 20.h),
                                              child: InputScoreRight(
                                                point: "30",
                                                player: "Opp",
                                              )
                                          )
                                      ),
                                    ]
                                ),
                                SizedBox(height: 20.v),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                                  child: LinearProgressIndicator(
                                    value: controller.value,
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color(0xFFF60034),
                                    backgroundColor: Color(0xFFE5E5E5),
                                  ),
                                ),
                                SizedBox(height: 20.v),
                                Container(
                                    margin: EdgeInsets.symmetric(horizontal: 20.h),
                                    padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 50.v),
                                    decoration: AppDecoration.outlineBlueGray.copyWith(
                                      borderRadius: BorderRadiusStyle.roundedBorder20,
                                      color: Color(0xFFFCFCFC),
                                    ),
                                    child: Padding(
                                      padding:EdgeInsets.only(top: 1.v),
                                      child: Column(
                                        children: [
                                          SizedBox(height: 10.v),
                                          Text(
                                            responseData.isNotEmpty? responseData[number]['question'] : 'Loading...',
                                            style: TextStyle(
                                              color: appTheme.black900,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 10.v),
                                        ],
                                      ),
                                    )
                                ),
                                SizedBox(height: 20.v),
                                Column(
                                  children: [
                                    Row(
                                      children: (responseData.isNotEmpty && responseData[number]['incorrect_answers'] != null) ?
                                      shuffledOptions.sublist(0, 2).map((option) {
                                        return Expanded(
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.v),
                                            child: OptionInput(
                                              option: option,
                                            ),
                                          ),
                                        );
                                      }).toList() : [],
                                    ),
                                    Row(
                                      children: (responseData.isNotEmpty && responseData[number]['incorrect_answers'] != null) ?
                                      shuffledOptions.sublist(2, 4).map((option) {
                                        return Expanded(
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.v),
                                            child: OptionInput(

                                              option: option,
                                            ),
                                          ),
                                        );
                                      }).toList() : [],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10.v),
                                // Row(
                                //     mainAxisAlignment: MainAxisAlignment.center,
                                //     children: [
                                //       Expanded(
                                //           child: Padding(
                                //               padding: EdgeInsets.symmetric(horizontal: 25.h),
                                //               child: TimeCount(
                                //                 time: _secondRemaining.toString(),
                                //               )
                                //           )
                                //       ),
                                //     ]
                                // ),
                              ]
                          )
                      )
                    ]
                )
            )
        )
    );
  }
}
