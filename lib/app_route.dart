import 'package:flutter/material.dart';
import 'package:intern_task/constants/strings.dart';
import 'package:intern_task/screens/login_screen.dart';
import 'package:intern_task/screens/profile_screen.dart';
import 'package:intern_task/screens/register_screen.dart';
import 'package:intern_task/screens/splash_screen.dart';


class AppRoute {
  static Map<String, WidgetBuilder> routess = {
      Login_Screen : (context) => const LoginScreen(),
      Register_screen : (context)=>const RegisterScreen(),
      Splash_Screen : (context)=> const SplashScren(),
      Profile_Screen : (context)=> const Myprofile(),
    };
 
}
