import 'package:flutter/material.dart';
import 'package:frontend/views/account/account_view.dart';

import '../../../base.dart';
import '../compete_prematch.dart';


class NavigationBar2 extends StatefulWidget {
  @override
  _NavigationBar2State createState() => _NavigationBar2State();
}

class _NavigationBar2State extends State<NavigationBar2> {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: MediaQuery.of(context).size.width * 0.43,),
          Image.asset(
            'assets/images/logo.png', // Đường dẫn tới ảnh trong thư mục assets
            width: MediaQuery.of(context).size.width * 0.1, // Chiều rộng của ảnh
            height: MediaQuery.of(context).size.width * 0.1, // Chiều cao của ảnh
            fit: BoxFit.cover, // Cách hiển thị ảnh trong khung
          ),
          const Spacer(),
          PopupMenuButton<String>(
            icon: const Icon(Icons.menu, color: Color.fromRGBO(246, 0, 52, 1),size: 35),
            offset: const Offset(0, 50),
            onSelected: (value) {
              // Xử lý khi một tùy chọn được chọn
              print('Chọn: $value');
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem<String>(
                value: 'Option 1',
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Row(
                    children: [
                      Icon(Icons.play_circle_fill, color: Color.fromRGBO(246, 0, 52, 1), size: 23),
                      SizedBox(width: 10,),
                      Text('Play Treasure Game',
                          style: TextStyle(fontSize:20,fontWeight: FontWeight.bold, color:Color.fromRGBO(246, 0, 52, 1) )),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Menu(index: 3,)),
                  );
                },
              ),
              PopupMenuItem<String>(
                value: 'Option 2',
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Row(
                    children: [
                      Icon(Icons.search, color: Color.fromRGBO(246, 0, 52, 1), size: 23,),
                      SizedBox(width: 10,),
                      Text('Find A Match',
                        style: TextStyle(fontSize:20,fontWeight: FontWeight.bold, color: Color.fromRGBO(246, 0, 52, 1),),)
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Menu(index: 1,)),
                  );
                },
              ),
              PopupMenuItem<String>(
                value: 'Option 3',
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Row(
                    children: [
                      Icon(Icons.account_box, color: Color.fromRGBO(246, 0, 52, 1), size: 23,),
                      SizedBox(width: 10,),
                      Text('Account',
                        style: TextStyle(fontSize:20,fontWeight: FontWeight.bold, color:Color.fromRGBO(246, 0, 52, 1),),)
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Menu(index: 2,)),
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