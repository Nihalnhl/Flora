import 'package:flutter/material.dart';

class Categorytile extends StatelessWidget {
  final String categoryImage;
  final String categoryTitle;
  const Categorytile({super.key, required this.categoryImage, required this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 76,
        width: 90,
        decoration: BoxDecoration(
          color: Color(0xffF2F2F2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height:40 ,
                  width: 43,
                  child: Image.asset(categoryImage)),
              SizedBox(height: 2),
              Text(
                categoryTitle,
                style: TextStyle(fontSize: 10, color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );

  }
}
