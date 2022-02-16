import 'package:flutter/material.dart';
import 'package:notepad/colors.dart';
import 'package:notepad/input.dart';
import 'tabbar.dart';

class NotesCard extends StatefulWidget {
  const NotesCard({Key? key}) : super(key: key);

  @override
  _NotesCardState createState() => _NotesCardState();
}

String? myNoteContent;
var ind;

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
            ind = index;
            return Column(
              children: [
                ListTile(
                  leading: TextButton(
                    onPressed: () {
                      setState(() {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Edit()));
                      });
                    },
                    child: Icon(
                      Icons.edit_rounded,
                      semanticLabel: 'Edit',
                      color: pink2,
                    ),
                  ),
                  title: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            clipedNote(),
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
                        noteList.removeAt(index);
                      });
                    },
                    child: Icon(
                      Icons.delete_forever_rounded,
                      color: pink2,
                    ),
                  ),
                  focusColor: (Colors.pink.shade500),
                  tileColor: Colors.pink.shade100,
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

class Edit extends StatefulWidget {
  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  TextEditingController thisControl = TextEditingController();
  var edited;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    thisControl.text = noteList[ind][0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            noteList.removeAt(ind);
            noteList.insert(ind, [edited, date]);
            thisControl.clear();
            Navigator.pop(context);
          });
        },
        backgroundColor: pink,
        child: Icon(
          Icons.send_sharp,
          // color: pink,
        ),
      ),
      appBar: AppBar(
        backgroundColor: pink,
        title: Text('Edit Note'),
      ),
      body: Column(children: [
        TextField(
          controller: thisControl,
          cursorColor: pink,
          maxLines: 20,
          decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: pink),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 5,
              )),
          onChanged: (val) {
            setState(() {
              edited = val;
            });
          },
        ),
        // ElevatedButton(onPressed: (){}, child: )
      ]),
    );
  }
}

//this func clipped the note on the listTile
String clipedNote() {
  if (noteList[ind][0].length >= 35) {
    return noteList[ind][0].substring(0, 35) + "...";
  } else {
    return noteList[ind][0];
  }
}

class NoteContent extends StatelessWidget {
  const NoteContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: pink,
        title: Text('My Note'),
      ),
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.all(8.0),
        child: Text(
          '$myNoteContent',
          // softWrap: true,
          // textWidthBasis: TextWidthBasis.parent,
          style: TextStyle(
            fontSize: 18,
            letterSpacing: 1.5,
            wordSpacing: 2.0,
            color: grey,
          ),
        ),
      )),
    );
  }
}
