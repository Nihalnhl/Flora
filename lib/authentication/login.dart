import 'package:flutter/material.dart';
import 'package:prjctflora/authentication/Signup.dart';
import 'package:prjctflora/authentication/getstart.dart';

import '../main/homepage.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/loginpage.png"),
                        fit: BoxFit.cover),
                  ),
                  height: MediaQuery.of(context).size.height * .45,
                  width: MediaQuery.of(context).size.width,
                ),
                Container(
                    height: 354.5,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                        child: Image.asset(
                      'assets/images/logo.png',
                      width: 159,
                      height: 87,
                    ))),
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 10),
                  child: CircleAvatar(
                    radius: 15,
                    child: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Getstart()));
                        },
                        icon: Center(child: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.black,size: 16,))),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Welcome Home',
              style: TextStyle(
                  color: Color(0xff08A562),
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
            Text(
              'Login to your account',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.person_2_outlined,
                    color: Color(0xff08A562),
                  ),
                  labelText: 'Full Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    color: Color(0xff08A562),
                    onPressed: () {},
                    icon: Icon(Icons.remove_red_eye_outlined),
                  ),
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: Color(0xff08A562),
                  ),
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0), // Curved edges
                  ),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 220.0),
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forget your password?',
                    style: TextStyle(color: Color(0xff666666)),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 328,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Homepage()),
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
            Padding(
              padding: const EdgeInsets.only(left: 88, right: 85),
              child: Row(
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Signup()),
                        );
                      },
                      child: Text(
                        "SignUp",
                        style: TextStyle(color: Color(0xff08A562)),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

