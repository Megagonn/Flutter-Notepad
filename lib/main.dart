import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

Color grey = Colors.grey.shade600;
Color blue = Colors.blue.shade300;
Color pink = Colors.pink.shade200;

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
          child: UI(),
        ),
      ),
    );
  }
}

class UI extends StatelessWidget {
  const UI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Hey Megg\nGood day'),
              CircleAvatar(
                child: Image.asset('images/avatar.jfif'),
              )
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.search,
                  color: grey,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Search',
                      labelStyle: TextStyle(
                        color: grey,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Column(
            children: [
              Tabbar(),
            ],
          ),
        ],
      ),
    );
  }
}
//------tabbar----------//

class Tabbar extends StatefulWidget {
  const Tabbar({Key? key}) : super(key: key);

  @override
  _TabbarState createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: tabController,
          tabs: [
            Tab(
              icon: Icon(
                Icons.note,
                color: grey,
              ),
              child: Text(
                'Notes',
                style: TextStyle(color: grey),
              ),
            ),
            Tab(
              icon: Icon(
                Icons.note_add,
                color: grey,
              ),
              child: Text(
                'New Note',
                style: TextStyle(color: grey),
              ),
            ),
          ],
        ),
        Container(
          height: MediaQuery.of(context).size.height / (4 / 2.5),
          child: TabBarView(
            controller: tabController,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Note1'),
                      Text('Note1'),
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Input(),
                      TextButton(
                        onPressed: () {},
                        child: Text('ADD', style: TextStyle(color: Colors.white),),
                        style: ButtonStyle(
                          animationDuration: Duration(microseconds: 600),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class Input extends StatelessWidget {
  const Input({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.blue.shade200,
      cursorHeight: 3.0,
      controller: TextEditingController(
        text: "New text",
      ),
      textAlign: TextAlign.justify,
      maxLines: 15,
    );
  }
}
