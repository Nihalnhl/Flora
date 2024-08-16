import 'package:flutter/material.dart';
import 'package:prjctflora/authentication/login.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cnfrmController = TextEditingController();
  bool _agreeToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              bottom: -45,
              child: Image.asset(
                'assets/images/signimg.png',
                height: 540,
                width: 360,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(children: [
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: Color(0xff08A562),
                      child: Center(
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Loginpage()));
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_new_outlined,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 95,
                    ),
                    Image.asset(
                      'assets/images/signlogo.png',
                      height: 51,
                      width: 121,
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Center(
                    child: Text(
                  'Register',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff08A562)),
                )),
                Text(
                  'Create your new account',
                  style: TextStyle(fontSize: 14, color: Color(0xff666666)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Color(0xff08A562),
                      ),
                      labelText: 'Email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Color(0xff08A562),
                      ),
                      labelText: 'Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _cnfrmController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: Color(0xff08A562),
                      ),
                      labelText: 'Confirm Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      } else if (value != _passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Checkbox(
                      value: _agreeToTerms,
                      onChanged: (bool? value) {
                        setState(() {
                          _agreeToTerms = value!;
                        });
                      },
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _agreeToTerms = !_agreeToTerms;
                        });
                      },
                      child: Text("I accept the policy and terms"),
                    ),
                  ],
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
                      'SignUp',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff08A562)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 90),
                  child: Row(
                    children: [
                      Text('Already have an account?'),
                      TextButton(
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
                              fontWeight: FontWeight.bold,
                              color: Color(0xff08A562)),
                        ),
                      )
                    ],
                  ),
                ),
              ]),
            ),

          ],
        ),
      ),
    );
  }
}
