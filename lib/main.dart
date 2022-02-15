import 'package:flutter/material.dart';
import 'package:notepad/colors.dart';

import 'hero.dart';
import 'ui.dart';

void main() {
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Note Pad',
      theme: ThemeData(
        // primarySwatch: MaterialColor(pink, pink),
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: pink,
          title: Text('NotePad'),
        ),
        body: SafeArea(
          child: Heroy(),
        ),
      ),
    );
  }
}


//try elementAt to solve your problem
