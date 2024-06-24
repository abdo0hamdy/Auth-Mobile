import 'package:flutter/material.dart';
import 'package:intern_task/constants/styles.dart';
import 'package:intern_task/widgets/buttons.dart';
import 'package:intern_task/widgets/positiond.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
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
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 90,
                    ),
                    Center(
                      child: Text(
                        "Create new account ",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
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
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 15),
                        child: Text(
                          "Email",
                          style: TextStyle(color: MyColor.myLightgrey),
                        )),
                    Container(
                      margin: const EdgeInsets.only(left: 15, right: 15),
                      width: double.infinity,
                      height: 50,
                      decoration: boxDecoration,
                      child: TextField(
                        controller: usernameController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 15, top: 5),
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
                          
                          focusColor: MyColor.mylightblue,
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                    Mybuttons(check: 1,username: usernameController.text ,password: passwordController.text,),
                  ],
                ),
              ),
            ],),
          ),
        ),

      
    );
  }
}
