import 'dart:async';
import 'dart:math';
import 'package:ChidiyaUdd/Widgets/Bar.dart';
import 'package:ChidiyaUdd/Widgets/WinnerModal.dart';
import 'package:ChidiyaUdd/utils/Constants.dart';
import 'package:ChidiyaUdd/utils/Words.dart';
import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  bool _gameBegan = false;
  List _players = [
    {"id": 1, "name": "player1", "score": 0, "lock": false},
    {"id": 2, "name": "player2", "score": 0, "lock": false}
  ];
  String _word = "Ready ?";
  List _words = Words.words;
  Timer _timer;
  TextEditingController controller1;
  TextEditingController controller2;

  @override
  void initState() {
    super.initState();
    controller1 = TextEditingController(text: _players[0]["name"]);
    controller1.addListener(_controller1Listener);
    controller2 = TextEditingController(text: _players[1]["name"]);
    controller2.addListener(_controller2Listener);
  }

  void _controller1Listener() {
    setState(() {
      _players[0]["name"] = controller1.text;
    });
  }

  void _controller2Listener() {
    setState(() {
      _players[1]["name"] = controller2.text;
    });
  }

  void _editName(TextEditingController textController) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (_) => Container(
          padding: MediaQuery.of(context).viewInsets,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                  child: Container(
                padding: EdgeInsets.all(5.0),
                child: TextField(
                  style: TextStyle(fontSize: 18.0),
                  controller: textController,
                  autofocus: true,
                  decoration: InputDecoration(border: InputBorder.none),
                  onSubmitted: (newName) {
                    textController.text = newName;
                    Navigator.pop(context);
                  },
                ),
              )),
            ],
          )),
    );
  }

  void _releaseLocks() {
    _players.forEach((player) {
      player["lock"] = false;
    });
  }

  void _gameBegin() {
    setState(() {
      _gameBegan = true;
    });
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      _releaseLocks();
      var temp = _words[Random().nextInt(_words.length)];
      setState(() {
        _word=temp["word"];
      });
    });
  }

  void _tappedUp(int playerId) {
    _players.forEach((player) {
      if (player["id"] == playerId) {
        player["lock"] = true;
      }
    });
  }

  String _calculatescore() {
    int max = -1;
    String winner;
    _players.forEach((player) {
      if (player["score"] > max) {
        max = player["score"];
        winner = player["name"];
      }
    });
    return winner;
  }

  void _endGame() async {
    _timer.cancel();
    String winnerName = _calculatescore();
    showDialog(
        context: context, builder: (_) => WinnerModal(winnerName: winnerName));

    setState(() {
      _gameBegan = false;
    });
  }

  @override
  void dispose() {
    controller1.removeListener(_controller1Listener);
    controller1.dispose();
    controller2.removeListener(_controller2Listener);
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Image(
            image: AssetImage('assets/images/game_bg.png'),
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(height: 30.0),
              Transform.rotate(
                angle: pi,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      _players[1]["name"],
                      style: TextStyle(
                          color: Color(Colours.primaryColor),
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold),
                    ),
                    _gameBegan
                        ? SizedBox()
                        : IconButton(
                            icon: Icon(
                              Icons.edit,
                              color: Color(Colours.primaryColor),
                            ),
                            onPressed: () => _editName(controller2))
                  ],
                ),
              ),
              GestureDetector(
                child: Container(
                  width: 75.0,
                  height: 75.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          width: 3.0, color: Color(Colours.primaryColor))),
                ),
                onTapUp: (_) {
                  if (_gameBegan && !_players[1]["lock"]) {
                    _tappedUp(2);
                  }
                },
              ),
              Transform.rotate(
                angle: pi,
                child: Text(
                  _word,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 34.0,
                      color: Color(Colours.primaryColor)),
                ),
              ),
              _gameBegan
                  ? Bar(
                      percent: 0.5,
                      player1: controller1.text,
                      player2: controller2.text,
                    )
                  : Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          color: Color(Colours.primaryColor),
                          shape: BoxShape.circle),
                      child: FlatButton(
                          onPressed: _gameBegin,
                          child: Text(
                            "Go!",
                            style: TextStyle(
                                color: Color(Colours.secondaryColor),
                                fontSize: 26.0),
                          ))),
              Text(
                _word,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 34.0,
                    color: Color(Colours.primaryColor)),
              ),
              GestureDetector(
                child: Container(
                  width: 75.0,
                  height: 75.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          width: 3.0, color: Color(Colours.primaryColor))),
                ),
                onTapUp: (_) {
                  if (_gameBegan && !_players[0]["lock"]) {
                    _tappedUp(1);
                  }
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    _players[0]["name"],
                    style: TextStyle(
                        color: Color(Colours.primaryColor),
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold),
                  ),
                  _gameBegan
                      ? SizedBox()
                      : IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: Color(Colours.primaryColor),
                          ),
                          onPressed: () => _editName(controller1))
                ],
              ),
              SizedBox(height: 30.0),
            ],
          )
        ],
      ),
      floatingActionButton: _gameBegan
          ? FloatingActionButton(
              backgroundColor: Color(Colours.primaryColor),
              child: Text(
                "END",
                style: TextStyle(
                    color: Color(Colours.secondaryColor), fontSize: 20.0),
              ),
              onPressed: () => _endGame())
          : null,
    );
  }
}
