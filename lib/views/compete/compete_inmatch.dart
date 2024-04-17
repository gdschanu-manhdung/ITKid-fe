import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:frontend/core/app_export.dart';
import 'package:frontend/views/compete/compete_result.dart';
import 'package:frontend/views/compete/component/status_bar_compete.dart';
import '../../base.dart';
import './component/option_input.dart';
import './component/inputscore_right.dart';
import './component/inputscore_left.dart';

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

  int? selectedOptionIndex;
  List<bool> selectedOptions = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    api();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..addListener(() {
      setState(() {});
    });
    controller.forward().whenComplete(() {
      // Reset trạng thái isSelected trong từng OptionInput về false
      for (int i = 0; i < shuffledOptions.length; i++) {
        setState(() {
          selectedOptionIndex = null;
        });
      }
    });
  }

  Future api() async{
    final response = await http.get(Uri.parse('https://opentdb.com/api.php?amount=10&category=18&difficulty=medium&type=multiple'));
    if(response.statusCode == 200) {
      var data = jsonDecode(response.body)['results'];
      setState(() {
        responseData = data;
        updateShuffledOption();
        selectedOptions = List.generate(responseData.length, (index) => false);
      });

    }
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
        controller.forward();
        selectedOptions = List.generate(responseData.length, (index) => false);
      }
      if (number == responseData.length - 1) {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => CompeteResult(),
            transitionDuration: const Duration(seconds: 2),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(255, 153, 175, 1),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, size: 35,),
            color: const Color.fromRGBO(246, 0, 52, 1),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Menu(),
                ),
              );
            },
          ),
          actions: <Widget>[
            NavigationBar2(),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 4,
                    blurRadius: 5,
                    offset: const Offset(0, 2),
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
                                          color: const Color.fromRGBO(246, 0, 52, 1),
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
                                    color: const Color(0xFFF60034),
                                    backgroundColor: const Color(0xFFE5E5E5),
                                  ),
                                ),
                                SizedBox(height: 20.v),
                                Container(
                                  width: SizeUtils.width * 0.9,
                                  height: SizeUtils.height * 0.3,
                                  padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 50.v),
                                  decoration: AppDecoration.outlineBlueGray.copyWith(
                                    borderRadius: BorderRadiusStyle.roundedBorder20,
                                    color: const Color(0xFFFCFCFC),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    responseData.isNotEmpty? responseData[number]['question'] : 'Loading...',
                                    style: TextStyle(
                                      color: appTheme.black900,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20.v),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 15.h),
                                  child: GridView.count(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 15.v,
                                    crossAxisSpacing: 15.h,
                                    childAspectRatio: 2.6,
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    children: List.generate(shuffledOptions.length, (index) {
                                      bool isCorrect = index == shuffledOptions.indexOf(
                                          responseData[number]['correct_answer']);
                                      return OptionInput(
                                          option: shuffledOptions[index],
                                          isCorrect: isCorrect,
                                          isSelected: selectedOptions[index],
                                          onPressed: () {
                                            setState(() {
                                              selectedOptionIndex = index;
                                              if (isCorrect) {
                                                selectedOptions[index] = true;
                                              } else {
                                                selectedOptions[index] = true;
                                                for (int i = 0; i < shuffledOptions.length; i++) {
                                                  if (shuffledOptions[i] == responseData[number]['correct_answer']) {
                                                    selectedOptions[i] = true;
                                                  }
                                                }
                                              }
                                              Future.delayed(const Duration(milliseconds: 500), () {
                                                nextQuestion();
                                              });
                                            });
                                          }
                                      );
                                    }),
                                  ),
                                ),
                                SizedBox(height: 10.v),
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