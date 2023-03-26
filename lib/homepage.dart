// ignore_for_file: prefer_const_constructors

import 'package:bookstore/newarrivals.dart';
import 'package:bookstore/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: const <BottomNavigationBarItem>[  
          BottomNavigationBarItem(  
            icon: Icon(Icons.home,color: Colors.black,),  
            label: 'Home',  
              
          ),  
          BottomNavigationBarItem(  
            icon: Icon(Icons.search,color: Colors.black,),  
            label: 'Search',  
              
          ),  
          BottomNavigationBarItem(  
            icon: Icon(Icons.book,color: Colors.black,),  
            label: 'Library', 
             
          ),
          BottomNavigationBarItem(  
            icon: Icon(Icons.shopping_bag,color: Colors.black,),  
            label: 'Cart', 
              
          ),   
        ], 
        backgroundColor: Colors.black,
         ),
      body: 
      Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
              child: Column(
                children: [
                  verticalSpacing(42),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 28,),
                    child: Row(
                      children: [
                        Text("20",
                        style: GoogleFonts.poppins(fontStyle: FontStyle.normal,fontWeight: FontWeight.w500,fontSize: 38),),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Thu',
                              style: GoogleFonts.poppins(fontSize: 14,color: Colors.grey),
                            ),
                            Text(
                              'Mar 2023',
                              style: GoogleFonts.poppins(fontSize: 14,color: Colors.grey),
                            )
                          ],
                        ),
                        Spacer(),
                        IconButton(
                            onPressed: () {}, 
                            icon: Icon(Icons.qr_code)), 
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Container(
                              width: 47,
                              height: 70,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('asset/images/image81.png'),
                                  ),
                                color: Colors.black,
                                borderRadius: 
                                BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                  verticalSpacing(38),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 28
                    ),
                    child: Row(
                      children: [
                          Text('New Arrivals',
                          style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.w400,),
                          ),
                        Spacer(),
                        TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>NewArrivals()));
                          }, 
                          child: Text('View all >',
                          style: TextStyle(color: Colors.amber),),
                          )
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                book('asset/images/image81.png'),
                SizedBox(height: 23.45,),
                book('asset/images/image80.png'),
                SizedBox(height: 23.45,),
                book('asset/images/image82.png'),
                SizedBox(height: 23.45,),
                book('asset/images/image79.png'),
                SizedBox(height: 23.45,),
                book('asset/images/image78.png'),
                SizedBox(height: 23.45,),
                book('asset/images/image77.png'),
                SizedBox(height: 23.45,),
                book('asset/images/image14.png'),
                book('asset/images/image81.png'),
                SizedBox(height: 23.45,),
                book('asset/images/image80.png'),
                SizedBox(height: 23.45,),
                book('asset/images/image82.png'),
                SizedBox(height: 23.45,),
                book('asset/images/image79.png'),
                SizedBox(height: 23.45,),
                book('asset/images/image78.png'),
                SizedBox(height: 23.45,),
                book('asset/images/image77.png'),
                SizedBox(height: 23.45,),
                book('asset/images/image14.png'),
                      ],
                    ),
                  ),
                  
                ],
              ),
            ),
            SizedBox(height: 5,),
            Container(
              width: size.width,
              height: 207,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.black,
              ),
            )
        ],
      ),
    );
  }

  Column book(String text) {
    return Column(
                        children: [
                verticalSpacing(40),
                          Container(
                            width: 130,
                            height: 190,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(image: AssetImage(text))
                            ),
                          ),
                          verticalSpacing(18),
                          Text('Muscle',
                          style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w700,color: Colors.black),
                          ),
                          verticalSpacing(6),
                          Text('Alan Trotter',
                          style: GoogleFonts.poppins(fontSize: 13,fontWeight: FontWeight.w400,color: Colors.grey),
                          )
                        ],
                      );
  }
}
              


               