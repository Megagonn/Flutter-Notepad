import 'package:flutter/material.dart';
import 'tabbar.dart';

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
                ListTile(
                  title: Text(
                    noteList[index],
                    style: TextStyle(color: Colors.deepOrangeAccent),
                  ),
                  focusColor: (Colors.blueAccent),
                  tileColor: Colors.blueGrey.shade200,
                ),
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
