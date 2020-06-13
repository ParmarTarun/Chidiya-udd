import 'package:ChidiyaUdd/utils/Constants.dart';
import 'package:flutter/material.dart';

class WinnerModal extends StatelessWidget {

  final String winnerName;
  WinnerModal({this.winnerName});

  void _closeModal(context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: Colors.transparent,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: Color(Colours.secondaryColor),
              borderRadius: BorderRadius.circular(25.0),
              border:
                  Border.all(color: Color(Colours.primaryColor), width: 4.0)),
          height: MediaQuery.of(context).size.height * 0.6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image(
                  image: AssetImage('assets/images/winner.png'), width: 150.0),
              Text(
                "WINNER!",
                style: TextStyle(
                    color: Color(Colours.swatchColor),
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              Text(
                winnerName,
                style: TextStyle(
                    color: Color(Colours.primaryColor),
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.0),
              InkWell(
                child: FlatButton(
                  onPressed: ()=>_closeModal(context),
                  child: Text(
                    "Close",
                    style: TextStyle(
                        color: Color(Colours.swatchColor), fontSize: 18.0),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
