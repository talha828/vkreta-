import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vkreta/productdisplay.dart';

class ViewAll extends StatefulWidget {
  String title;
 ViewAll({
required this.title,
 });

  @override
  State<ViewAll> createState() => _ViewAllState();
}

class _ViewAllState extends State<ViewAll> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       toolbarHeight:70,
      elevation: 0,
       actions: [
         
        
          Column(
            children: [
              PopupMenuButton(
                icon: Icon(
                   FontAwesomeIcons.filter,
               color: Colors.black,
                  size: 18,
                ),
                itemBuilder: (context) => [
                  PopupMenuItem(
                      child: Column(
                    children: [
                         Row(
                           children: [
                             GestureDetector(
                               child: Text('Price',
                               style: GoogleFonts.poppins(
                                 textStyle:TextStyle(
                                   color:Colors.black,
                                   fontSize: 15
                                 )
                               ),),
                             ),
                           ],
                         ),
                         SizedBox(height: 15,),
                         Divider(
                           height: 1,color: Colors.grey.shade500,
                         ),
                         SizedBox(height: 15,),
                          Row(
                            children: [
                              GestureDetector(
                               child: Text('Brands',
                               style: GoogleFonts.poppins(
                                 textStyle:TextStyle(
                                   color:Colors.black,
                                   fontSize: 15
                                 )
                               ),),
                         ),
                            ],
                          ),
                          SizedBox(height: 15,),
                         Divider(
                           height: 1,color: Colors.grey.shade500,
                         ),
                         SizedBox(height: 15,),
                          Row(
                            children: [
                              GestureDetector(
                               child: Text('Discounts',
                               style: GoogleFonts.poppins(
                                 textStyle:TextStyle(
                                   color:Colors.black,
                                   fontSize: 15
                                 )
                               ),),
                         ),
                            ],
                          ),
                          SizedBox(height: 15,),
                         Divider(
                           height: 1,color: Colors.grey.shade500,
                         ),
                         SizedBox(height: 15,),
                          Row(
                            children: [
                              GestureDetector(
                               child: Text('Attributes difference of same',
                               style: GoogleFonts.poppins(
                                 textStyle:TextStyle(
                                   color:Colors.black,
                                   fontSize: 15
                                 )
                               ),),
                         ),
                            ],
                          ),
                           SizedBox(height: 15,),
                         Divider(
                           height: 1,color: Colors.grey.shade500,
                         ),
                         SizedBox(height: 15,),
                          Row(
                            children: [
                              GestureDetector(
                               child: Text('Category',
                               style: GoogleFonts.poppins(
                                 textStyle:TextStyle(
                                   color:Colors.black,
                                   fontSize: 15
                                 )
                               ),),
                         ),
                            ],
                          ),
                         // SizedBox(height: 5,),
                          

                   
                 
                    ],
                  ))
                ],
              ),
              Text('Filter',
                             style: GoogleFonts.poppins(
                               textStyle:TextStyle(
                                 color:Colors.black,
                                 fontSize: 12
                               )
                             ),),
            ],
          ),
         // SizedBox(width:10),
         
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: PopupMenuButton(
                  icon: Icon(
                    Icons.format_line_spacing,
                    color: Colors.black,
                    size: 25,
                  ),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                        child: Column(
                      children: [
                           Row(
                             children: [
                               GestureDetector(
                                 child: Text('Low to High Price',
                                 style: GoogleFonts.poppins(
                                   textStyle:TextStyle(
                                     color:Colors.black,
                                     fontSize: 15
                                   )
                                 ),),
                               ),
                             ],
                           ),
                           SizedBox(height: 15,),
                           Divider(
                             height: 1,color: Colors.grey.shade500,
                           ),
                           SizedBox(height: 15,),
                            Row(
                              children: [
                                GestureDetector(
                                 child: Text('High to Low Price',
                                 style: GoogleFonts.poppins(
                                   textStyle:TextStyle(
                                     color:Colors.black,
                                     fontSize: 15
                                   )
                                 ),),
                           ),
                              ],
                            ),
                            SizedBox(height: 15,),
                           Divider(
                             height: 1,color: Colors.grey.shade500,
                           ),
                           SizedBox(height: 15,),
                            Row(
                              children: [
                                GestureDetector(
                                 child: Text('Customer Rating',
                                 style: GoogleFonts.poppins(
                                   textStyle:TextStyle(
                                     color:Colors.black,
                                     fontSize: 15
                                   )
                                 ),),
                           ),
                              ],
                            ),
                            SizedBox(height: 15,),
                           Divider(
                             height: 1,color: Colors.grey.shade500,
                           ),
                           SizedBox(height: 15,),
                            Row(
                              children: [
                                GestureDetector(
                                 child: Text('Discount',
                                 style: GoogleFonts.poppins(
                                   textStyle:TextStyle(
                                     color:Colors.black,
                                     fontSize: 15
                                   )
                                 ),),
                           ),
                              ],
                            ),
                             SizedBox(height: 15,),
                           Divider(
                             height: 1,color: Colors.grey.shade500,
                           ),
                           SizedBox(height: 15,),
                            Row(
                              children: [
                                GestureDetector(
                                 child: Text('Popularity',
                                 style: GoogleFonts.poppins(
                                   textStyle:TextStyle(
                                     color:Colors.black,
                                     fontSize: 15
                                   )
                                 ),),
                           ),
                              ],
                            )

                     
                   
                      ],
                    ))
                  ],
                ),
              ),
              Text('Sort',
                             style: GoogleFonts.poppins(
                               textStyle:TextStyle(
                                 color:Colors.black,
                                 fontSize: 12
                               )
                             ),),
            ],
          ),
       ],
       backgroundColor: Colors.white,
       title: Text(
         widget.title,
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold)),
        ),
       leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 25,
            )),
     ),
     backgroundColor: Colors.white,
     body: SingleChildScrollView(
       child: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 5),
         child: Column(
           children: [
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
                        padding: const EdgeInsets.symmetric(horizontal: 0),
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
                                      color: Colors.grey.shade600, fontSize: 14))),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Divider(
                    height: 1,
                    color: Colors.grey.shade400,
                  ),
                   SizedBox(height: 20,),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 35),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
               ],
             ),
           ),
           SizedBox(height: 10,),
            Padding(
             padding: const EdgeInsets.symmetric(horizontal: 35),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
               ],
             ),
           ),
           SizedBox(height: 10,),
            Padding(
             padding: const EdgeInsets.symmetric(horizontal: 35),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
               ],
             ),
           ),
           SizedBox(height:10),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 35),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
               ],
             ),
           ),
                      
           ],
         ),
       ),
     ),
   );
    
  }
}