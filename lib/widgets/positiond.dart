import 'package:flutter/material.dart';

class Myposition extends StatelessWidget {
  const Myposition({super.key , required this.path});
  final String path; 
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      right: 12,
      left: 12,
      child: Image(
          image: AssetImage(
          path,
      )),
    );
  }
}
