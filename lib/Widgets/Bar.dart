import 'dart:math';

import 'package:ChidiyaUdd/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Bar extends StatefulWidget {

  double percent;
  String player1;
  String player2;
  Bar({this.percent, this.player1, this.player2});

  @override
  _BarState createState() => _BarState();
}

class _BarState extends State<Bar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Transform.rotate(
                angle: pi,
                child: Text(
                  widget.player2,
                  style: TextStyle(
                      color: Color(Colours.primaryColor),
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
          SizedBox(height: 5.0),
          Container(
            padding: EdgeInsets.all(2.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.0),
                border:
                    Border.all(width: 2.0, color: Color(Colours.primaryColor))),
            child: LinearPercentIndicator(
              padding: EdgeInsets.all(3.0),
              backgroundColor: Colors.transparent,
              lineHeight: 10.0,
              progressColor: Color(Colours.primaryColor),
              percent: 0.5,
            ),
          ),
          SizedBox(height: 5.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.player1,
                style: TextStyle(
                    color: Color(Colours.primaryColor),
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700),
              ),
            ],
          )
        ],
      ),
    );
  }
}
