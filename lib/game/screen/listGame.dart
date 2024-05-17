
import 'package:flutter/material.dart';
import 'package:frontend/game/my_game.dart';



class ListGame extends StatelessWidget {
  const ListGame({super.key});

  @override
  Widget build(BuildContext context) {
    return

      Column(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          const SizedBox(height: 90,),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Treasure Game',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30,
                color: Colors.orange,
                shadows: [
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
                Padding(
                  padding: const EdgeInsets.only(left: 6, right: 6),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all( Radius.circular(15.0)),
                    child: Image.asset(
                      'assets/images/logoGame.jpg',
                      width: MediaQuery.of(context).size.width-32,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width-30,
                    decoration: BoxDecoration(
                      color: Colors.orange.shade100,
                      borderRadius: BorderRadius.circular(20.0), // Set rounded corners
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black54, // Set shadow color
                          blurRadius: 10.0, // Set blur radius
                          offset: Offset(0.0, 10.0), // Set offset
                        ),
                      ],
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(20.0), // Add padding
                      child: Text(
                        'Instruction: Embark on a quest of wit and wisdom to unlock the treasure\'s secrets',
                        style: TextStyle(
                          fontSize: 18.0, // Set font size
                          fontWeight: FontWeight.bold, // Set font weight
                          color: Colors.orange
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                const Row( // Use a Row for horizontal arrangement
                  mainAxisAlignment: MainAxisAlignment.center, // Center the widgets horizontally
                  children: [
                    Text(
                      'Press ',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Play Game',
                      style: TextStyle(
                        fontSize: 19.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      ' when you are ready',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(100, 20, 100, 0),
                  child: TextButton(
                    onPressed:(){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MyGame()),
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
                      backgroundColor: MaterialStateProperty.all(Colors.orange),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(16,0,16,0),
                      child: Text('Play Game',
                        style: TextStyle(fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),),
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
