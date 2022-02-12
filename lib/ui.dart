import 'package:flutter/material.dart';
import 'colors.dart';
import 'input.dart';
import 'tabbar.dart';

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
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      labelText: 'Search',
                      labelStyle: TextStyle(
                        color: grey,
                      ),
                      suffixIcon: Icon(Icons.search_sharp),
                    ),
                    onChanged: (val) {
                      for (var i = 0; i < noteList.length; i++) {
                        if (note.contains('$val')) {
                          print('found');
                          // Navigator.push(context, );
                        } else {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Not found'),
                                  content: Text('Search not found...'),
                                );
                              });
                        }
                      }
                    },
                    // onSubmitted: (text) async {
                    //   return showDialog(
                    //       context: context,
                    //       builder: (BuildContext context) {
                    //         return AlertDialog(
                    //           title: Text('Search for words...'),
                    //           actions: [
                    //             ElevatedButton(
                    //               onPressed: () {
                    //                 for (var i = 0; i < noteList.length; i++) {
                    //                   // if (noteList[i].) {

                    //                   // }
                    //                 }
                    //               },
                    //               child: Text(
                    //                 'Search',
                    //                 style: TextStyle(
                    //                   color: Colors.white,
                    //                 ),
                    //               ),
                    //             ),
                    //             ElevatedButton(
                    //               onPressed: () {

                    //               },
                    //               child: Text(
                    //                 'Cancel',
                    //                 style: TextStyle(
                    //                   color: Colors.red,
                    //                 ),
                    //               ),
                    //             ),
                    //           ],
                    //         );
                    //       });
                    // },
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
