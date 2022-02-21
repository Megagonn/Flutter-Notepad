import 'package:flutter/material.dart';
import 'package:notepad/input.dart';
import 'package:notepad/ui.dart';

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
  late int myIndex;

  //addition notification
  alertAddition(context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('One note is added'),
        duration: Duration(seconds: 3),
      ),
    );
  }

  // var mYkey = GlobalKey();
  @override
  void initState() {
    super.initState();
    myIndex = 0;
    tabController = TabController(
      initialIndex: myIndex,
      length: 2,
      vsync: this,
      // initialIndex: myIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          indicatorColor: pink,
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
              Scaffold(
                floatingActionButton: FloatingActionButton(
                  key: ValueKey(1),
                  onPressed: () {
                    setState(() {
                      myIndex = 1;
                      // DefaultTabController.of(context)?.animateTo(1);
                    });
                  },
                  backgroundColor: pink,
                  child: Icon(Icons.add),
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.endFloat,
                body: SingleChildScrollView(
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
              ),
              Scaffold(
                floatingActionButton: FloatingActionButton(
                  key: ValueKey(2),
                  onPressed: () {
                    setState(() {
                      noteList.add([note, date]);
                      filteredList.add([note, date]);
                      myController.clear();
                      alertAddition(context);
                    });
                  },
                  backgroundColor: pink,
                  child: Icon(Icons.send_outlined),
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.endDocked,
                body: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Input(),
                      ],
                    ),
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
