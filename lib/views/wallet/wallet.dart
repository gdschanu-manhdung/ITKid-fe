import 'package:flutter/material.dart';
import 'package:frontend/core/app_export.dart';
import 'package:frontend/views/home/component/status_bar.dart';
import 'package:frontend/views/wallet/wallet_info.dart';
import '../../base.dart';
import '../../core/theme/theme_helper.dart';
import '../../core/utils/size_utils.dart';
import '../account/account_view.dart';

class Wallet extends StatelessWidget {
  Wallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: appTheme.blue50,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, size: 25),
            color: appTheme.black900,
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Menu(index: 2,),
                ),
              );
            },
          ),
          actions: <Widget>[
            NavigationBar1(),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4.0), // Đặt chiều cao của vùng chứa bóng
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white, // Màu nền của container
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // Màu của bóng
                    spreadRadius: 4, // Bán kính phân tán của bóng
                    blurRadius: 5, // Độ mờ của bóng
                    offset: const Offset(0, 2), // Độ lệch của bóng
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
                                Text(
                                    "Wallet",
                                    style: theme.textTheme.headlineLarge!.copyWith(
                                      color: const Color(0xFFFFB039),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                    )
                                ),
                                SizedBox(height: 30.v),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 25.h),
                                  padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 25.v),
                                  decoration: AppDecoration.outlineBlueGray.copyWith(
                                    borderRadius: BorderRadiusStyle.roundedBorder20,
                                    color: const Color(0xFFFCFCFC),
                                  ),
                                  child: Padding(
                                    padding:EdgeInsets.only(top: 1.v),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "Your Wallet: 250",
                                              style: TextStyle(
                                                color: appTheme.black900,
                                                fontSize: 26,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(width: 5.h),
                                            Image.asset(
                                              'assets/images/itk_coin.png', // Đường dẫn tới ảnh trong thư mục assets
                                              width: 36, // Chiều rộng của ảnh
                                              height: 36, // Chiều cao của ảnh
                                              fit: BoxFit.cover, // Cách hiển thị ảnh trong khung
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 15.v),
                                        buildButton(
                                            context,
                                            type: "Fund In",
                                            buttonColor: const Color.fromRGBO(255, 112, 142, 1),
                                            boxDecoration: AppDecoration.fillOrange.copyWith(
                                              borderRadius: BorderRadiusStyle.circleBorder23,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ]
                          )
                      )
                    ]
                )
            )
        )
    );
  }

  Widget buildButton(BuildContext context,{
    required String type,
    required Color buttonColor,
    required BoxDecoration boxDecoration
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => WalletInfo(),
          ),
        );
      },
      child: Container(
        width: 180,
        decoration: AppDecoration.outlineBlueGray.copyWith(
          borderRadius: BorderRadiusStyle.circleBorder35,
          color: buttonColor,
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.v),
          decoration: boxDecoration,
          child: Column(
            children: [
              Text(
                type,
                style: theme.textTheme.titleMedium!.copyWith(
                  color: appTheme.whiteA700,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}