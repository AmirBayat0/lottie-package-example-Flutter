// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  bool isActive = false;
  List lottieAnime = [
    "https://assets6.lottiefiles.com/packages/lf20_bmfhnvbu.json",
    "https://assets1.lottiefiles.com/packages/lf20_jyrxvzzj.json",
    "https://assets2.lottiefiles.com/packages/lf20_e4wr20hj.json",
    "https://assets10.lottiefiles.com/packages/lf20_pge4fjym.json",
    "https://assets6.lottiefiles.com/packages/lf20_iwlmrnb5.json",
    "https://assets3.lottiefiles.com/datafiles/fdju4IquCvDv2LF/data.json",
    "https://assets6.lottiefiles.com/temp/lf20_ZGnXlB.json",
    "https://assets1.lottiefiles.com/temp/lf20_C3gF4y.json",
    "https://assets4.lottiefiles.com/temp/lf20_X0J3sC.json",
  ];

/*
Instagram: @CodeWithFlexz
Github: AmirBayat0
Youtube: Programming with Flexz
*/
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(65),
          child: AppBar(
            title: Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                Text(
                  "@CodeWithFlexz",
                  style: TextStyle(fontSize:22, letterSpacing: 2),
                ),
                SizedBox(
                  height: 3,
                ),
                Text("Lottie Animations",
                    style: TextStyle(color: Colors.white38,fontSize:18)),
              ],
            ),
            centerTitle: true,
            backgroundColor: Colors.deepPurple,
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Lottie.network(lottieAnime[currentIndex],
                    animate: isActive),
              ),
            ),
            SizedBox(
              height: 90,
            ),
            // ********************************************************
            // * Paly/Stop Button Components
            MaterialButton(
              color: Colors.deepPurple,
              height: height / 16,
              minWidth: width / 1.5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              onPressed: () {
                setState(() {
                  if (isActive == false) {
                    isActive = true;
                  } else {
                    isActive = false;
                  }
                });
              },
              child: Text(
                isActive ? "stop" : "play",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // ********************************************************
            // * Previous Button Components
            Container(
              margin: EdgeInsets.all(20),
              child: Row(
                children: [
                  // ? Previous Botton Components
                  MaterialButton(
                    color: Colors.deepPurpleAccent,
                    height: height / 16,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    onPressed: () {
                      setState(() {
                        if (currentIndex > -1) {
                          currentIndex--;
                        }
                        if (currentIndex == -1) {
                          currentIndex = 0;
                        }
                      });
                    },
                    child: Text(
                      "Previous",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Expanded(child: Container()),
                  // ********************************************************
                  // * Next Button Components
                  MaterialButton(
                    color: Colors.deepPurpleAccent,
                    height: height / 16,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    onPressed: () {
                      setState(() {
                        if (currentIndex < lottieAnime.length - 1) {
                          currentIndex++;
                        } else {
                          currentIndex = 0;
                        }
                      });
                    },
                    child: Text(
                      "Next",
                      style: TextStyle(color: Colors.white),
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
