import 'package:flutter/material.dart';
import 'package:notepad/hero.dart';
import 'colors.dart';
// import 'input.dart';
import 'tabbar.dart';

List filteredList = [];
var ind;
var keyWord;

class UI extends StatelessWidget {
  const UI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    myContext = context;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: pink,
        title: Text('NotePad'),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Text(
                        'Hey $nick,\nGood day',
                        style: TextStyle(fontFamily: 'GideonRoman'),
                      ),
                    ),
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
                      width: MediaQuery.of(context).size.width,
                      child: TextField(
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                            labelText: 'Search',
                            labelStyle: TextStyle(
                              color: grey,
                            ),
                            suffixIcon: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(pink),
                              ),
                              onPressed: () {
                                SearchFunc.search();
                              },
                              child: Icon(
                                Icons.search_sharp,
                                color: (Colors.white),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: pink)),
                          ),
                          cursorColor: pink,
                          onChanged: (val) {
                            searchVal = val;
                            for (var i = 0; i < noteList.length; i++) {
                              searchIndex = i;
                            }
                          }),
                    )
                    // )
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
        ),
      ),
    );
  }
}

int? searchIndex;
var searchVal;
var myContext;

class SearchFunc extends StatefulWidget {
  const SearchFunc({Key? key}) : super(key: key);

  static void search() {
    // filteredList.clear();

    if (noteList[searchIndex!][0].toString().contains(searchVal)) {
      filteredList
          .retainWhere((element) => element[0].toString().contains(searchVal));
    } else {
      showDialog(
        context: myContext,
        builder: (context) {
          return AlertDialog(
            title: Text('Not found'),
            content: Text('Search not found...'),
          );
        },
      );
    }
    Navigator.push(
      myContext,
      MaterialPageRoute(
        builder: (context) => SearchResult(
          data: filteredList,
        ),
      ),
    );
  }

  @override
  _SearchFuncState createState() => _SearchFuncState();
}

class _SearchFuncState extends State<SearchFunc> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
  // ignore: unused_element

}

//global variables & func.
var myFilteredNoteContent;
String filteredClipedNote() {
  if (filteredList[ind][0].length >= 35) {
    return filteredList[ind][0].substring(0, 35) + "...";
  } else {
    return filteredList[ind][0];
  }
}

// ignore: must_be_immutable
class SearchResult extends StatefulWidget {
  // const ({ Key? key }) : super(key: key);
  late List data;
  SearchResult({Key? key, required this.data}) : super(key: key);

  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Search Result'),
        backgroundColor: pink,
      ),
      body: ListView.builder(
          itemCount: filteredList.length,
          itemBuilder: (context, index) {
            ind = index;
            return Column(
              children: [
                ListTile(
                  title: Text(
                    filteredClipedNote(),
                    style: TextStyle(color: Colors.grey.shade800),
                  ),
                  focusColor: (Colors.pink.shade500),
                  tileColor: Colors.pink.shade100,
                  onTap: () {
                    myFilteredNoteContent = filteredList[index][0];
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FilteredNoteContent()));
                  },
                ),
                SizedBox(
                  width: 10,
                  child: Text(''),
                ),
              ],
            );
          }),
    );
  }
}

class FilteredNoteContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: pink,
        title: Text('Note'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '$myFilteredNoteContent',
            style: TextStyle(
              color: grey,
              letterSpacing: 1.15,
              wordSpacing: 1.5,
            ),
          )),
    );
  }
}
