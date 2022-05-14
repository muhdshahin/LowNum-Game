import 'dart:ui';
import './main.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  int score = 0, lowest = 0, seconds = 5; // the score initilisation
  double height = 0.0, width = 0; //initliasation
  Timer? timer;
  List<int> Numlist = [0, 0, 0, 0];

  void endGame() {
    StopTimer();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => GameOver(value: score)));
  }

  void initState() {
    super.initState();
    initStartGame();
  }

  void check(int user_answer,
      int computer_answer) // the function to check for the user response
  {
    if (user_answer == computer_answer) {
      correct_answer();
    } else {
      endGame();
    }
  }

  void initStartGame() {
    //start the game initially
    StartGame();
  }

  void correct_answer() {
    StopTimer();
    score++;
    seconds = 5;
    StartGame();
  }

  void StopTimer() {
    timer?.cancel();
  }

  void StartGame() {
    timer = Timer.periodic(Duration(seconds: 1), (Timer_callback) {
      setState(() {
        if (seconds > 0) {
          seconds--;
        } else {
          endGame();
        }
      });
    });

    //resstart the game
    int mins = 100, max = 1000;
    if (score < 10) {
      List<int> generator = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
      generator.shuffle();

      Numlist[0] = generator[7];
      Numlist[1] = generator[1];
      Numlist[2] = generator[2];
      Numlist[3] = generator[3];
    } else if (score >= 10 && score <= 50) {
      mins = 100;
      max = 1000;
      Numlist[0] = mins + Random().nextInt(max - mins);
      Numlist[1] = mins + Random().nextInt(max - mins);
      Numlist[2] = mins + Random().nextInt(max - mins);
      Numlist[3] = mins + Random().nextInt(max - mins);
    } else if (score > 50) {
      mins = 1000;
      max = 10000;
      Numlist[0] = mins + Random().nextInt(max - mins);
      Numlist[1] = mins + Random().nextInt(max - mins);
      Numlist[2] = mins + Random().nextInt(max - mins);
      Numlist[3] = mins + Random().nextInt(max - mins);
    }

    lowest = Numlist.reduce(min); //to find the lowest number in the numlist
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height; //total height of the device
    width = MediaQuery.of(context).size.width; //total width of the device

    return Scaffold(
      //backgroundColor: Color.fromRGBO(2, 59, 112, 1),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: height * .55,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(2, 59, 112, 1),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30)),
                ),
              ),
              Container(
                height: height * .45,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: height * .1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ListView(
                  shrinkWrap: true,
                  children: [
                    Container(
                      height: height * .27,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Score",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                score.toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 110,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Time",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                seconds.toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 110,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: width * .1, right: width * .1),
                      child: GridView.count(
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height / 1.4),
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        children: [
                          Container(
                            child: InkWell(
                              splashColor: Colors.orange[300],
                              onTap: () {
                                setState(() {
                                  check(Numlist[0], lowest);
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.blueGrey)),
                                child: Center(
                                    child: Text(
                                  Numlist[0].toString(),
                                  style: TextStyle(
                                      fontSize: 100,
                                      color: Color.fromRGBO(2, 59, 112, 1),
                                      fontWeight: FontWeight.bold),
                                )),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                check(Numlist[1], lowest);
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.blueGrey)),
                              child: Center(
                                  child: Text(
                                Numlist[1].toString(),
                                style: TextStyle(
                                    fontSize: 100,
                                    color: Color.fromRGBO(2, 59, 112, 1),
                                    fontWeight: FontWeight.bold),
                              )),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                check(Numlist[2], lowest);
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.blueGrey)),
                              child: Center(
                                  child: Text(
                                Numlist[2].toString(),
                                style: TextStyle(
                                    fontSize: 100,
                                    color: Color.fromRGBO(2, 59, 112, 1),
                                    fontWeight: FontWeight.bold),
                              )),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                check(Numlist[3], lowest);
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.blueGrey)),
                              child: Center(
                                child: Text(
                                  Numlist[3].toString(),
                                  style: TextStyle(
                                      fontSize: 100,
                                      color: Color.fromRGBO(2, 59, 112, 1),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GameOver extends StatelessWidget {
  final int value;

  const GameOver({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(2, 59, 112, 1),
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * .5,
            width: MediaQuery.of(context).size.width * .8,
            child: Card(
              color: Colors.white,
              elevation: 10,
              child: Column(
                children: [
                  Card(
                    elevation: 10,
                    child: Text(
                      "    GAME OVER    ",
                      style: TextStyle(
                          fontSize: 50,
                          color: Color.fromRGBO(2, 59, 112, 1),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * .032,
                  ),
                  Icon(
                    Icons.emoji_events,
                    color: Colors.yellow[900],
                    size: 54.0,
                  ),
                  Text(
                    "YOUR SCORE",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown[900],
                    ),
                  ),
                  Container(
                    color: Color.fromRGBO(2, 59, 112, 1),
                    height: MediaQuery.of(context).size.height * .1,
                    width: MediaQuery.of(context).size.width * .25,
                    child: Center(
                      child: Text(
                        value.toString(),
                        style: TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * .032,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width * .45,
                      height: MediaQuery.of(context).size.height * .09,
                      color: Color.fromRGBO(2, 59, 112, 1),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (_) => HomePage()));
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color.fromRGBO(2, 59, 112, 1))),
                        child: Center(
                          child: Row(
                            children: [
                              Icon(
                                Icons.refresh_outlined,
                                color: Colors.white,
                                size: 32.0,
                              ),
                              const Text(
                                '  PLAY AGAIN',
                                style: TextStyle(fontSize: 25),
                              ),
                            ],
                          ),
                        ),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/*

ListView(
            children: [
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  primary: false,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          check(Numlist[0], lowest);
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue[300],
                            border: Border.all(color: Colors.blueGrey)),
                        child: Center(
                            child: Text(
                          Numlist[0].toString(),
                          style: TextStyle(
                              fontSize: 100,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          check(Numlist[1], lowest);
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue[300],
                            border: Border.all(color: Colors.blueGrey)),
                        child: Center(
                            child: Text(
                          Numlist[1].toString(),
                          style: TextStyle(
                              fontSize: 100,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          check(Numlist[2], lowest);
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue[300],
                            border: Border.all(color: Colors.blueGrey)),
                        child: Center(
                            child: Text(
                          Numlist[2].toString(),
                          style: TextStyle(
                              fontSize: 100,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          check(Numlist[3], lowest);
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue[300],
                            border: Border.all(color: Colors.blueGrey)),
                        child: Center(
                            child: Text(
                          Numlist[3].toString(),
                          style: TextStyle(
                              fontSize: 100,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),




*/
