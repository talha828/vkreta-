import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vkreta/allnotifications.dart';
import 'package:vkreta/cart.dart';

class LowToHighPrice extends StatefulWidget {
  const LowToHighPrice({Key? key}) : super(key: key);

  @override
  State<LowToHighPrice> createState() => _LowToHighPriceState();
}

class _LowToHighPriceState extends State<LowToHighPrice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                 
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(color: Colors.white,
                    
                    ),
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
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    height:1,color:Colors.grey.shade400
                  ),
                  SizedBox(
                    height: 40,
                  ),
                   Container(
                height: 110,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Image.asset(
                      'assets/shirt.png',
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 110,
                      width: MediaQuery.of(context).size.width / 1.7,
                      // color: Colors.pink,
                      child: Column(
                        children: [
                          Text(
                            'Red Shirt Full branded Size Waterproof',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.grey.shade900,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Text(
                            'Anything here what do u want abouth this product',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 12,
                            )),
                          ),
                         
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40,),
              Row(
                    children: [
                      Text(
                        'SELLERS',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.grey.shade500,
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                   Row(
                    children: [
                      Text(
                        'New',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.grey.shade900,
                                fontWeight: FontWeight.bold,
                                fontSize: 14)),
                      ),
                    ],
                  ),
               
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '₹ 2,728',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.red
                                ,
                                fontWeight: FontWeight.bold,
                                fontSize: 17)),
                      ),
                      Container(
                        height: 40,width: 90,
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(
                          child:Text(
                        'Add To Cart',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.black,
                               fontWeight: FontWeight.bold,
                                fontSize: 12)),
                      ),
                        ),
                      )
                    
                    ],
                  ),
                    SizedBox(height: 10,),
                  Row(
                   
                    children: [
                      Text(
                        '10% cash back upto ₹ 150. ',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.grey.shade700,
                               // fontWeight: FontWeight.bold,
                                fontSize: 13)),
                      ),
                     
                    Text(
                        'Details',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 13)),
                      ),
                    ],
                  ),
        
                   SizedBox(height: 10,),
                  Row(
                   
                    children: [
                        Text(
                        'FREE Delivery ',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 13)),
                      ),
                      Text(
                        'Saturday, May 22. ',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.grey.shade900,
                                fontWeight: FontWeight.bold,
                                fontSize: 13)),
                      ),
                     
                    Text(
                        'Details',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 13)),
                      ),
                    ],
                  ),
                     SizedBox(height: 20,),
                  Row(
                   
                    children: [
                      
                      Text(
                        'Ships from   ',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.grey.shade600,
                                //fontWeight: FontWeight.bold,
                                fontSize: 13)),
                      ),
                     
                    Text(
                        '    Vkreta',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 13)),
                      ),
                    ],
                  ),
                      SizedBox(height: 10,),
                  Row(
                   
                    children: [
                      
                      Text(
                        'Sold by        ',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.grey.shade600,
                                //fontWeight: FontWeight.bold,
                                fontSize: 13)),
                      ),
                     
                    Text(
                        '      Relief Pvt Ltd',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 13)),
                      ),
                    ],
                  ),
                  SizedBox(height: 0,),
                  Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 85,),
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
        
                  SizedBox(height: 0,),
                  Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 75,),
                      
                      Text(
                        '    60% positive order the last 6 months',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 13)),
                      ),
                   
                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //SizedBox(width: 75,),
                      Icon(Icons.expand_less,color: Colors.blue,size: 25,),
                      SizedBox(width: 5,),
                      Text(
                        'See less',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.blue,
                                //fontWeight: FontWeight.bold,
                                fontSize: 13)),
                      ),
                   
                    ],
                  ),
                  SizedBox(height: 15,),
                  Divider(
                    height: 1,
                    color: Colors.grey.shade500,
                  ),
                   SizedBox(
                    height: 10,
                  ),
                   Row(
                    children: [
                      Text(
                        'New',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.grey.shade900,
                                fontWeight: FontWeight.bold,
                                fontSize: 14)),
                      ),
                    ],
                  ),
                 
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '₹ 3,446',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 17)),
                      ),
                      Container(
                        height: 40,width: 90,
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(
                          child:Text(
                        'Add To Cart',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.black,
                               fontWeight: FontWeight.bold,
                                fontSize: 12)),
                      ),
                        ),
                      )
                    
                    ],
                  ),
                    SizedBox(height: 10,),
                  Row(
                   
                    children: [
                      Text(
                        '10% cash back upto ₹ 150. ',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.grey.shade700,
                               // fontWeight: FontWeight.bold,
                                fontSize: 13)),
                      ),
                     
                    Text(
                        'Details',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 13)),
                      ),
                    ],
                  ),
        
                   SizedBox(height: 10,),
                  Row(
                   
                    children: [
                        Text(
                        'FREE Delivery ',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 13)),
                      ),
                      Text(
                        'Saturday, May 22. ',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.grey.shade900,
                                fontWeight: FontWeight.bold,
                                fontSize: 13)),
                      ),
                     
                    Text(
                        'Details',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 13)),
                      ),
                    ],
                  ),
                     SizedBox(height: 20,),
                  Row(
                   
                    children: [
                      
                      Text(
                        'Ships from   ',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.grey.shade600,
                                //fontWeight: FontWeight.bold,
                                fontSize: 13)),
                      ),
                     
                    Text(
                        '    Vkreta',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 13)),
                      ),
                    ],
                  ),
                      SizedBox(height: 10,),
                  Row(
                   
                    children: [
                      
                      Text(
                        'Sold by        ',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.grey.shade600,
                                //fontWeight: FontWeight.bold,
                                fontSize: 13)),
                      ),
                     
                    Text(
                        '      Relief Pvt Ltd',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 13)),
                      ),
                    ],
                  ),
                  SizedBox(height: 0,),
                  Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 85,),
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
        
                  SizedBox(height: 0,),
                  Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 75,),
                      
                      Text(
                        '    60% positive order the last 6 months',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 13)),
                      ),
                   
                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //SizedBox(width: 75,),
                      Icon(Icons.expand_less,color: Colors.blue,size: 25,),
                      SizedBox(width: 5,),
                      Text(
                        'See less',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.blue,
                                //fontWeight: FontWeight.bold,
                                fontSize: 13)),
                      ),
                   
                    ],
                  ),
                  SizedBox(height: 15,),
                  Divider(
                    height: 1,
                    color: Colors.grey.shade500,
                  ),
                   SizedBox(
                  height: 10,
                ),
                 Row(
                  children: [
                    Text(
                      'New',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.grey.shade900,
                              fontWeight: FontWeight.bold,
                              fontSize: 14)),
                    ),
                  ],
                ),
                
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '₹ 4,646',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 17)),
                    ),
                    Container(
                      height: 40,width: 90,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(
                        child:Text(
                      'Add To Cart',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.black,
                             fontWeight: FontWeight.bold,
                              fontSize: 12)),
                    ),
                      ),
                    )
                  
                  ],
                ),
                  SizedBox(height: 10,),
                Row(
                 
                  children: [
                    Text(
                      '10% cash back upto ₹ 150. ',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.grey.shade700,
                             // fontWeight: FontWeight.bold,
                              fontSize: 13)),
                    ),
                   
                  Text(
                      'Details',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 13)),
                    ),
                  ],
                ),

                 SizedBox(height: 10,),
                Row(
                 
                  children: [
                      Text(
                      'FREE Delivery ',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 13)),
                    ),
                    Text(
                      'Saturday, May 22. ',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.grey.shade900,
                              fontWeight: FontWeight.bold,
                              fontSize: 13)),
                    ),
                   
                  Text(
                      'Details',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 13)),
                    ),
                  ],
                ),
                   SizedBox(height: 20,),
                Row(
                 
                  children: [
                    
                    Text(
                      'Ships from   ',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.grey.shade600,
                              //fontWeight: FontWeight.bold,
                              fontSize: 13)),
                    ),
                   
                  Text(
                      '    Vkreta',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 13)),
                    ),
                  ],
                ),
                    SizedBox(height: 10,),
                Row(
                 
                  children: [
                    
                    Text(
                      'Sold by        ',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.grey.shade600,
                              //fontWeight: FontWeight.bold,
                              fontSize: 13)),
                    ),
                   
                  Text(
                      '      Relief Pvt Ltd',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 13)),
                    ),
                  ],
                ),
                SizedBox(height: 0,),
                Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 85,),
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

                SizedBox(height: 0,),
                Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 75,),
                    
                    Text(
                      '    60% positive order the last 6 months',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 13)),
                    ),
                 
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //SizedBox(width: 75,),
                    Icon(Icons.expand_less,color: Colors.blue,size: 25,),
                    SizedBox(width: 5,),
                    Text(
                      'See less',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.blue,
                              //fontWeight: FontWeight.bold,
                              fontSize: 13)),
                    ),
                 
                  ],
                ),
                SizedBox(height: 15,),
                Divider(
                  height: 1,
                  color: Colors.grey.shade500,
                )
                  
                ],
              ),
            ),
          ),
        ));
  }
}
