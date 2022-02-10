import 'dart:ui';
import 'dart:io';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

Color grey = Colors.grey.shade600;
Color blue = Colors.blue.shade300;
Color pink = Colors.pink.shade200;

List noteList = [];
// var eachNote = '';
// dynamic a = Text('');
// String myNote() {
//   for (var i = 0; i < noteList.length; i++) {
//     // eachNote += noteList[i];
//     if (noteList.length > 0) {
//       a = Text(noteList[i]);
//     } else {
//       a = Text('No note\nAdd note.');
//     }
//   }
//   print(noteList);

//   return eachNote;
// }

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
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: Text('Hey Megg,\nGood day')),
                Expanded(
                  child: CircleAvatar(
                    child: Image.asset('images/avatar.jfif'),
                  ),
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
            ),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(
                    Icons.search,
                    color: grey,
                  ),
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
        //---------------TabBarView--------------//
        Container(
          height: MediaQuery.of(context).size.height / 1.7,
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
                      NotesCard(),
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
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 17,
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            if (!note.contains(RegExp(r'[A-Z]'))) {
                              noteList.add(note);
                            }
                            // myNote();
                          });
                        },
                        child: Text(
                          'ADD',
                          style: TextStyle(color: Colors.white),
                        ),
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

String note = '';

class Input extends StatefulWidget {
  const Input({Key? key}) : super(key: key);

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    return TextField(
        cursorColor: Colors.blue.shade200,
        cursorHeight: 3.0,
        onChanged: (String text) {
          setState(() {
            note = text;
            // print(note);
          });
        },
        // onTap: () {
        //   setState(() {
        //     // myNote = note;
        //   });
        // },
        textAlign: TextAlign.justify,
        maxLines: 15,
        decoration: InputDecoration(
          hintText: 'Add note...',
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
        ));
  }
}


//try elementAt to solve your problem
class NotesCard extends StatefulWidget {
  const NotesCard({Key? key}) : super(key: key);

  @override
  _NotesCardState createState() => _NotesCardState();
}

class _NotesCardState extends State<NotesCard> {

  @override
  Widget build(BuildContext context) {
    // myNote();
    // return a;
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          // padding: const EdgeInsets.all(8),
          itemCount: noteList.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                ListTile(title: Text(noteList[index], style: TextStyle(color: Colors.deepOrangeAccent),),focusColor: (Colors.blueAccent),tileColor: Colors.blueGrey.shade200, ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 2.0,
                )
              ],
            );
            
          }),
    );
  }
}
