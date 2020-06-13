import 'dart:math';

import 'package:ChidiyaUdd/utils/Constants.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class WinnerModal extends StatefulWidget {
  final String winnerName;
  WinnerModal({this.winnerName});

  @override
  _WinnerModalState createState() => _WinnerModalState();
}

class _WinnerModalState extends State<WinnerModal> {
  ConfettiController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ConfettiController();
    _controller.play();
  }

  void _closeModal(context) {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(backgroundColor: Colors.transparent, children: [
      Container(
        decoration: BoxDecoration(
            color: Color(Colours.secondaryColor),
            borderRadius: BorderRadius.circular(25.0),
            border: Border.all(color: Color(Colours.primaryColor), width: 4.0)),
        height: MediaQuery.of(context).size.height * 0.6,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ConfettiWidget(
                    blastDirection: pi / 2, confettiController: _controller),
                SizedBox(width: 100.0),
                ConfettiWidget(
                    blastDirection: pi / 2, confettiController: _controller),
              ],
            ),
            Image(image: AssetImage('assets/images/winner.png'), width: 150.0),
            Text(
              "WINNER!",
              style: TextStyle(
                  color: Color(Colours.swatchColor),
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              widget.winnerName,
              style: TextStyle(
                  color: Color(Colours.primaryColor),
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            InkWell(
              child: FlatButton(
                onPressed: () => _closeModal(context),
                child: Text(
                  "Close",
                  style: TextStyle(
                      color: Color(Colours.swatchColor), fontSize: 18.0),
                ),
              ),
            ),
          ],
        ),
      )
    ]);
  }
}
