import 'dart:ffi';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vkreta/delivery.dart';
import 'package:vkreta/productdisplay.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text(
          'Shopping Cart',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 16)),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
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
                          transitionType: SharedAxisTransitionType.horizontal);
                    },
                    pageBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secAnimation) {
                      return ProductDisplay();
                    }));
              },
              child: Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width / 3.5,
                      child: Column(
                        children: [
                          Container(
                              height: 120,
                              color: Colors.white,
                              width: MediaQuery.of(context).size.width / 3,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset('assets/shoes.png'),
                              )),
                        ],
                      ),
                    ),
                    Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width / 1.4,
                      color: Colors.white,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 7,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              'Here is the title of your first product you add in Shopping Cart',
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Colors.grey.shade900,
                                      fontSize: 14)),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                Text(
                                  '₹ 100',
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12)),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadiusDirectional.circular(1),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.shade300,
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
                                Row(
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        color: Colors.blue.shade900,
                                        borderRadius:
                                            BorderRadiusDirectional.circular(
                                                10),
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.remove,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '22',
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              color: Colors.grey.shade700,
                                              fontSize: 14)),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        color: Colors.blue.shade900,
                                        borderRadius:
                                            BorderRadiusDirectional.circular(
                                                10),
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                height: 1,
                color: Colors.grey.shade400,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width / 3.5,
                    child: Column(
                      children: [
                        Container(
                            height: 120,
                            color: Colors.white,
                            width: MediaQuery.of(context).size.width / 3,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset('assets/bag.png'),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width / 1.4,
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 7,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'Here is the title of your first product you add in Shopping Cart',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.grey.shade900, fontSize: 14)),
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              Text(
                                '₹ 30',
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadiusDirectional.circular(1),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.shade300,
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
                              Row(
                                children: [
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.blue.shade900,
                                      borderRadius:
                                          BorderRadiusDirectional.circular(10),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '40',
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            color: Colors.grey.shade700,
                                            fontSize: 14)),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.blue.shade900,
                                      borderRadius:
                                          BorderRadiusDirectional.circular(10),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                height: 1,
                color: Colors.grey.shade400,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width / 3.5,
                    child: Column(
                      children: [
                        Container(
                            height: 120,
                            color: Colors.white,
                            width: MediaQuery.of(context).size.width / 3,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset('assets/shirt.png'),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width / 1.4,
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 7,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'Here is the title of your first product you add in Shopping Cart',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.grey.shade900, fontSize: 14)),
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              Text(
                                '₹ 240',
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadiusDirectional.circular(1),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.shade300,
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
                              Row(
                                children: [
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.blue.shade900,
                                      borderRadius:
                                          BorderRadiusDirectional.circular(10),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '50',
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            color: Colors.grey.shade700,
                                            fontSize: 14)),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.blue.shade900,
                                      borderRadius:
                                          BorderRadiusDirectional.circular(10),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                height: 1,
                color: Colors.grey.shade400,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width / 3.5,
                    child: Column(
                      children: [
                        Container(
                            height: 120,
                            color: Colors.white,
                            width: MediaQuery.of(context).size.width / 3,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset('assets/camera.png'),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width / 1.4,
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 7,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'Here is the title of your first product you add in Shopping Cart',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.grey.shade900, fontSize: 14)),
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              Text(
                                '₹ 120',
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadiusDirectional.circular(1),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.shade300,
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
                              Row(
                                children: [
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.blue.shade900,
                                      borderRadius:
                                          BorderRadiusDirectional.circular(10),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '15',
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            color: Colors.grey.shade700,
                                            fontSize: 14)),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.blue.shade900,
                                      borderRadius:
                                          BorderRadiusDirectional.circular(10),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 10,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.grey.shade100),
            ),
            Container(
              height: 130,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade300, spreadRadius: 1)
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.loyalty,
                                    color: Colors.blue.shade900, size: 25),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Use coupons',
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: Colors.grey.shade600,
                                          fontSize: 14)),
                                ),
                              ],
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.grey.shade400,
                                  size: 15,
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 60,
                          width: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Total',
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Row(
                                children: [
                                  Text(
                                    '₹ 100.50',
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
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
                                  return Delivery();
                                }));
                          },
                          child: Container(
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(4)),
                            child: Center(
                              child: Text(
                                'Next',
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14)),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 10,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey.shade100,
            )
          ],
        ),
      ),
    );
  }
}
