import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vkreta/account.dart';
import 'package:vkreta/cart.dart';
import 'package:vkreta/home.dart';
import 'package:vkreta/wishlist.dart';


class SelectScreen extends StatefulWidget {
  const SelectScreen({ Key? key }) : super(key: key);

  @override
  State<SelectScreen> createState() => _SelectScreenState();
}

class _SelectScreenState extends State<SelectScreen> {
  int currentindex=0;

  List<Widget> screen=[
    Home(),
    WishList(),
    Cart(),
    Account()
  ];

  Future<bool>onWillPop()async{
    return false;
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop:onWillPop ,
      child: Scaffold(
        backgroundColor: Colors.white,
       bottomNavigationBar: BottomNavigationBar(
         elevation: 0,
         onTap: (index){
           setState(() {
             currentindex=index;
           });
         },
         type: BottomNavigationBarType.fixed,
         currentIndex: currentindex,
       unselectedLabelStyle: GoogleFonts.poppins(
         textStyle:TextStyle(
           color: Colors.grey.shade700,
           fontWeight: FontWeight.bold
         )
       ),
         unselectedFontSize: 9,
         selectedLabelStyle: GoogleFonts.poppins(
           textStyle: TextStyle(
             color: Colors.blue.shade900,fontWeight: FontWeight.bold
           )
         ),
         unselectedItemColor: Colors.grey.shade700,
         selectedFontSize: 10,
         selectedItemColor: Colors.blue.shade900,
         iconSize: 25,
         items: const[
           BottomNavigationBarItem(
           icon: Icon(Icons.home,),
           label: 'Home',
           backgroundColor: Colors.white
),
 BottomNavigationBarItem(
           icon: Icon(Icons.favorite),
           label: 'WishList',
           backgroundColor: Colors.white
),
 BottomNavigationBarItem(
           icon: Icon(Icons.shopping_cart),
           label: 'Cart',
           backgroundColor: Colors.white
),
 BottomNavigationBarItem(
           icon: Icon(Icons.person_outline,),
           label: 'My Account',
           backgroundColor: Colors.white
),
  ]),
  body: screen[currentindex],
        ),
    );
  }
}