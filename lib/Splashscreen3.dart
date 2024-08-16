import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class page3 extends StatelessWidget {
  const page3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [ Image.asset(
        'assets/images/scrn3image.png',
        width: 388,
        height: 278,
      ),
        Text("Identify Plants",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xff08A562),
                fontSize: 24)),

    Text(
    textAlign:TextAlign.center,
            "What kind of plant is this ? Scan plant directly "            "from your app and find out!",
            style: TextStyle(color: Colors.black, fontSize: 14)),
        SizedBox(height: 20),

      ],
    );
  }
}