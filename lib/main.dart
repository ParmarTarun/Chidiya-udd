import 'package:ChidiyaUdd/Screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import './utils/Constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chidiya Udd',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color(Colours.primaryColor),
          accentColor: Color(Colours.secondaryColor),
          unselectedWidgetColor: Color(Colours.secondaryColor)
          ),
      home: HomeScreen(),
    );
  }
}
