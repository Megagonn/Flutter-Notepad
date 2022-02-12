import 'package:flutter/material.dart';
import 'package:notepad/input.dart';

import 'colors.dart';
import 'notesCard.dart';


List noteList = [];
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