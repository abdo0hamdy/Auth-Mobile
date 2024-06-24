import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intern_task/constants/strings.dart';
import 'package:intern_task/constants/styles.dart';
import 'package:intern_task/providers/token.dart';
import 'package:intern_task/services/api.dart';

class Myprofile extends ConsumerWidget {
  const Myprofile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String token = ref.watch(tokenProvider);
    BoxDecoration boxDecoration = MyDecoration.LightContainerDecoration();
    ApiServices apiServices = ApiServices();
    return FutureBuilder(
        future: apiServices.getUserProfile(token),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return Scaffold(
              body: SafeArea(
                  child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(
                  height: 260,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      const Image(
                        image: AssetImage("assets/images/Frame 645.png"),
                        fit: BoxFit.fill,
                        width: double.infinity,
                      ),
                      Positioned(
                        right: 12,
                        left: 12,
                        child: Image.network(
                          snapshot.data!.image,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              snapshot.data!.firstName +
                                  snapshot.data!.lastName,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 22),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 15, bottom: 10),
                              child: Text(
                                "Username",
                                style: TextStyle(color: MyColor.myLightgrey),
                              )),
                          Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.only(
                                left: 15, right: 15, bottom: 10),
                            width: double.infinity,
                            height: 50,
                            decoration: boxDecoration,
                            child: Text(snapshot.data!.username),
                          ),
                          Container(
                              margin:
                                  const EdgeInsets.only(left: 15, bottom: 10),
                              child: Text(
                                "Email",
                                style: TextStyle(color: MyColor.myLightgrey),
                              )),
                          Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.only(
                                left: 15, right: 15, bottom: 10),
                            width: double.infinity,
                            height: 50,
                            decoration: boxDecoration,
                            child: Text(snapshot.data!.email),
                          ),
                          Container(
                              margin:
                                  const EdgeInsets.only(left: 15, bottom: 10),
                              child: Text(
                                "Gender",
                                style: TextStyle(color: MyColor.myLightgrey),
                              )),
                          Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.only(
                                left: 15, right: 15, bottom: 10),
                            width: double.infinity,
                            height: 50,
                            decoration: boxDecoration,
                            child: Text(snapshot.data!.gender),
                          ),
                          Container(
                            height: 50,
                            margin: const EdgeInsets.only(left: 20, right: 20),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(5)),
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, Splash_Screen);
                              },
                              child: const Text(
                                "Log out",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                            ),
                          ),
                        ])),
              ],
            ),
          )));
        });
  }
}
