import 'dart:ui';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vkreta/productdisplay.dart';

class WishList extends StatefulWidget {
  const WishList({Key? key}) : super(key: key);

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Stack(children: [
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.grey.shade100),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 130,
                    ),
                    InkWell(
                      onTap: (){
                           Navigator.of(context).push(PageRouteBuilder(
                        transitionDuration: Duration(seconds: 1),
                        transitionsBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secAnimation,
                            Widget child) {
                          animation = CurvedAnimation(
                              parent: animation, curve: Curves.linear);
                          return SharedAxisTransition(
                              child: child,
                              animation: animation,
                              secondaryAnimation: secAnimation,
                              transitionType:
                                  SharedAxisTransitionType.horizontal);
                        },
                        pageBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secAnimation) {
                          return ProductDisplay();
                        }));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Container(
                          height: 180,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade300,
                                    spreadRadius: 1,
                                    blurRadius: 4,
                                    offset: Offset(3, 3))
                              ]),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 2,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 120,
                                    width: MediaQuery.of(context).size.width / 3,
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset('assets/shoes.png'),
                                    ),
                                  ),
                                  Container(
                                    height: 120,
                                    width: MediaQuery.of(context).size.width / 2,
                                    color: Colors.white,
                                    child: Column(
                                      children: [
                                        SizedBox(height:7)
                    ,                                      Text(
                                          'Here is the title of your first product in search wishlist',
                                          style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                  color: Colors.grey.shade900,
                                                  fontSize: 13)),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              ' ₹ 100',
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 12)),
                                            ),
                                          ],
                                        ),
                                       
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.room,
                                              color: Colors.grey.shade700,
                                              size: 15,
                                            ),
                                            Text(
                                              'Brooklyn',
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Colors.grey.shade700,
                                                      fontSize: 9)),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 1,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.orange,
                                              size: 13,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.orange,
                                              size: 13,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.orange,
                                              size: 13,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.orange,
                                              size: 13,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.orange,
                                              size: 13,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              '(100)',
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Colors.grey.shade700,
                                                      fontSize: 11)),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 2,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              ' 69 sale',
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Colors.grey.shade700,
                                                      fontSize: 11)),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadiusDirectional.circular(1),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey.shade400,
                                              spreadRadius: 1)
                                        ]),
                                    child: Center(
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.grey.shade700,
                                        size: 23,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: 40,
                                    width: MediaQuery.of(context).size.width / 1.5,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(1),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.blue.shade900,
                                              spreadRadius: 1)
                                        ]),
                                    child: Center(
                                      child: Text(
                                        'Add To Shopping Cart',
                                        style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                                color: Colors.blue.shade900,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14)),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                     InkWell(
                       onTap: (){
                            Navigator.of(context).push(PageRouteBuilder(
                        transitionDuration: Duration(seconds: 1),
                        transitionsBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secAnimation,
                            Widget child) {
                          animation = CurvedAnimation(
                              parent: animation, curve: Curves.linear);
                          return SharedAxisTransition(
                              child: child,
                              animation: animation,
                              secondaryAnimation: secAnimation,
                              transitionType:
                                  SharedAxisTransitionType.horizontal);
                        },
                        pageBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secAnimation) {
                          return ProductDisplay();
                        }));
                       },
                       child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Container(
                          height: 180,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade300,
                                    spreadRadius: 1,
                                    blurRadius: 4,
                                    offset: Offset(3, 3))
                              ]),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 2,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 120,
                                    width: MediaQuery.of(context).size.width / 3,
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset('assets/shirt.png'),
                                    ),
                                  ),
                                  Container(
                                    height: 120,
                                    width: MediaQuery.of(context).size.width / 2,
                                    color: Colors.white,
                                    child: Column(
                                      children: [
                                        SizedBox(height:7)
                     ,                                      Text(
                                          'Here is the title of your first product in search wishlist',
                                          style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                  color: Colors.grey.shade900,
                                                  fontSize: 13)),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              ' ₹ 100',
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 12)),
                                            ),
                                          ],
                                        ),
                                       
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.room,
                                              color: Colors.grey.shade700,
                                              size: 15,
                                            ),
                                            Text(
                                              'Brooklyn',
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Colors.grey.shade700,
                                                      fontSize: 9)),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 1,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.orange,
                                              size: 13,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.orange,
                                              size: 13,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.orange,
                                              size: 13,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.orange,
                                              size: 13,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.orange,
                                              size: 13,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              '(100)',
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Colors.grey.shade700,
                                                      fontSize: 11)),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 2,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              ' 69 sale',
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Colors.grey.shade700,
                                                      fontSize: 11)),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadiusDirectional.circular(1),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey.shade400,
                                              spreadRadius: 1)
                                        ]),
                                    child: Center(
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.grey.shade700,
                                        size: 23,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: 40,
                                    width: MediaQuery.of(context).size.width / 1.5,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(1),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.blue.shade900,
                                              spreadRadius: 1)
                                        ]),
                                    child: Center(
                                      child: Text(
                                        'Add To Shopping Cart',
                                        style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                                color: Colors.blue.shade900,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14)),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                                         ),
                     ),
                    SizedBox(height: 10,),
                   InkWell(
                     onTap: (){
                          Navigator.of(context).push(PageRouteBuilder(
                        transitionDuration: Duration(seconds: 1),
                        transitionsBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secAnimation,
                            Widget child) {
                          animation = CurvedAnimation(
                              parent: animation, curve: Curves.linear);
                          return SharedAxisTransition(
                              child: child,
                              animation: animation,
                              secondaryAnimation: secAnimation,
                              transitionType:
                                  SharedAxisTransitionType.horizontal);
                        },
                        pageBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secAnimation) {
                          return ProductDisplay();
                        }));
                     },
                     child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Container(
                          height: 180,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade300,
                                    spreadRadius: 1,
                                    blurRadius: 4,
                                    offset: Offset(3, 3))
                              ]),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 2,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 120,
                                    width: MediaQuery.of(context).size.width / 3,
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset('assets/camera.png'),
                                    ),
                                  ),
                                  Container(
                                    height: 120,
                                    width: MediaQuery.of(context).size.width / 2,
                                    color: Colors.white,
                                    child: Column(
                                      children: [
                                        SizedBox(height:7)
                   ,                                      Text(
                                          'Here is the title of your first product in search wishlist',
                                          style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                  color: Colors.grey.shade900,
                                                  fontSize: 13)),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              ' ₹ 100',
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 12)),
                                            ),
                                          ],
                                        ),
                                       
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.room,
                                              color: Colors.grey.shade700,
                                              size: 15,
                                            ),
                                            Text(
                                              'Brooklyn',
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Colors.grey.shade700,
                                                      fontSize: 9)),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 1,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.orange,
                                              size: 13,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.orange,
                                              size: 13,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.orange,
                                              size: 13,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.orange,
                                              size: 13,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.orange,
                                              size: 13,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              '(100)',
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Colors.grey.shade700,
                                                      fontSize: 11)),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 2,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              ' 69 sale',
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Colors.grey.shade700,
                                                      fontSize: 11)),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadiusDirectional.circular(1),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey.shade400,
                                              spreadRadius: 1)
                                        ]),
                                    child: Center(
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.grey.shade700,
                                        size: 23,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: 40,
                                    width: MediaQuery.of(context).size.width / 1.5,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(1),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.blue.shade900,
                                              spreadRadius: 1)
                                        ]),
                                    child: Center(
                                      child: Text(
                                        'Add To Shopping Cart',
                                        style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                                color: Colors.blue.shade900,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14)),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                   ),
                    SizedBox(height: 10,),
                     InkWell(
                       onTap: (){
                            Navigator.of(context).push(PageRouteBuilder(
                        transitionDuration: Duration(seconds: 1),
                        transitionsBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secAnimation,
                            Widget child) {
                          animation = CurvedAnimation(
                              parent: animation, curve: Curves.linear);
                          return SharedAxisTransition(
                              child: child,
                              animation: animation,
                              secondaryAnimation: secAnimation,
                              transitionType:
                                  SharedAxisTransitionType.horizontal);
                        },
                        pageBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secAnimation) {
                          return ProductDisplay();
                        }));
                       },
                       child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Container(
                          height: 180,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade300,
                                    spreadRadius: 1,
                                    blurRadius: 4,
                                    offset: Offset(3, 3))
                              ]),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 2,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 120,
                                    width: MediaQuery.of(context).size.width / 3,
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset('assets/bag.png'),
                                    ),
                                  ),
                                  Container(
                                    height: 120,
                                    width: MediaQuery.of(context).size.width / 2,
                                    color: Colors.white,
                                    child: Column(
                                      children: [
                                        SizedBox(height:7)
                     ,                                      Text(
                                          'Here is the title of your first product in search wishlist',
                                          style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                  color: Colors.grey.shade900,
                                                  fontSize: 13)),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              ' ₹ 100',
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 12)),
                                            ),
                                          ],
                                        ),
                                       
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.room,
                                              color: Colors.grey.shade700,
                                              size: 15,
                                            ),
                                            Text(
                                              'Brooklyn',
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Colors.grey.shade700,
                                                      fontSize: 9)),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 1,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.orange,
                                              size: 13,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.orange,
                                              size: 13,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.orange,
                                              size: 13,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.orange,
                                              size: 13,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.orange,
                                              size: 13,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              '(100)',
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Colors.grey.shade700,
                                                      fontSize: 11)),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 2,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              ' 69 sale',
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Colors.grey.shade700,
                                                      fontSize: 11)),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadiusDirectional.circular(1),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey.shade400,
                                              spreadRadius: 1)
                                        ]),
                                    child: Center(
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.grey.shade700,
                                        size: 23,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: 40,
                                    width: MediaQuery.of(context).size.width / 1.5,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(1),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.blue.shade900,
                                              spreadRadius: 1)
                                        ]),
                                    child: Center(
                                      child: Text(
                                        'Add To Shopping Cart',
                                        style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                                color: Colors.blue.shade900,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14)),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                                         ),
                     ),
                    SizedBox(height:100),
                  ],
                ),
              ),
            ),
          ),
          Column(
            children: [
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        'Wishlist',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.grey.shade900, fontSize: 17)),
                      ),
                    ),
                    Row(
                      children: [
                       
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.notifications,
                              color: Colors.grey.shade700,
                              size: 22,
                            ))
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  // boxShadow: [BoxShadow(
                  //   color: Colors.grey.shade100,spreadRadius: 5,
                  //   offset: Offset(0, 5)
                  // )]
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey.shade600,
                            size: 25,
                          ),
                          isDense: true,
                          filled: true,
                          fillColor: Colors.grey.shade100,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                          hintText: 'Search Wishlist',
                          hintStyle: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.grey.shade600, fontSize: 14))),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
