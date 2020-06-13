import 'dart:math';
import 'package:ChidiyaUdd/Widgets/Bar.dart';
import 'package:ChidiyaUdd/Widgets/WinnerModal.dart';
import 'package:ChidiyaUdd/utils/Constants.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  bool _gameBegan = false;
  String player1 = "Player 1";
  String player2 = "Player 2";
  ConfettiController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ConfettiController();
  }

  void _gameBegin() {
    setState(() {
      _gameBegan = true;
    });
  }

  void _makeEditable() {}
  void _endGame() {
    showDialog(
        context: context,
        builder: (_) => WinnerModal(
              winnerName: player1,
            ));
    
    
    setState(() {
      _gameBegan = false;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Image(
            image: AssetImage('assets/images/game_bg.png'),
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(height: 30.0),
              Transform.rotate(
                angle: pi,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      player2,
                      style: TextStyle(
                          color: Color(Colours.primaryColor),
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.edit,
                          color: Color(Colours.primaryColor),
                        ),
                        onPressed: _makeEditable)
                  ],
                ),
              ),
              Container(
                width: 75.0,
                height: 75.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        width: 3.0, color: Color(Colours.primaryColor))),
              ),
              Transform.rotate(
                angle: pi,
                child: Text(
                  "Word",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 34.0,
                      color: Color(Colours.primaryColor)),
                ),
              ),
              _gameBegan
                  ? Bar(
                      percent: 0.5,
                      player1: player1,
                      player2: player2,
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
                "Word",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 34.0,
                    color: Color(Colours.primaryColor)),
              ),
              Container(
                width: 75.0,
                height: 75.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        width: 3.0, color: Color(Colours.primaryColor))),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    player1,
                    style: TextStyle(
                        color: Color(Colours.primaryColor),
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: Color(Colours.primaryColor),
                      ),
                      onPressed: _makeEditable)
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
              onPressed: _endGame)
          : null,
    );
  }
}
