import 'package:flutter/material.dart';
import 'package:notepad/hero.dart';
import 'colors.dart';
// import 'input.dart';
import 'tabbar.dart';

class UI extends StatelessWidget {
  const UI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    // Container(
                    //   margin: EdgeInsets.symmetric(horizontal: 10),
                    //   child: Icon(
                    //     Icons.search,
                    //     color: grey,
                    //   ),
                    // ),
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
                            suffixIcon: Icon(
                              Icons.search_sharp,
                              color: pink,
                            ),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: pink)),
                          ),
                          cursorColor: pink,
                          onChanged: (val) {
                            for (var i = 0; i < noteList.length; i++) {
                              if (noteList[i][0].contains('$val')) {
                                print('found');
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SearchResult(
                                      data: noteList[i][0],
                                    ),
                                  ),
                                );
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('Not found'),
                                      content: Text('Search not found...'),
                                    );
                                  },
                                );
                              }
                            }
                          }),
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
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class SearchResult extends StatefulWidget {
  // const ({ Key? key }) : super(key: key);
  late String data;
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
      // body: ,
    );
  }
}
