import 'package:ChidiyaUdd/Screens/GameScreen.dart';
import 'package:ChidiyaUdd/utils/Constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedRadio;

  @override
  void initState() {
    super.initState();
    _selectedRadio = 0;
  }

  void _radioButtonClicked(val) {
    setState(() {
      _selectedRadio = val;
    });
  }

  void startClicked() {
    if (_selectedRadio == 0) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => GameScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Image(
            image: AssetImage('assets/images/home_bg.png'),
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                    image: AssetImage('assets/images/logo_white.png'),
                    width: 200.0),
                Text(
                  "Players",
                  style: TextStyle(
                      color: Color(Colours.secondaryColor), fontSize: 24.0),
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Radio(
                        value: 0,
                        groupValue: _selectedRadio,
                        onChanged: (val) {
                          _radioButtonClicked(val);
                        }),
                    Text(
                      "2",
                      style: TextStyle(
                          color: Color(Colours.secondaryColor), fontSize: 24.0),
                    ),
                    Radio(
                        value: 1,
                        groupValue: _selectedRadio,
                        onChanged: (val) {
                          _radioButtonClicked(val);
                        }),
                    Text(
                      "3",
                      style: TextStyle(
                          color: Color(Colours.secondaryColor), fontSize: 24.0),
                    ),
                    Radio(
                        value: 2,
                        groupValue: _selectedRadio,
                        onChanged: (val) {
                          _radioButtonClicked(val);
                        }),
                    Text(
                      "4",
                      style: TextStyle(
                          color: Color(Colours.secondaryColor), fontSize: 24.0),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      color: Color(Colours.primaryColor),
                      border: Border.all(color: Color(Colours.secondaryColor)),
                      borderRadius: BorderRadius.circular(25.0)),
                  child: FlatButton(
                    onPressed: startClicked,
                    child: Text(
                      "START",
                      style: TextStyle(
                          color: Color(Colours.secondaryColor), fontSize: 24.0),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
