import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int userSide = Random().nextInt(3);
  int systemSide = Random().nextInt(3);

  int userScore = 0;
  int systemScore = 0;

  void play(int choice) {
    setState(() {
      userSide = choice;
      systemSide = Random().nextInt(3);
      roundWinner();
    });
  }

  void roundWinner() {
    if (userSide != systemSide) {
      if (userSide == 0 && systemSide == 1 ||
          userSide == 1 && systemSide == 2 ||
          userSide == 2 && systemSide == 0) {
        userScore++;
      } else {
        systemScore++;
      }
    }
  }

  bool isPlayed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      appBar: AppBar(
        title: const Text("Rock Paper Scissors",
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.indigo[900],
        elevation: 50,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: AnimatedRotation(
                  curve: Curves.easeInOut,
                  duration: const Duration(milliseconds: 500),
                  turns: isPlayed ? 1 : 0,
                  child: const Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 30,
                            height: 30,
                            child: Image(
                                image: AssetImage("assets/images/btn0.png")),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: SizedBox(
                              width: 30,
                              height: 30,
                              child: Image(
                                  image: AssetImage("assets/images/btn1.png")),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: SizedBox(
                              width: 30,
                              height: 30,
                              child: Image(
                                  image: AssetImage("assets/images/btn2.png")),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text(
                            "Score: $userScore",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.indigo[200]),
                          ),
                          const SizedBox(height: 10),
                          AnimatedScale(
                            scale: isPlayed ? 0 : 1.0,
                            duration: const Duration(microseconds: 500),
                            child: Image(
                                image: AssetImage(
                                    "assets/images/btn$userSide.png")),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "YOU",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.indigo[500]),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Text("vs",
                      style: TextStyle(fontSize: 24, color: Colors.white)),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text(
                            "Score: $systemScore",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.indigo[200]),
                          ),
                          const SizedBox(height: 10),
                          AnimatedScale(
                            scale: isPlayed ? 0 : 1.0,
                            duration: const Duration(microseconds: 500),
                            child: Image(
                                image: AssetImage(
                                    "assets/images/btn$systemSide.png")),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "SYSTEM",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.indigo[500]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              isPlayed = true;
                            });
                            Timer(
                              const Duration(milliseconds: 500),
                              () {
                                setState(() {
                                  isPlayed = false;
                                });
                                play(0);
                              },
                            );
                          },
                          child: const Image(
                              image: AssetImage("assets/images/btn0.png")),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                isPlayed = true;
                              });
                              Timer(
                                const Duration(milliseconds: 500),
                                () {
                                  setState(() {
                                    isPlayed = false;
                                  });
                                  play(1);
                                },
                              );
                            },
                            child: const Image(
                                image: AssetImage("assets/images/btn1.png")),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                isPlayed = true;
                              });
                              Timer(
                                const Duration(milliseconds: 500),
                                () {
                                  setState(() {
                                    isPlayed = false;
                                  });
                                  play(2);
                                },
                              );
                            },
                            child: const Image(
                                image: AssetImage("assets/images/btn2.png")),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
