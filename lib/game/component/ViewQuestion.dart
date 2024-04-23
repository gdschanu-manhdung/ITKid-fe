import 'package:flutter/material.dart';
import 'package:frontend/game/my_game.dart';

import '../../repository/question.dart';

List <Color> listColorButton = [Colors.white, Colors.white, Colors.white, Colors.white, Colors.white];
class ViewQuestion extends StatefulWidget {
  final Question question;
  const ViewQuestion({Key? key, required this.question});

  @override
  State<ViewQuestion> createState() => _ViewQuestionState();
}

class _ViewQuestionState extends State<ViewQuestion> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.question.question, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
        const SizedBox(height: 30,),
        Expanded(
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            childAspectRatio: 1.7,
            children: [
              getButton(widget.question, 0),
              getButton(widget.question, 1),
              getButton(widget.question, 2),
              getButton(widget.question, 3),
            ],
          ),
        ),
      ],
    );
  }
  Widget getButton(Question question, int option) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextButton(
          onPressed: () {
            checkResult(question, option);
            resetStatus(option);
          },
          style: ButtonStyle(
            shadowColor: MaterialStateProperty.all<Color>(Colors.grey),
            elevation: MaterialStateProperty.all<double>(5),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(listColorButton[option]),
          ),
          child: Text(
            question.option![option],
            style:
            const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          )),
    );
  }
  void checkResult(Question question, int choice) {
    setState(() {
      if(question.correctAnswer == choice) {
        listColorButton[choice] = Colors.green;
      } else {
        listColorButton[choice] = Colors.red;
      }
    });


  }
  void resetStatus(int option) {
    Future.delayed(const Duration(seconds: 2), () {

    });
  }
}
