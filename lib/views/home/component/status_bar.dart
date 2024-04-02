import 'package:flutter/material.dart';
import 'package:frontend/views/account/account_view.dart';

import '../../compete/compete_prematch.dart';


class NavigationBar1 extends StatefulWidget {
  @override
  _NavigationBar1State createState() => _NavigationBar1State();
}

class _NavigationBar1State extends State<NavigationBar1> {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(

        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          SizedBox(width: MediaQuery.of(context).size.width * 0.45,),
          Image.asset(
            'assets/images/logo.png', // Đường dẫn tới ảnh trong thư mục assets
            width: MediaQuery.of(context).size.width * 0.09, // Chiều rộng của ảnh
            height: MediaQuery.of(context).size.width * 0.09, // Chiều cao của ảnh
            fit: BoxFit.cover, // Cách hiển thị ảnh trong khung
          ),

          Spacer(),


          PopupMenuButton<String>(


            icon: Icon(Icons.menu, color: Colors.blueAccent.shade200,size: 35,),
            offset: Offset(0, 50),
            onSelected: (value) {
              // Xử lý khi một tùy chọn được chọn
              print('Chọn: $value');
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem<String>(
                value: 'Option 1',
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Icon(Icons.play_circle_fill, color: Colors.blueAccent.shade200, size: 23,),
                      SizedBox(width: 10,),
                      Text('Play Treasure Game',
                        style: TextStyle(fontSize:20,fontWeight: FontWeight.bold, color:Colors.blueAccent.shade200 ),),
                    ],
                  ),
                ),
              ),
              PopupMenuItem<String>(
                value: 'Option 2',
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Icon(Icons.search, color: Colors.blueAccent.shade200, size: 23,),
                      SizedBox(width: 10,),
                      Text('Find A Match',
                        style: TextStyle(fontSize:20,fontWeight: FontWeight.bold, color:Colors.blueAccent.shade200 ),),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Compete()),
                  );
                },
              ),
              PopupMenuItem<String>(
                value: 'Option 3',
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Icon(Icons.account_box, color: Colors.blueAccent.shade200, size: 23,),
                      SizedBox(width: 10,),
                      Text('Account',
                        style: TextStyle(fontSize:20,fontWeight: FontWeight.bold, color:Colors.blueAccent.shade200 ),),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Account()),
                  );
                },
              ),
            ],
          ),


        ],
      ),
    );




  }
}