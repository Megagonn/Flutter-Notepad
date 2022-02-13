import 'package:flutter/material.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
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
