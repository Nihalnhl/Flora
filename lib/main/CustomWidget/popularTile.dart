import 'package:flutter/material.dart';

class Populartile extends StatelessWidget {
  final String popularimage;
  final String plantname;
  final String plantprice;
  final String orginalprice;
  final String plantrating;
  final String offpercentage;
  final String planttype;
  const Populartile(
      {super.key, required this.popularimage, required this.plantname, required this.plantprice, required this.orginalprice, required this.plantrating, required this.offpercentage, required this.planttype});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 146,
        height: 198,
        child: Stack(
          children: [
            SizedBox(
                height: 171,
                width: 142,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      popularimage,
                      fit: BoxFit.cover,
                    ))),
            Positioned(
              bottom: 10,
              child: Container(
                height: 57.63,
                width: 142.23,
                decoration: BoxDecoration(
                  color: Color(0xffC1E9D7),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              plantname,
                              style: TextStyle(fontSize: 12, color: Colors.black),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(width: 5,),
                            Text(plantprice,style: TextStyle(fontWeight: FontWeight.bold),),
                            SizedBox(width: 5,),
                            Text(orginalprice,style: TextStyle(fontSize: 9,color: Colors.grey,decoration: TextDecoration.lineThrough),)
                          ],
                        ),

                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 23,top: 9),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xff08A562),
                              borderRadius: BorderRadius.circular(7)
                            ),
                            height: 15,
                            width: 30,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Icon(Icons.star,color: Colors.white,size: 10,),
                                ),
                                Text(plantrating,style: TextStyle(color: Colors.white,fontSize: 9),)
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(offpercentage,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10),),
                              Text('OFF',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 7),)
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),


              ),
            ),
            Positioned(
              top: 10,
              left: 0,
              child: Row(
                children: [
                  Container(
                    height: 15,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Color(0xff08A562),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(child: Text(planttype,style: TextStyle(color: Colors.white,fontSize: 9),)),
                  ),
                  SizedBox(width: 60,),
                  CircleAvatar(
                    radius: 8,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.favorite_border_outlined,color: Colors.red,size: 10,))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
