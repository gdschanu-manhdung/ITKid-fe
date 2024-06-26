import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';

import 'package:flutter/material.dart';
import 'package:frontend/game/my_game.dart';
import 'package:frontend/game/screen/listGame.dart';
import 'package:frontend/views/account/account_view.dart';
import 'package:frontend/views/auth/auth_login.dart';
import 'package:frontend/views/auth/auth_main.dart';
import 'package:frontend/views/compete/compete_prematch.dart';
import 'package:frontend/views/home/homePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/utils/color.dart';


class Menu extends StatefulWidget {
  final int? index;


  Menu({Key? key,  this.index}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int _index = 0;
  String title = "HOME";
  @override
  void initState() {
    super.initState();
    if(widget.index!=null) {
      _index = widget.index!;
      switch(_index) {
        case 0 :title = 'HOME';
        break;
        case 1: title = "FIND A MATCH";
        break;
        case 2: title = "PROFILE";
        break;
        case 3: title = "GAME";
        break;
        default: title = "Lỗi";
      }
    }
  }

  void _logout(BuildContext context) async {
    bool confirmed = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.center,
          title: const Text("Confirm Log out", textAlign: TextAlign.center),
          content: Text("Are you sure you want to log out?"),
          actions: <Widget>[
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop(false); // Return false when canceled
              },
            ),
            TextButton(
              child: Text("Confirm"),
              onPressed: () {
                Navigator.of(context).pop(true); // Return true when confirmed
              },
            ),
          ],
        );
      },
    );

    if (confirmed ?? false) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('hasUserData', false);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => AuthMain(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body:
        Stack(
          children: [
            Container(
                color: AppColors.backgroundColor,
                child: (_index==0)?const MyHomePage():(_index==2)?  Account() : (_index==1) ?  Compete() : const ListGame()
            ),


            Column(
              children: [
                Container(
                  height: 90,
                  decoration: BoxDecoration(
                    color: AppColors.colorTheme,
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(40.0), // Adjust corner radius here
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16, top: 36),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
                        ),

                        IconButton(onPressed: () => _logout(context), icon: const Icon(Icons.logout, color: Colors.white, size: 30,))
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                CurvedNavigationBar(
                  index: _index,
                  color: AppColors.colorTheme,
                  backgroundColor: Colors.transparent,
                  items: const [
                    CurvedNavigationBarItem(
                      child: Icon(Icons.home, color: Colors.white, size: 35,),),
                    CurvedNavigationBarItem(
                      child: Icon(Icons.sensor_occupied_sharp, color: Colors.white, size: 35,),),
                    CurvedNavigationBarItem(
                      child: Icon(Icons.person, color: Colors.white, size: 35,),),
                    CurvedNavigationBarItem(
                      child: Icon(Icons.gamepad_outlined, color: Colors.white, size: 35,),),
                  ],
                  onTap: (index) {
                    setState(() {
                      switch(index) {
                        case 0 :title = 'HOME';
                        break;
                        case 1: title = "FIND A MATCH";
                        break;
                        case 2: title = "PROFILE";
                        break;
                        case 3: title = "GAME";
                        break;
                        default: title = "Lỗi";
                      }
                      _index = index;
                    });

                  },

                ),
              ],
            ),
          ],
        )

    );




  }
}