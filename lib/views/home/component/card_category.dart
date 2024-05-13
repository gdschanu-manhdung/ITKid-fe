import 'package:flutter/material.dart';

class CardCategory extends StatelessWidget {
  final int type;
   const CardCategory(this.type, {super.key} );

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
                child: Image.asset(
                  'assets/images/img_course.jpeg',
                  width: 130,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('Course Name',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),),
                  ),
                  const SizedBox(height: 10,),
                 getButton(this.type),

                ],
              )
              // Tiêu đề trong thẻ

            ],
          ),
        ),
      ),
    );
  }
  Widget getButton(int type) {
    final buttons = {
      1: TextButton(
        onPressed:(){
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
          child: Text('Continue', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
        ),

      ),
      2: TextButton(
        onPressed:(){
        } ,
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(Colors.green),
        ),
        child: const Padding(
          padding: EdgeInsets.fromLTRB(16,0,16,0),
          child: Text('Start', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
        ),

      ),
      3: TextButton(
        onPressed:(){
        } ,
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(Colors.orangeAccent),
        ),
        child: const Padding(
          padding: EdgeInsets.fromLTRB(16,0,16,0),
          child: Text('Review', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
        ),

      ),
    };

    return buttons[type] ?? const Text('Invalid type');
  }
}