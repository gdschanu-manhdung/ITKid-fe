import 'package:flutter/material.dart';
import 'package:frontend/core/app_export.dart';
import 'package:frontend/views/home/component/status_bar.dart';
import 'package:frontend/views/wallet/wallet.dart';
import '../../core/theme/theme_helper.dart';
import '../../core/utils/size_utils.dart';

class WalletInfo extends StatelessWidget {
  WalletInfo({Key? key}) : super(key: key);

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        Future.delayed(const Duration(seconds: 1), () {
          Navigator.of(context).pop();
        });
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.h),
          ),
          backgroundColor: Colors.transparent,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 150,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.h),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'You received 300 ITK. Thank you!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: appTheme.orange300,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: appTheme.blue50,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, size: 35,),
            color: appTheme.blue400,
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Wallet(),
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
                                SizedBox(height: 15.v),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 20.h),
                                  padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 25.v),
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
                                              "Ratio: ",
                                              style: TextStyle(
                                                color: appTheme.black900,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(width: 5.h),
                                            Text(
                                              "10.000 VND ",
                                              style: TextStyle(
                                                color: appTheme.orange300,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              "=",
                                              style: TextStyle(
                                                color: appTheme.black900,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              " 100 ITK",
                                              style: TextStyle(
                                                color: appTheme.orange300,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5.v),
                                        Text(
                                          "Admin E-pay account information",
                                          style: TextStyle(
                                            color: appTheme.black900,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 5.v),
                                        Row(
                                          children: [
                                            SizedBox(width: 10.h),
                                            Icon(
                                              Icons.circle,
                                              color: appTheme.black900,
                                              size: 8,
                                            ),
                                            SizedBox(width: 8.h),
                                            Text(
                                              "Account number: ",
                                              style: TextStyle(
                                                color: appTheme.black900,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5.v),
                                        Row(
                                          children: [
                                            SizedBox(width: 23.h),
                                            Text(
                                              "0123456789",
                                              style: TextStyle(
                                                color: appTheme.orange300,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5.v),
                                        Row(
                                          children: [
                                            SizedBox(width: 10.h),
                                            Icon(
                                              Icons.circle,
                                              color: appTheme.black900,
                                              size: 8,
                                            ),
                                            SizedBox(width: 8.h),
                                            Text(
                                              "Bank:",
                                              style: TextStyle(
                                                color: appTheme.black900,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5.v),
                                        Row(
                                          children: [
                                            SizedBox(width: 23.h),
                                            Text(
                                              "ABCD Bank",
                                              style: TextStyle(
                                                color: appTheme.orange300,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5.v),
                                        Row(
                                          children: [
                                            SizedBox(width: 10.h),
                                            Icon(
                                              Icons.circle,
                                              color: appTheme.black900,
                                              size: 8,
                                            ),
                                            SizedBox(width: 8.h),
                                            Text(
                                              "Syntax:",
                                              style: TextStyle(
                                                color: appTheme.black900,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5.v),
                                        Row(
                                          children: [
                                            SizedBox(width: 23.h),
                                            Text(
                                              "[Name] + ITKid Fund In",
                                              style: TextStyle(
                                                color: appTheme.orange300,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5.v),
                                        Row(
                                          children: [
                                            SizedBox(width: 23.h),
                                            Text(
                                              "Example:",
                                              style: TextStyle(
                                                color: appTheme.black900,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5.v),
                                        Row(
                                          children: [
                                            SizedBox(width: 23.h),
                                            Text(
                                              "Hua Khanh Doan ITKid Fund In",
                                              style: TextStyle(
                                                color: appTheme.orange300,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5.v),
                                        Row(
                                          children: [
                                            Text(
                                              "After transfer, press ",
                                              style: TextStyle(
                                                color: appTheme.black900,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              "Confirm ",
                                              style: TextStyle(
                                                color: appTheme.orange300,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              "below.",
                                              style: TextStyle(
                                                color: appTheme.black900,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 5.v),
                                        Text(
                                          "Please wait 1-2 minutes for Admin",
                                          style: TextStyle(
                                            color: appTheme.black900,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 5.v),
                                        Text(
                                          "to confirm.",
                                          style: TextStyle(
                                            color: appTheme.black900,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 25.v),
                                buildButton(
                                  context,
                                  type: "Fund In",
                                  buttonColor: const Color.fromRGBO(255, 112, 142, 1),
                                  boxDecoration: AppDecoration.fillOrange.copyWith(
                                    borderRadius: BorderRadiusStyle.circleBorder23,
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
        _showSuccessDialog(context);
      },
      child: Container(
        width: 170,
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