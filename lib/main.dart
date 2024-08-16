import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/material/colors.dart';
import 'package:prjctflora/Splashscreen3.dart';
import 'package:prjctflora/page1.dart';

import 'Splashscreen2.dart';
import 'authentication/getstart.dart';
import 'authentication/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splascsreen(),
    );
  }
}

class Splascsreen extends StatefulWidget {
  const Splascsreen({super.key});

  @override
  State<Splascsreen> createState() => _SplascsreenState();
}

class _SplascsreenState extends State<Splascsreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () => change());
  }

  double _opacity = 0.0;
  void change() {
    setState(() {
      _opacity = 1;
    });
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff08A562),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Center(
                child: AnimatedOpacity(
              opacity: _opacity,
              duration: Duration(seconds: 1),
              child: Image.asset(
                'assets/images/logo.png',
                height: 87,
                width: 159,
              ),
            )),
            Positioned(
                bottom: -10,
                left: -20,
                right: -20,
                child: AnimatedOpacity(
                    opacity: _opacity,
                    duration: Duration(seconds: 1),
                    child: Image.asset(
                      'assets/images/img.png',
                      height: 139,
                      width: MediaQuery.of(context).size.width,
                    )))
          ],
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final controller = PageController();
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        // Update currentPage when the page changes
        currentPage = controller.page!.round();
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [page1(), page2(), page3()];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Positioned(
                bottom: -20,
                left: -10,
                child: Image.asset('assets/images/bottomleaf.png',
                    width: 126, height: 133)),
            Positioned(
                top: 50,
                right: -20,
                child: Image.asset('assets/images/topleaf.png',
                    width: 126, height: 133)),
            Positioned(
              top: 140,
              left: 55,
              right: 55,
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 500,
                    height: 400,
                    child: PageView.builder(
                      controller: controller,
                      itemCount: pages.length,
                      itemBuilder: (BuildContext context, int index) {
                        return pages[index];
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (currentPage == pages.length - 1)
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Getstart()),
                            );
                            // Handle "Get Started" action here
                          },
                          child: Container(
                            width: 100,
                            child: Center(
                              child: Text(
                                "Get Started",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff08A562),
                          ),
                        )
                      else ...[
                        ElevatedButton(
                          onPressed: () {
                            controller.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.fastOutSlowIn,
                            );
                          },
                          child: Container(
                            width: 60,
                            child: Center(
                              child: Text(
                                "Next",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff08A562),
                          ),
                        ),
                        SizedBox(width: 20),
                        TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>  Loginpage()),
                            );
                            // Handle "Skip" action here
                          },
                          child: Text(
                            "Skip",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 15.0,
                            ),
                          ),
                          style: ButtonStyle(
                            maximumSize: MaterialStateProperty.all(
                              Size(150, 50),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
