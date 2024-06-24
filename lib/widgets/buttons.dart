import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intern_task/constants/strings.dart';
import 'package:intern_task/constants/styles.dart';
import 'package:intern_task/model/user.dart';
import 'package:intern_task/providers/token.dart';
import 'package:intern_task/services/api.dart';

class Mybuttons extends ConsumerStatefulWidget {
  const Mybuttons(
      {super.key,
      required this.check,
      required this.username,
      required this.password});
  final int check;
  final String username;
  final String password;
  @override
  ConsumerState<Mybuttons> createState() => _MybuttonsState();
}

class _MybuttonsState extends ConsumerState<Mybuttons> {
  bool isChecked = false;
  ApiServices apiServices = ApiServices();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 30),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 10,
                child: Checkbox(
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    }),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    isChecked = !isChecked;
                  });
                },
                child: Text(
                  "Remember me ",
                  style: TextStyle(color: Colors.black),
                ),
                style: TextButton.styleFrom(
                  primary: Colors.white, // Text Color
                ),
              ),
              const Spacer(),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    widget.check == 0 ? "Forgot Password?" : "Have a problem?",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                        decorationColor: MyColor.mydarkblue,
                        decorationThickness: 2.5),
                  ))
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: Container(
            height: 50,
            margin: const EdgeInsets.only(left: 20, right: 20),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(5)),
            child: TextButton(
              onPressed: () async {
                if (widget.check == 0) {
                  User? user = await apiServices.getUser(
                      widget.username, widget.password);
                  ref.read(tokenProvider.notifier).addToken(user!.token);
                  Navigator.pushReplacementNamed(
                    context,
                    '/Profile',
                  );
                } else {
                  Navigator.pushReplacementNamed(context, Login_Screen);
                }
              },
              child: Text(
                widget.check == 0 ? 'Log in' : "Register",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          margin: EdgeInsets.only(left: 15),
          child: Row(
            children: [
              Text(
                  widget.check == 0
                      ? "Don't have an account?"
                      : "Already have an account ?",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                  )),
              TextButton(
                  onPressed: () {
                    widget.check == 0
                        ? Navigator.pushReplacementNamed(
                            context, Register_screen)
                        : Navigator.pushReplacementNamed(context, Login_Screen);
                  },
                  child: Text(
                    widget.check == 0 ? "Register" : "Log in",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.black,
                        decorationThickness: 2),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
