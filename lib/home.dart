import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:vkreta/allnotifications.dart';
import 'package:vkreta/lowtohighprice.dart';
import 'package:vkreta/notifications.dart';
import 'package:vkreta/productdisplay.dart';

import 'package:vkreta/viewall.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(),
                  child: Row(
                    children: [
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
                            color: Colors.black,
                            size: 22,
                          ))
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:10),
                child: InkWell(
                  onTap:(){

                  },
                  child: Container(
                    height:50,
                    width:MediaQuery.of(context).size.width,
                    decoration:BoxDecoration(
                      color:Colors.blue,
                      borderRadius:BorderRadius.circular(5)
                    ),
                    child:Row(
                      children:[
                        SizedBox(width:10),
                        Icon(Icons.room,color:Colors.white,size:20),
                        SizedBox(width:10),
                         Text(
                          'Deliver to shanti - Uklana Mnadi 125436',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  )),
                        ),
                        //SizedBox(width:10),
                        PopupMenuButton(
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.white,
                                size: 30,
                              ),
                              itemBuilder: (context) => [
                                PopupMenuItem(
                                    child: Column(
                                  children: [
                                    InkWell(
                                      onTap: (){
                                        setState(() {
                                        
                                        });
                                      },
                                      child: Row(
                                        children: [
                                        
                                          Text(
                                            "Other",
                                            style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                    color: Colors.grey.shade900,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold)),
                                          ),
                                        ],
                                      ),
                                    ),
                                     SizedBox(
                                      height: 10,
                                    ),
                                    
                                    InkWell(
                                      onTap: (){
                                        setState(() {
                                         
                                        });
                                      },
                                      child: Row(
                                        children: [
                                          
                                                Text(
                                        "Other",
                                        style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                                color: Colors.grey.shade900,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                  
                                    SizedBox(
                                      height: 10,
                                    ),
                                    InkWell(
                                      onTap: (){
                                        setState(() {
                                         
                                        });
                                      },
                                      child: Row(
                                        children: [
                                          
                                               Text(
                                        "Other",
                                        style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                                color: Colors.grey.shade900,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                        ],
                                      ),
                                    ),
                                   
                                   
                                  ],
                                ))
                              ],
                            ), 
                
                      ]
                    )
                  ),
                ),
              ),
              Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(children: [
                        InkWell(
                          onTap:(){
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
                            return ViewAll(
                              title: 'Baby',
                            );
                          }));
                          },
                          child: Container(
                            height: 100,
                            width: 100,
                            color: Colors.white,
                            child: Column(children: [
                              Container(
                                  height: 80,
                                  width: 80,
                                  child: Image.asset('assets/baby.png')),
                              Text(
                                'Baby',
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ]),
                          ),
                        ),
                        InkWell(
                          onTap:(){
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
                            return ViewAll(
                              title:'Beauty'
                            );
                          }));
                          },
                          child: Container(
                            height: 100,
                            width: 100,
                            color: Colors.white,
                            child: Column(children: [
                              Container(
                                  height: 80,
                                  width: 80,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset('assets/beauty.png'),
                                  )),
                              Text(
                                'Beauty',
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ]),
                          ),
                        ),
                        InkWell(
                          onTap:(){
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
                            return ViewAll(title: 'Foods');
                          }));
                          },
                          child: Container(
                            height: 100,
                            width: 100,
                            color: Colors.white,
                            child: Column(children: [
                              Container(
                                  height: 80,
                                  width: 80,
                                  child: Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: Image.asset('assets/food.png'),
                                  )),
                              Text(
                                'Foods',
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ]),
                          ),
                        ),
                        InkWell(
                          onTap:(){
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
                            return ViewAll(
                              title:'Grocery'
                            );
                          }));
                          },
                          child: Container(
                            height: 100,
                            width: 100,
                            color: Colors.white,
                            child: Column(children: [
                              Container(
                                  height: 80,
                                  width: 80,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset('assets/grocery.png'),
                                  )),
                              Text(
                                'Grocery',
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ]),
                          ),
                        ),
                        InkWell(
                          onTap:(){
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
                            return ViewAll(
                              title:'Health'
                            );
                          }));
                          },
                          child: Container(
                            height: 100,
                            width: 100,
                            color: Colors.white,
                            child: Column(children: [
                              Container(
                                  height: 80,
                                  width: 80,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset('assets/health.png'),
                                  )),
                              Text(
                                'Health',
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ]),
                          ),
                        ),
                        InkWell(
                          onTap:(){
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
                            return ViewAll(
                              title:'Home'
                            );
                          }));
                          },
                          child: Container(
                            height: 100,
                            width: 100,
                            color: Colors.white,
                            child: Column(children: [
                              Container(
                                  height: 80,
                                  width: 80,
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Image.asset('assets/home.png'),
                                  )),
                              Text(
                                'Home',
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ]),
                          ),
                        ),
                      ]))),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Divider(
                  height: 1,
                  color: Colors.grey.shade500,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(color: Colors.white,
                    borderRadius: BorderRadius.circular(1),
                    boxShadow:[BoxShadow(
                      color:Colors.grey.shade200,
                      blurRadius:3,
                      spreadRadius: 2
                    )]
                    ),
                    child:  Center(
                      child: Text(
                        'Slider',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Text(
                      'Electronics Clearance Store',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            spreadRadius: 4,
                            blurRadius: 5,
                            offset: Offset(3, 3),
                          )
                        ]),
                    child: Image.asset('assets/shirt.png')),
              ),
               SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Text(
                      'Automotive Essentials',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            spreadRadius: 4,
                            blurRadius: 5,
                            offset: Offset(3, 3),
                          )
                        ]),
                    child: Column(
                      mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: Row(
                            mainAxisAlignment:MainAxisAlignment.spaceBetween,
                            children:[
                               Container(
                                height: 100,
                                width: 100,
                                color: Colors.white,
                                child: Column(children: [
                                  Container(
                                      height: 80,
                                      width: 80,
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Image.asset('assets/bag.png'),
                                      )),
                                  Text(
                                    'Bag',
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ]),
                              ),
                               Container(
                                height: 100,
                                width: 100,
                                color: Colors.white,
                                child: Column(children: [
                                  Container(
                                      height: 80,
                                      width: 80,
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Image.asset('assets/shirt.png'),
                                      )),
                                  Text(
                                    'Shirt',
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ]),
                              ),
                            ]
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: Row(
                            mainAxisAlignment:MainAxisAlignment.spaceBetween,
                            children:[
                               Container(
                                height: 100,
                                width: 100,
                                color: Colors.white,
                                child: Column(children: [
                                  Container(
                                      height: 80,
                                      width: 80,
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Image.asset('assets/shoes.png'),
                                      )),
                                  Text(
                                    'Shoes',
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ]),
                              ),
                               Container(
                                height: 100,
                                width: 100,
                                color: Colors.white,
                                child: Column(children: [
                                  Container(
                                      height: 80,
                                      width: 80,
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Image.asset('assets/camera.png'),
                                      )),
                                  Text(
                                    'Camera',
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ]),
                              ),
                            ]
                          ),
                        ),
                      ],
                    )
                    ),
              ),
               SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Text(
                      'Shops by category',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            spreadRadius: 4,
                            blurRadius: 5,
                            offset: Offset(3, 3),
                          )
                        ]),
                    child: Column(
                      mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: Row(
                            mainAxisAlignment:MainAxisAlignment.spaceBetween,
                            children:[
                               Container(
                                height: 100,
                                width: 100,
                                color: Colors.white,
                                child: Column(children: [
                                  Container(
                                      height: 80,
                                      width: 80,
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Image.asset('assets/bag.png'),
                                      )),
                                  Text(
                                    'Bag',
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ]),
                              ),
                               Container(
                                height: 100,
                                width: 100,
                                color: Colors.white,
                                child: Column(children: [
                                  Container(
                                      height: 80,
                                      width: 80,
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Image.asset('assets/shirt.png'),
                                      )),
                                  Text(
                                    'Shirt',
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ]),
                              ),
                            ]
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: Row(
                            mainAxisAlignment:MainAxisAlignment.spaceBetween,
                            children:[
                               Container(
                                height: 100,
                                width: 100,
                                color: Colors.white,
                                child: Column(children: [
                                  Container(
                                      height: 80,
                                      width: 80,
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Image.asset('assets/shoes.png'),
                                      )),
                                  Text(
                                    'Shoes',
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ]),
                              ),
                               Container(
                                height: 100,
                                width: 100,
                                color: Colors.white,
                                child: Column(children: [
                                  Container(
                                      height: 80,
                                      width: 80,
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Image.asset('assets/camera.png'),
                                      )),
                                  Text(
                                    'Camera',
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ]),
                              ),
                            ]
                          ),
                        ),
                      ],
                    )
                    ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Text(
                      'Flash sale',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Flash sales end in',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 11,
                          )),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              color: Colors.blue.shade900,
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: Text(
                              '08',
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                              )),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          ':',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 11,
                          )),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              color: Colors.blue.shade900,
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: Text(
                              '45',
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                              )),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          ':',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 11,
                          )),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              color: Colors.blue.shade900,
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: Text(
                              '24',
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                              )),
                            ),
                          ),
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap:(){
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
                                  return ViewAll(
                                    title:'Flash Sale',
                                  );
                                }));
                      },
                      child: Text(
                        'View All',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.blue.shade900,
                                fontSize: 12,
                                fontWeight: FontWeight.bold)),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 220,
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 15,
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
                                return ProductDisplay();
                              }));
                        },
                        child: Container(
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
                          child: Stack(
                            children: [Column(
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
                                        '₹ 100',
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
                             Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(children: [
                      Container(
                          height: 25,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20))),
                          child: Center(
                            child: Text(
                              '-60%',
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Colors.white, fontSize: 10)),
                            ),
                          ))
                    ]),
                  ),
                            ]
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
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
                                return ProductDisplay();
                              }));
                        },
                        child: Container(
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
                          child: Stack(
                            children: [Column(
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
                                        '₹ 100',
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
                            Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(children: [
                      Container(
                          height: 25,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20))),
                          child: Center(
                            child: Text(
                              '-60%',
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Colors.white, fontSize: 10)),
                            ),
                          ))
                    ]),
                  ),
                            ]
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
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
                                return ProductDisplay();
                              }));
                        },
                        child: Container(
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
                          child: Stack(
                            children: [Column(
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
                                        '₹ 100',
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
                            Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(children: [
                      Container(
                          height: 25,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20))),
                          child: Center(
                            child: Text(
                              '-60%',
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Colors.white, fontSize: 10)),
                            ),
                          ))
                    ]),
                  ),
                            ]
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
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
                                return ProductDisplay();
                              }));
                        },
                        child: Container(
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
                          child: Stack(
                            children: [Column(
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
                                        '₹ 100',
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
                            Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(children: [
                      Container(
                          height: 25,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20))),
                          child: Center(
                            child: Text(
                              '-60%',
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Colors.white, fontSize: 10)),
                            ),
                          ))
                    ]),
                  ),
                            ]
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Your Last Search',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                    ),
                    GestureDetector(
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
                                  return ViewAll(
                                    title:'Your Last Search Products'
                                  );
                                }));
                      },
                      child: Text(
                        'View All',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.blue.shade900,
                                fontSize: 12,
                                fontWeight: FontWeight.bold)),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 220,
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 15,
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
                        child: Stack(
                          children: [Column(
                            children: [
                              SizedBox(
                                height: 5,
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
                                            parent: animation,
                                            curve: Curves.linear);
                                        return SharedAxisTransition(
                                            child: child,
                                            animation: animation,
                                            secondaryAnimation: secAnimation,
                                            transitionType:
                                                SharedAxisTransitionType
                                                    .horizontal);
                                      },
                                      pageBuilder: (BuildContext context,
                                          Animation<double> animation,
                                          Animation<double> secAnimation) {
                                        return ProductDisplay();
                                      }));
                                },
                                child: Container(
                                  height: 100,
                                  width: 130,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset('assets/shoes.png'),
                                  ),
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
                                      '₹ 100',
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
                          Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(children: [
                      Container(
                          height: 25,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20))),
                          child: Center(
                            child: Text(
                              '-60%',
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Colors.white, fontSize: 10)),
                            ),
                          ))
                    ]),
                  ),
                          ]
                        ),
                      ),
                      SizedBox(
                        width: 10,
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
                                return ProductDisplay();
                              }));
                        },
                        child: Container(
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
                          child: Stack(
                            children: [Column(
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
                                        '₹ 100',
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
                            Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(children: [
                      Container(
                          height: 25,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20))),
                          child: Center(
                            child: Text(
                              '-60%',
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Colors.white, fontSize: 10)),
                            ),
                          ))
                    ]),
                  ),
                            ]
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
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
                                return ProductDisplay();
                              }));
                        },
                        child: Container(
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
                          child: Stack(
                            children: [Column(
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
                                        '₹ 100',
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
                            Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(children: [
                      Container(
                          height: 25,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20))),
                          child: Center(
                            child: Text(
                              '-60%',
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Colors.white, fontSize: 10)),
                            ),
                          ))
                    ]),
                  ),
                            ]
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
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
                                return ProductDisplay();
                              }));
                        },
                        child: Container(
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
                          child: Stack(
                            children: [Column(
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
                                        '₹ 100',
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
                            Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(children: [
                      Container(
                          height: 25,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20))),
                          child: Center(
                            child: Text(
                              '-60%',
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Colors.white, fontSize: 10)),
                            ),
                          ))
                    ]),
                  ),
                            ]
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Latest Products',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                    ),
                    GestureDetector(
                      onTap:(){
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
                                  return ViewAll(
                                    title:'Latest Products'
                                  );
                                }));
                      },
                      child: Text(
                        'View All',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.blue.shade900,
                                fontSize: 12,
                                fontWeight: FontWeight.bold)),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 220,
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 15,
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
                                return ProductDisplay();
                              }));
                        },
                        child: Container(
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
                          child: Stack(
                            children: [Column(
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
                                        '₹ 100',
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
                             Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(children: [
                      Container(
                          height: 25,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20))),
                          child: Center(
                            child: Text(
                              '-60%',
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Colors.white, fontSize: 10)),
                            ),
                          ))
                    ]),
                  ),
                            ]
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
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
                                return ProductDisplay();
                              }));
                        },
                        child: Container(
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
                          child: Stack(
                            children: [Column(
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
                                        '₹ 100',
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
                             Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(children: [
                      Container(
                          height: 25,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20))),
                          child: Center(
                            child: Text(
                              '-60%',
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Colors.white, fontSize: 10)),
                            ),
                          ))
                    ]),
                  ),
                            ]
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
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
                                return ProductDisplay();
                              }));
                        },
                        child: Container(
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
                          child: Stack(
                            children: [Column(
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
                                        '₹ 100',
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
                             Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(children: [
                      Container(
                          height: 25,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20))),
                          child: Center(
                            child: Text(
                              '-60%',
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Colors.white, fontSize: 10)),
                            ),
                          ))
                    ]),
                  ),
                            ]
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
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
                                return ProductDisplay();
                              }));
                        },
                        child: Container(
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
                          child: Stack(
                            children: [Column(
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
                                        '₹ 100',
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
                             Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(children: [
                      Container(
                          height: 25,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20))),
                          child: Center(
                            child: Text(
                              '-60%',
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Colors.white, fontSize: 10)),
                            ),
                          ))
                    ]),
                  ),
                            ]
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Best Sellers',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                    ),
                    GestureDetector(
                      onTap:(){
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
                                  return ViewAll(
                                    title:'Best Sellers'
                                  );
                                }));
                      },
                      child: Text(
                        'View All',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.blue.shade900,
                                fontSize: 12,
                                fontWeight: FontWeight.bold)),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 220,
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 15,
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
                                return ProductDisplay();
                              }));
                        },
                        child: Container(
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
                          child: Stack(
                            children: [Column(
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
                                        '₹ 100',
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
                             Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(children: [
                      Container(
                          height: 25,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20))),
                          child: Center(
                            child: Text(
                              '-60%',
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Colors.white, fontSize: 10)),
                            ),
                          ))
                    ]),
                  ),
                            ]
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
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
                                return ProductDisplay();
                              }));
                        },
                        child: Container(
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
                          child: Stack(
                            children: [Column(
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
                                        '₹ 100',
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
                             Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(children: [
                      Container(
                          height: 25,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20))),
                          child: Center(
                            child: Text(
                              '-60%',
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Colors.white, fontSize: 10)),
                            ),
                          ))
                    ]),
                  ),
                            ]
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
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
                                return ProductDisplay();
                              }));
                        },
                        child: Container(
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
                          child: Stack(
                            children: [Column(
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
                                        '₹ 100',
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
                             Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(children: [
                      Container(
                          height: 25,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20))),
                          child: Center(
                            child: Text(
                              '-60%',
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Colors.white, fontSize: 10)),
                            ),
                          ))
                    ]),
                  ),
                            ]
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
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
                                return ProductDisplay();
                              }));
                        },
                        child: Container(
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
                          child: Stack(
                            children: [Column(
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
                                        '₹ 100',
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
                             Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(children: [
                      Container(
                          height: 25,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20))),
                          child: Center(
                            child: Text(
                              '-60%',
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Colors.white, fontSize: 10)),
                            ),
                          ))
                    ]),
                  ),
                            ]
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
