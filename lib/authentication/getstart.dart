import 'package:flutter/material.dart';
import 'package:prjctflora/authentication/Signup.dart';
import 'package:prjctflora/authentication/login.dart';

class Getstart extends StatelessWidget {
  const Getstart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/getstart.png"), fit: BoxFit.fill),
      ),
      child: Stack(
        children: [
          Positioned(
              top: 190,
              left: 110,
              right: 110,
              child: Image.asset(
                'assets/images/logo.png',
                height: 87,
                width: 159,
              )),
          Column(
            children: [
              SizedBox(
                height: 430,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Home',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 26,
                        color: Color(0xff08A562)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Is Where',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 26,
                        color: Colors.black),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'My Plants',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 26,
                        color: Color(0xff08A562)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Are',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 26,
                        color: Colors.black),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 50, left: 0),
                child: Text('Discover and purchase a diverse selection of'
                    '\nindoor and outdoor plants effortlessly with Flora.'),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 328,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Loginpage()),
                    );
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff08A562)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 328,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Signup()),
                    );
                  },
                  child: Text(
                    'SignUp',
                    style: TextStyle(
                        color: Color(0xff08A562), fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: BorderSide(
                        color: Color(0xff08A562), width: 2), // Add green border
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
