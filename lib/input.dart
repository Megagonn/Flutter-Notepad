import 'package:flutter/material.dart';
import 'package:notepad/colors.dart';

String note = '';
DateTime? date;
DateTime? newDate;
// var hour = 0;
final myController = TextEditingController();

class Input extends StatefulWidget {
  const Input({Key? key}) : super(key: key);

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: myController,
        cursorColor: pink,
        cursorHeight: 3.0,
        onChanged: (String text) {
          setState(() {
            note = text;
            date = new DateTime.now();
            // newDate =  DateForm;
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
            color: pink,
          ),
          focusColor: pink,
          filled: true,
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: pink,)),
        ));
  }
}
