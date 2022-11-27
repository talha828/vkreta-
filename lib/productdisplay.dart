import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vkreta/Enterpincode.dart';
import 'package:vkreta/allnotifications.dart';
import 'package:vkreta/allreviews.dart';
import 'package:vkreta/cart.dart';
import 'package:vkreta/deliveryestimated.dart';
import 'package:vkreta/description.dart';
import 'package:vkreta/editaddress.dart';
import 'package:vkreta/helpsupport.dart';
import 'package:vkreta/lowtohighprice.dart';
import 'package:vkreta/notifications.dart';
import 'package:vkreta/showproduct.dart';

class ProductDisplay extends StatefulWidget {
  const ProductDisplay({Key? key}) : super(key: key);

  @override
  State<ProductDisplay> createState() => _ProductDisplayState();
}

class _ProductDisplayState extends State<ProductDisplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        SafeArea(
            child: Container(
          height: 1000,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Colors.white),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                          size: 25,
                        )),
                    Expanded(
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
                            hintText: 'Search Product',
                            hintStyle: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 14))),
                      ),
                    ),
                   
                    IconButton(
                        onPressed: () {
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
                                  return AllNotifications();
                                }));
                        },
                        icon: Icon(
                          Icons.notifications,
                          color: Colors.grey.shade700,
                          size: 22,
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Divider(
                  height: 1,
                  color: Colors.grey.shade300,
                ),
              ),
              Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Colors.white),
                child: Stack(children: [
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
                            return ShoeProduct();
                          }));
                    },
                    child: Container(
                        height: 300,
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                            child: Image.asset('assets/shoes.png',
                                fit: BoxFit.cover))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(children: [
                      Container(
                          height: 40,
                          width: 70,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20))),
                          child: Center(
                            child: Text(
                              '-60%',
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Colors.white, fontSize: 16)),
                            ),
                          ))
                    ]),
                  ),
                ]),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Text(
                      'WaterProof Shoes Full Branded',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 16)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   Row(
                     children:[
                        Text(
                      'MRP -',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              // fontWeight:FontWeight.bold,
                              color: Colors.grey.shade700,
                              fontSize: 14)),
                    ),
                    SizedBox(width:5),
                    Container(
                      height: 30,width: 50,color: Colors.white,
                      child: Stack(
                        children: [Center(
                          child: Text(
                            '₹ 320',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                   fontWeight:FontWeight.bold,
                                    color: Colors.grey.shade700,
                                    fontSize: 16)),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 1,
                              width: 50,
                              color:Colors.grey.shade400
                            ),
                          ],
                        )
                     ]),
                    ),
                    SizedBox(width: 10),
                    Container(
                        height: 20,
                        width: 35,
                        decoration: BoxDecoration(
                            color: Colors.blue.shade900,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            '12%',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.white, fontSize: 11)),
                          ),
                        )),
                    SizedBox(width: 3),
                    Text(
                      'DISCOUNT',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue.shade900,
                              fontSize: 12)),
                    ),
                     ]
                   ),
                   IconButton(onPressed: (){

                   }, icon: Icon(Icons.share,color:Colors.blue.shade900,size:25)
                   )
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Text(
                      '₹ 100',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                              fontSize: 20)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Here is the title of your first product in search wishlist',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.grey.shade900, fontSize: 16)),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.orange,
                      size: 20,
                    ),
                    Text(
                      '5.0',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.grey.shade900,
                              fontWeight: FontWeight.bold,
                              fontSize: 14)),
                    ),
                    Text(
                      '(100)',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.grey.shade500, fontSize: 13)),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 1,
                      height: 13,
                      color: Colors.grey.shade400,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '17 Sale',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.grey.shade500, fontSize: 13)),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 1,
                      height: 13,
                      color: Colors.grey.shade400,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.room,
                      color: Colors.grey.shade500,
                      size: 17,
                    ),
                    Text(
                      'Brooklyn',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.grey.shade500, fontSize: 13)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(children: [
                  Text(
                    'Product identification no :',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.grey.shade800, fontSize: 13)),
                  ),
                  SizedBox(width: 10),
                  Text(
                    '7253628',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 13)),
                  ),
                ]),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 10,
                width: MediaQuery.of(context).size.width,
                color: Colors.grey.shade100,
              ),
            
              Container(
                height: 10,
                width: MediaQuery.of(context).size.width,
                color: Colors.grey.shade100,
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Enter your pin code to check availability',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade900,
                                fontSize: 11)),
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
                                return EnterPinCode();
                              }));
                        },
                        child: Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.blue.shade900,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              'Enter Pin Code',
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 12)),
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center, children: []),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 10,
                width: MediaQuery.of(context).size.width,
                color: Colors.grey.shade100,
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 80,
                      width: 70,
                      color: Colors.white,
                      child: Column(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            child: Image.asset(
                              'assets/cod.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(height: 17),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'COD',
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        //fontWeight: FontWeight.bold,
                                        color: Colors.grey.shade700,
                                        fontSize: 10)),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Available',
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        //fontWeight: FontWeight.bold,
                                        color: Colors.grey.shade700,
                                        fontSize: 10)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 80,
                      width: 70,
                      color: Colors.white,
                      child: Column(
                        children: [
                          Container(
                            height: 30,
                            width: 40,
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Image.asset(
                                'assets/fs.png',
                                // color:Colors.blue,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: 18),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Free',
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.grey.shade700,
                                        fontSize: 10)),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Shipping',
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.grey.shade700,
                                        fontSize: 10)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 80,
                      width: 70,
                      color: Colors.white,
                      child: Column(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            child: Image.asset(
                              'assets/hf.png',
                              color: Colors.orange,
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Hassle Free',
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        //fontWeight: FontWeight.bold,
                                        color: Colors.grey.shade700,
                                        fontSize: 10)),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Delivery',
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.grey.shade700,
                                        fontSize: 10)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 10,
                width: MediaQuery.of(context).size.width,
                color: Colors.grey.shade100,
              ),
               
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Text(
                      'Variants',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.grey.shade900,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Text(
                      'Size : ',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.grey.shade500, fontSize: 14)),
                    ),
                    Text(
                      'XS',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.grey.shade900,
                              fontWeight: FontWeight.bold,
                              fontSize: 14)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade900,
                        borderRadius: BorderRadiusDirectional.circular(7),
                      ),
                      child: Center(
                        child: Text(
                          'XS',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Container(
                      height: 33,
                      width: 33,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade300, spreadRadius: 1)
                        ],
                        borderRadius: BorderRadiusDirectional.circular(7),
                      ),
                      child: Center(
                        child: Text(
                          'S',
                          style: GoogleFonts.poppins(
                              textStyle:
                                  TextStyle(color: Colors.black, fontSize: 15)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Container(
                      height: 33,
                      width: 33,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade300, spreadRadius: 1)
                        ],
                        borderRadius: BorderRadiusDirectional.circular(7),
                      ),
                      child: Center(
                        child: Text(
                          'M',
                          style: GoogleFonts.poppins(
                              textStyle:
                                  TextStyle(color: Colors.black, fontSize: 15)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Container(
                      height: 33,
                      width: 33,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade300, spreadRadius: 1)
                        ],
                        borderRadius: BorderRadiusDirectional.circular(7),
                      ),
                      child: Center(
                        child: Text(
                          'L',
                          style: GoogleFonts.poppins(
                              textStyle:
                                  TextStyle(color: Colors.black, fontSize: 15)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Container(
                      height: 33,
                      width: 33,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade300, spreadRadius: 1)
                        ],
                        borderRadius: BorderRadiusDirectional.circular(7),
                      ),
                      child: Center(
                        child: Text(
                          'XL',
                          style: GoogleFonts.poppins(
                              textStyle:
                                  TextStyle(color: Colors.black, fontSize: 15)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Container(
                      height: 33,
                      width: 33,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade300, spreadRadius: 1)
                        ],
                        borderRadius: BorderRadiusDirectional.circular(7),
                      ),
                      child: Center(
                        child: Text(
                          'XXL',
                          style: GoogleFonts.poppins(
                              textStyle:
                                  TextStyle(color: Colors.black, fontSize: 15)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Text(
                      'Color : ',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.grey.shade500, fontSize: 14)),
                    ),
                    Text(
                      'Red',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.grey.shade900,
                              fontWeight: FontWeight.bold,
                              fontSize: 14)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Container(
                      height: 35,
                      width: 70,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade900,
                        borderRadius: BorderRadiusDirectional.circular(7),
                      ),
                      child: Center(
                        child: Text(
                          'Red',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Container(
                      height: 33,
                      width: 75,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade300, spreadRadius: 1)
                        ],
                        borderRadius: BorderRadiusDirectional.circular(7),
                      ),
                      child: Center(
                        child: Text(
                          'Green',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.grey.shade700, fontSize: 14)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Container(
                      height: 33,
                      width: 75,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade300, spreadRadius: 1)
                        ],
                        borderRadius: BorderRadiusDirectional.circular(7),
                      ),
                      child: Center(
                        child: Text(
                          'Black',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.grey.shade700, fontSize: 14)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Container(
                      height: 33,
                      width: 75,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade300, spreadRadius: 1)
                        ],
                        borderRadius: BorderRadiusDirectional.circular(7),
                      ),
                      child: Center(
                        child: Text(
                          'White',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.grey.shade700, fontSize: 14)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Container(
                      height: 33,
                      width: 73,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade300, spreadRadius: 1)
                        ],
                        borderRadius: BorderRadiusDirectional.circular(7),
                      ),
                      child: Center(
                        child: Text(
                          'Blue',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.grey.shade700, fontSize: 14)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Container(
                      height: 33,
                      width: 77,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade300, spreadRadius: 1)
                        ],
                        borderRadius: BorderRadiusDirectional.circular(7),
                      ),
                      child: Center(
                        child: Text(
                          'Yellow',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.grey.shade700, fontSize: 14)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Container(
                      height: 33,
                      width: 74,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade300, spreadRadius: 1)
                        ],
                        borderRadius: BorderRadiusDirectional.circular(7),
                      ),
                      child: Center(
                        child: Text(
                          'Pink',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.grey.shade700, fontSize: 14)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
               SizedBox(
                height: 10,
              ),
              
              Container(
                height: 10,
                width: MediaQuery.of(context).size.width,
                color: Colors.grey.shade100,
              ),
               SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(children: [
                  Text(
                    'SORT BY :',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.grey.shade800, fontSize: 13)),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'NARESH STORE',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade900,
                            fontSize: 13)),
                  ),
                ]),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(children: [
                  Text(
                    'AVAILABLE AT :',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.grey.shade800, fontSize: 13)),
                  ),
                  SizedBox(width: 10),
                  Text(
                    '26 MORE SELLERS',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade900,
                            fontSize: 13)),
                  ),
                ]),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
      
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                 Row(
                   children: [
                      Text(
                    'STARTING FROM :',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.grey.shade800, fontSize: 13)),
                  ),
                  SizedBox(width: 10),
                  Text(
                    '₹ 800',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade900,
                            fontSize: 13)),
                  ),
                   ],
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
                                  return LowToHighPrice();
                                }));
                   },
                   child: Row(
                     children: [
                       Text(
                          'view',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                  color: Colors.blue.shade900, fontSize: 13)),
                        ),
                       
                        Icon(Icons.keyboard_arrow_right,color:Colors.blue.shade900,size:20)
                     ],
                   ),
                 ),
                  
                ]),
              ),
              SizedBox(
                height: 10,
              ),
              
              Container(
                height: 10,
                width: MediaQuery.of(context).size.width,
                color: Colors.grey.shade100,
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Text(
                      'Delivery',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.grey.shade900,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                    ),
                  ],
                ),
              ),
              ListTile(
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
                        return DeliveryEstimated();
                      }));
                },
                trailing: Icon(Icons.arrow_forward_ios,
                    color: Colors.grey.shade900, size: 16),
                title: Text(
                  'Calculate the estimated cost for shipping goods to ISLAMABAD',
                  style: GoogleFonts.poppins(
                      textStyle:
                          TextStyle(color: Colors.grey.shade500, fontSize: 15)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 10,
                width: MediaQuery.of(context).size.width,
                color: Colors.grey.shade100,
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Text(
                      'Information',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.grey.shade900,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Weight',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.grey.shade500, fontSize: 13)),
                    ),
                    Text(
                      '300 Gram',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.grey.shade500, fontSize: 13)),
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
                    Text(
                      'Condition',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.grey.shade500, fontSize: 13)),
                    ),
                    Text(
                      'Second',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.grey.shade500, fontSize: 13)),
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
                    Text(
                      'Category',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.grey.shade500, fontSize: 13)),
                    ),
                    Text(
                      'Electronic',
                      style: GoogleFonts.poppins(
                          textStyle:
                              TextStyle(color: Colors.cyan, fontSize: 13)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 10,
                width: MediaQuery.of(context).size.width,
                color: Colors.grey.shade100,
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Text(
                      'Description',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.grey.shade900,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Here is the long description of your product that what you are buying',
                  style: GoogleFonts.poppins(
                      textStyle:
                          TextStyle(color: Colors.grey.shade700, fontSize: 14)),
                ),
              ),
              SizedBox(
                height: 6,
              ),
              GestureDetector(
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
                        return Description();
                      }));
                },
                child: Text(
                  'Read more',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(color: Colors.cyan, fontSize: 13)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 10,
                width: MediaQuery.of(context).size.width,
                color: Colors.grey.shade100,
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Text(
                      'Related Products',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.grey.shade900,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                    ),
                  ],
                ),
              ),
              Container(
                height: 220,
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        height: 200,
                        width: 135,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade200,
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: Offset(1, 3))
                            ]),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 100,
                              width: 130,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset('assets/shoes.png'),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                'Here is the title of your product',
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Colors.grey.shade900,
                                        fontSize: 13)),
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  Text(
                                    '\$100',
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13)),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                    size: 15,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                    size: 15,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                    size: 15,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                    size: 15,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                    size: 15,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '(150)',
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            color: Colors.grey.shade500,
                                            fontSize: 12)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 200,
                        width: 135,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade200,
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: Offset(1, 3))
                            ]),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 100,
                              width: 130,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset('assets/shirt.png'),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                'Here is the title of your product',
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Colors.grey.shade900,
                                        fontSize: 13)),
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  Text(
                                    '\$150',
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13)),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                    size: 15,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                    size: 15,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                    size: 15,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                    size: 15,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                    size: 15,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '(150)',
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            color: Colors.grey.shade500,
                                            fontSize: 12)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 200,
                        width: 135,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade200,
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: Offset(1, 3))
                            ]),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 100,
                              width: 130,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset('assets/bag.png'),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                'Here is the title of your product',
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Colors.grey.shade900,
                                        fontSize: 13)),
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  Text(
                                    '\$90',
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13)),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                    size: 15,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                    size: 15,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                    size: 15,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                    size: 15,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                    size: 15,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '(150)',
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            color: Colors.grey.shade500,
                                            fontSize: 12)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        height: 200,
                        width: 135,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade200,
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: Offset(1, 3))
                            ]),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 100,
                              width: 130,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset('assets/camera.png'),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                'Here is the title of your product',
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Colors.grey.shade900,
                                        fontSize: 13)),
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  Text(
                                    '\$200',
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13)),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                    size: 15,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                    size: 15,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                    size: 15,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                    size: 15,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                    size: 15,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '(150)',
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            color: Colors.grey.shade500,
                                            fontSize: 12)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 10,
                width: MediaQuery.of(context).size.width,
                color: Colors.grey.shade100,
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Reviews',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.grey.shade900,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                    ),
                    GestureDetector(
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
                              return AllReviews();
                            }));
                      },
                      child: Text(
                        'View All',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.cyan,
                                fontWeight: FontWeight.bold,
                                fontSize: 12)),
                      ),
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
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.orange,
                      size: 15,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.orange,
                      size: 15,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.orange,
                      size: 15,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.orange,
                      size: 15,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.orange,
                      size: 15,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '(150)',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.grey.shade500, fontSize: 12)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Divider(
                  height: 1,
                  color: Colors.grey.shade300,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Text(
                      '14 May 2022',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.grey.shade500, fontSize: 12)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Naveed Khan',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.grey.shade900,
                              fontSize: 12,
                              fontWeight: FontWeight.bold)),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.orange,
                          size: 15,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.orange,
                          size: 15,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.orange,
                          size: 15,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.orange,
                          size: 15,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.orange,
                          size: 15,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 3),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'I like this app very mush and i suggested to everyone to must visit this app wnd website',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 12,
                  )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Divider(
                  height: 1,
                  color: Colors.grey.shade300,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Text(
                      '20 June 2022',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.grey.shade500, fontSize: 12)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Sharjeel Tahir',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.grey.shade900,
                              fontSize: 12,
                              fontWeight: FontWeight.bold)),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.orange,
                          size: 15,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.orange,
                          size: 15,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.orange,
                          size: 15,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.orange,
                          size: 15,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.orange,
                          size: 15,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 3),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'I like this app very mush and i suggested to everyone to must visit this app wnd website',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 12,
                  )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Divider(
                  height: 1,
                  color: Colors.grey.shade300,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Text(
                      '14 May 2022',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.grey.shade500, fontSize: 12)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Naveed Khan',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.grey.shade900,
                              fontSize: 12,
                              fontWeight: FontWeight.bold)),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.orange,
                          size: 15,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.orange,
                          size: 15,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.orange,
                          size: 15,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.orange,
                          size: 15,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.orange,
                          size: 15,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 3),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'I like this app very mush and i suggested to everyone to must visit this app wnd website',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 12,
                  )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Divider(
                  height: 1,
                  color: Colors.grey.shade300,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Text(
                      '04 April 2022',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.grey.shade500, fontSize: 12)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Fatima Butt',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.grey.shade900,
                              fontSize: 12,
                              fontWeight: FontWeight.bold)),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.orange,
                          size: 15,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.orange,
                          size: 15,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.orange,
                          size: 15,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.orange,
                          size: 15,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.orange,
                          size: 15,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 3),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'I like this app very mush and i suggested to everyone to must visit this app wnd website',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 12,
                  )),
                ),
              ),
              SizedBox(height: 70),
            ]),
          ),
        )),
        Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(color: Colors.grey.shade200, spreadRadius: 1)
            ]),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
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
                            return HelpSupport();
                          }));
                    },
                    child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade900,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                            child: Icon(
                          Icons.chat,
                          color: Colors.white,
                          size: 20,
                        ))),
                  ),
                  SizedBox(width: 10),
                  Container(
                    height: 35,
                    width: MediaQuery.of(context).size.width / 1.3,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(1),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.blue.shade900, spreadRadius: 1)
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
              ),
            ),
          )
        ])
      ]),
    );
  }
}
