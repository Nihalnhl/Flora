import 'package:flutter/material.dart';

class Indoortile extends StatelessWidget {
  final String indoorimage;
  final String plantname;
  final String planttype;
  final String plantrating;
  final String plantrate;
  final String plantsize;
  final String plantpreviousprice;
  final Color planttypecolor;

  const Indoortile(
      {super.key,
      required this.indoorimage,
      required this.planttype,
      required this.plantname,
      required this.plantrating, required this.plantrate, required this.plantsize, required this.plantpreviousprice, required this.planttypecolor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 221.7,
      width: 176.08,
      child: Stack(
        children: [
          SizedBox(
              height: 153,
              width: 153,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    indoorimage,
                    fit: BoxFit.cover,
                  ))),
          Positioned(
            top: 10,
            left: 0,
            child: Row(
              children: [
                Container(
                  height: 15,
                  width: 60,
                  decoration: BoxDecoration(
                    color: planttypecolor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                      child: Text(
                    planttype,
                    style: TextStyle(color: Colors.white, fontSize: 9),
                  )),
                ),
                SizedBox(
                  width: 60,
                ),
                CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.favorite_border_outlined,
                      color: Colors.red,
                      size: 10,
                    ))
              ],
            ),
          ),
          Positioned(
            bottom: 32,
            left: 8,
            right: 15,
            child: Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        plantname,
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Container(
                            height: 12.74,
                            width: 29,
                            decoration: BoxDecoration(
                                color: Color(0xff08A562),
                                borderRadius: BorderRadius.circular(12)),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.white,
                                  size: 10,
                                ),
                                Text(
                                  plantrating,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 9),
                                )
                              ],
                            )),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            '₹${plantrate}/',
                            style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.w700),
                          ),
                          Text(
                            '${plantsize} Size',
                            style: TextStyle(color: Colors.black, fontSize: 9,fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Text(
                        '₹${plantpreviousprice}/-',
                        style: TextStyle(color: Color(0xff5B5B5B), fontSize: 9,fontWeight: FontWeight.w400,decoration: TextDecoration.lineThrough),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
