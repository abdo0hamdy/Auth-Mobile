import 'package:flutter/material.dart';
import 'package:intern_task/constants/strings.dart';
import 'package:intern_task/constants/styles.dart';


class SplashScren extends StatelessWidget {
  const SplashScren({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: MyColor.mydarkblue),
        width: double.infinity,
        child: SafeArea(
          child: Column(children: [
            const SizedBox(
                width: 250,
                child: Image(
                    image: AssetImage("assets/images/Rectangle 1136.png"))),
            const SizedBox(
              height: 20,
            ),
            Container(
                width: 270,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Register_screen);
                   
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(color: MyColor.mylightblue, fontSize: 18),
                  ),
                )),
            const SizedBox(
              height: 10,
            ),
            Container(
                width: 270,
                decoration: BoxDecoration(
                  color: MyColor.myLightgrey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Login_Screen);
                  },
                  child: const Text(
                    "Log In",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                )),
          ]),
        ),
      ),
    );
  }
}
