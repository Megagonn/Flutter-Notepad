import 'package:flutter/material.dart';

class Hero extends StatefulWidget {
  const Hero({Key? key}) : super(key: key);

  @override
  _HeroState createState() => _HeroState();
}

class _HeroState extends State<Hero> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(children: [
        Image.asset(
          'images/female-avatar.jfif',
          repeat: ImageRepeat.noRepeat,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
        TextField(
          onChanged: (val) {
            setState(() {});
          },
        )
      ]),
    );
  }
}
