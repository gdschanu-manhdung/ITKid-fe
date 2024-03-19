import 'package:flutter/material.dart';


class NavigationBar1 extends StatefulWidget {
  @override
  _NavigationBar1State createState() => _NavigationBar1State();
}

class _NavigationBar1State extends State<NavigationBar1> {

  @override
  Widget build(BuildContext context) {
    return Row(

      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        SizedBox(width: 120,),
        Image.asset(
          'assets/images/logo.png', // Đường dẫn tới ảnh trong thư mục assets
          width: 40, // Chiều rộng của ảnh
          height: 40, // Chiều cao của ảnh
          fit: BoxFit.cover, // Cách hiển thị ảnh trong khung
        ),
        SizedBox(width: 100,),


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
            ),
          ],
        ),


      ],
    );




  }
}
