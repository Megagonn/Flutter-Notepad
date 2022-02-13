import 'package:flutter/material.dart';
import 'package:notepad/ui.dart';

class Heroy extends StatefulWidget {
  const Heroy({Key? key}) : super(key: key);

  @override
  _HeroyState createState() => _HeroyState();
}

var nick = '';

class _HeroyState extends State<Heroy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        // height: MediaQuery.of(context).size.height/2,
        child: Column(children: [
          Image.asset(
            'images/female-avatar.jfif',
            repeat: ImageRepeat.noRepeat,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 1.4,
          ),
          TextField(
            onChanged: (val) {
              setState(() {
                nick = val;
              });
            },
          ),
          SizedBox(
            height: 5,  
            child: Text(''),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => UI()));
            },
            child: Text(
              'Get started',
            ),
          )
        ]),
      ),
    );
  }
}
