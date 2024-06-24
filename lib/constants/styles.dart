import 'package:flutter/material.dart';

class MyColor {
  static Color mydarkblue =
      Color(int.parse(("#014268").substring(1), radix: 16) + 0xFF000000);
  static Color myblack =
      Color(int.parse(("#242526").substring(1), radix: 16) + 0xFF000000);
  static Color myLightgrey =
      Color(int.parse(("#97b5c6").substring(1), radix: 16) + 0xFF000000);
  static Color mylightblue =
      Color(int.parse(("#3975c4").substring(1), radix: 16) + 0xFF000000);
}

class MyAppThemes {
  static final lightTheme = ThemeData(
    primaryColor: MyColor.myblack,
    secondaryHeaderColor: MyColor.myblack,
    brightness: Brightness.light,
  );
  static final darktTheme = ThemeData(
    primaryColor: Colors.white,
    secondaryHeaderColor: MyColor.myblack,
    brightness: Brightness.dark,
  );
}

class MyDecoration {
  static BoxDecoration DarkContainerDecoration() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white, width: 3));
  }

  static BoxDecoration LightContainerDecoration() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: MyColor.myLightgrey, width: 1.5));
  }

  static InputDecoration inputDecoration(
      String hint, String path1, String path2, bool check) {
    return InputDecoration(
      border: InputBorder.none,
      prefixIcon: Image(image: AssetImage(path1)),
      suffixIcon: path2 != ""
          ? IconButton(
              onPressed: () {
                check = !check;
              },
              icon: Icon(check ? Icons.visibility_off : Icons.visibility),
            )
          : Text(""),
      hintText: hint,
      hintStyle: TextStyle(color: MyColor.myLightgrey),
      focusColor: MyColor.mylightblue,
      fillColor: Colors.white,
    );
  }

  static LinearGradient DarkGradient() {
    return LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          MyColor.mylightblue.withOpacity(0.9),
          MyColor.mylightblue.withOpacity(0.7),
          MyColor.mylightblue.withOpacity(0.5),
          MyColor.mydarkblue.withOpacity(0.5),
          MyColor.mydarkblue.withOpacity(0.7),
          MyColor.mydarkblue.withOpacity(0.9),
        ]);
  }

  static LinearGradient LightGradient() {
    return LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: [
          MyColor.mylightblue,
          MyColor.mylightblue,
          MyColor.mylightblue,
          MyColor.mylightblue,
          MyColor.mylightblue,
          MyColor.mylightblue,
          MyColor.mylightblue.withOpacity(0.6),
          Colors.white,
          Colors.white,
          Colors.white,
          Colors.white,
          Colors.white,
        ]);
  }
}
