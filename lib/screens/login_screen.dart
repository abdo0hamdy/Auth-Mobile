import 'package:flutter/material.dart';
import 'package:intern_task/constants/styles.dart';
import 'package:intern_task/widgets/buttons.dart';
import 'package:intern_task/widgets/positiond.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    BoxDecoration boxDecoration = MyDecoration.LightContainerDecoration();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const SizedBox(
                height: 260,
                width: double.infinity,
                child: Stack(
                  children: [
                    Image(
                      image: AssetImage("assets/images/Frame 645.png"),
                      fit: BoxFit.fill,
                      width: double.infinity,
                    ),
                    Myposition(path: "assets/images/Rectangle 1136.png"),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    const Center(
                      child: Text(
                        "Log in to your account ",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                   
                    Container(
                        margin: EdgeInsets.only(left: 15),
                        child: Text(
                          "Username",
                          style: TextStyle(color: MyColor.myLightgrey),
                        )),
                    Container(
                      margin: const EdgeInsets.only(left: 15, right: 15),
                      width: double.infinity,
                      height: 50,
                      decoration: boxDecoration,
                      child: TextField(
                        controller: usernameController,
                        decoration: MyDecoration.inputDecoration("Username",
                            "assets/images/user icon.png", "", true),
                      ),
                    ),
                    Container(
                        margin:const  EdgeInsets.only(left: 15, top: 5),
                        child: Text(
                          "Password",
                          style: TextStyle(color: MyColor.myLightgrey),
                        )),
                    Container(
                      margin:
                          const EdgeInsets.only(left: 15, right: 15, top: 5),
                      width: double.infinity,
                      height: 50,
                      decoration: boxDecoration,
                      child: TextField(
                        obscureText: passwordVisible,
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: const Image(
                              image: AssetImage(
                                  "assets/images/password icon.png")),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                passwordVisible = !passwordVisible;
                              });
                            },
                            icon: Icon(passwordVisible
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                          hintText: "password",
                          hintStyle: TextStyle(color: MyColor.myLightgrey),
                          focusColor: MyColor.mylightblue,
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                    Mybuttons(
                      check: 0,
                      username: usernameController.text,
                      password: passwordController.text,
                    ),
                  ],
                ),
              ),
              //
            ],
          ),
        ),
      ),
    );
  }
}
