import 'package:flutter/material.dart';
import 'package:notepad/input.dart';
import 'tabbar.dart';

class NotesCard extends StatefulWidget {
  const NotesCard({Key? key}) : super(key: key);

  @override
  _NotesCardState createState() => _NotesCardState();
}

var myNoteContent;

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
                  leading: TextButton(
                    onPressed: () {
                      setState(() {});
                    },
                    child: Icon(
                      Icons.edit_rounded,
                    ),
                  ),
                  title: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            noteList[index][0],
                            style: TextStyle(color: Colors.grey.shade800),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('${noteList[index][1]}'),
                        ],
                      ),
                    ],
                  ),
                  trailing: TextButton(
                    onPressed: () {
                      setState(() {
                        // noteList.remove(index);
                        // print(noteList);
                        // noteList.removeWhere((element) => index);
                      });
                    },
                    child: Icon(
                      Icons.delete_forever_rounded,
                    ),
                  ),
                  focusColor: (Colors.blueAccent),
                  tileColor: Colors.blue.shade100,
                  onTap: () {
                    myNoteContent = noteList[index][0];
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => NoteContent()));
                  },
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

class NoteContent extends StatelessWidget {
  const NoteContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Note'),
      ),
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.all(8.0),
        child: Text(
          '$myNoteContent',
          style: TextStyle(
            fontSize: 18,
            letterSpacing: 1.5,
            wordSpacing: 2.0,
          ),
        ),
      )),
    );
  }
}
