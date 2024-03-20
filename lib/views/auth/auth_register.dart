import 'package:flutter/material.dart';
import 'package:frontend/core/app_export.dart';
import 'package:frontend/views/auth/auth_main.dart';

class AuthRegister extends StatefulWidget {
  AuthRegister({Key? key}) : super(key: key);

  @override
  _AuthRegisterState createState() => _AuthRegisterState();
}

class _AuthRegisterState extends State<AuthRegister> {
  double _appBarHeight = 230.v;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _appBarHeight = 230.v - _scrollController.offset;
        if (_appBarHeight < kToolbarHeight) {
          _appBarHeight = kToolbarHeight;
        }
      });
    });
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController lgInputController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  bool _registerFailed = false;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Handle when all information is valid, for example navigate to AuthLogin screen
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
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              backgroundColor: Color.fromRGBO(115, 219, 213, 1),
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AuthMain(),
                    ),
                  );
                },
              ),
              floating: true,
              snap: true,
              pinned: true,
              expandedHeight: 230.v,
              flexibleSpace: LayoutBuilder(
                builder: (context, constraints) {
                  return FlexibleSpaceBar(
                    background: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      height: _appBarHeight,
                      width: constraints.maxWidth,
                      child: CustomImageView(
                        imagePath: ImageConstant.imgRegisterSmlogo,
                        height: 230.v,
                        width: 360.h,
                      ),
                    ),
                  );
                },
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          if (_registerFailed)
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.0),
                              child: Text(
                                "Register failed!",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                          SizedBox(height: 15.v),
                          CustomTextFormField(
                            controller: emailController,
                            hintText: "Email",
                            textInputType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter email";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 15.v),
                          CustomTextFormField(
                            controller: passwordController,
                            hintText: "Password",
                            obscureText: true,
                            showPasswordToggle: true,
                            iconColor: appTheme.teal300,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter password";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 15.v),
                          CustomTextFormField(
                            controller: fullNameController,
                            hintText: "Full Name",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter full name";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 15.v),
                          CustomTextFormField(
                            controller: lgInputController,
                            hintText: "MM/DD/YYYY",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter date of birth";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 15.v),
                          CustomTextFormField(
                            controller: phoneNumberController,
                            hintText: "Parent’s Phone Number",
                            textInputType: TextInputType.phone,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter phone number";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20.v),
                          GestureDetector(
                            onTap: _submitForm,
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.blue,
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 28.h, vertical: 11.v),
                              child: Text(
                                "Register",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
