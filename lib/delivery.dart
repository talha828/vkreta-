import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vkreta/changeaddress.dart';
import 'package:vkreta/payment.dart';

class Delivery extends StatefulWidget {
  const Delivery({ Key? key }) : super(key: key);

  @override
  State<Delivery> createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
                  }, icon: Icon(Icons.arrow_back,color:Colors.black,size:25)
              ),
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text(
          'Delivery',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 16)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children: [
                  Text(
          'Home Address',
          style: GoogleFonts.poppins(
                    textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 16,fontWeight: FontWeight.bold)),
        ),
        SizedBox(width: 10,),
        Container(
          height: 20,
          width: 60,
          decoration: BoxDecoration(
            color: Colors.blue.shade900,
            borderRadius:BorderRadius.circular(4)
          ),
          child: Center(
            child:  Text(
          'Default',
          style: GoogleFonts.poppins(
                    textStyle: TextStyle(color: Colors.white, fontSize: 11,)),
        ),
          ),
        )
                ],
              ),
            ),
            SizedBox(width: 10,),
                Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Text(
          'Akshay Kumar',
          style: GoogleFonts.poppins(
                    textStyle: TextStyle(color: Colors.grey.shade600, fontSize: 14,)),
        ),
      
                ],
              ),
            ),
              SizedBox(width: 5,),
                Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Text(
          '051 352673',
          style: GoogleFonts.poppins(
                    textStyle: TextStyle(color: Colors.grey.shade600, fontSize: 14,)),
        ),
      
                ],
              ),
            ),
              SizedBox(width: 5,),
                Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Text(
          '73726 Mumbai Road',
          style: GoogleFonts.poppins(
                    textStyle: TextStyle(color: Colors.grey.shade600, fontSize: 14,)),
        ),
      
                ],
              ),
            ),
             SizedBox(width: 5,),
                Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Text(
          'North Mumbai Beach',
          style: GoogleFonts.poppins(
                    textStyle: TextStyle(color: Colors.grey.shade600, fontSize: 14,)),
        ),
      
                ],
              ),
            ),
              SizedBox(width: 5,),
                Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Text(
          'INDIA',
          style: GoogleFonts.poppins(
                    textStyle: TextStyle(color: Colors.grey.shade600, fontSize: 14,)),
        ),
      
                ],
              ),
            ),
              SizedBox(width: 5,),
                Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
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
                          return ChanegAddress();
                        }));
                    },
                    child: Text(
                            'Change Address',
                            style: GoogleFonts.poppins(
                      textStyle: TextStyle(color: Colors.green, fontSize: 14,)),
                          ),
                  ),
      
                ],
              ),
            ),
            SizedBox(height:10),
            Container(
              height:10, width:MediaQuery.of(context).size.width,color:Colors.grey.shade100
            ),
              SizedBox(
                      height: 10,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                Text(
                  'Order List',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Colors.grey.shade900,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                ),
                        ],
                      ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: 110,
                    width:MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(

                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 110,
                          width: MediaQuery.of(context).size.width/3,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset('assets/shoes.png',fit: BoxFit.fill,),
                          ),
                        ),
                         Container(
                          height: 110,
                          width: MediaQuery.of(context).size.width/1.5,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                child: Text(
                  'Here is the title of your product that you are buying',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Colors.grey.shade900,
                          fontWeight: FontWeight.bold,
                          fontSize: 13)),
                ),
                              ),
                SizedBox(height: 0,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      Text(
                        '5 item  (200 gr)',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.grey.shade400,
                                
                                fontSize: 12)),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 0,),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal:8),
                   child: Row(
                    children: [
                      Text(
                        '₹ 100.50',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.grey.shade900,
                                fontWeight: FontWeight.bold,
                                fontSize: 14)),
                      ),
                    ],
                                 ),
                 ),
                 

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
                     color:Colors.grey.shade300
                   ),
                 ),
                  Container(
                    height: 110,
                    width:MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(

                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 110,
                          width: MediaQuery.of(context).size.width/3,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset('assets/camera.png',fit: BoxFit.fill,),
                          ),
                        ),
                         Container(
                          height: 110,
                          width: MediaQuery.of(context).size.width/1.5,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                child: Text(
                  'Here is the title of your product that you are buying',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Colors.grey.shade900,
                          fontWeight: FontWeight.bold,
                          fontSize: 13)),
                ),
                              ),
                SizedBox(height: 0,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      Text(
                        '5 item  (200 gr)',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.grey.shade400,
                                
                                fontSize: 12)),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 0,),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal:8),
                   child: Row(
                    children: [
                      Text(
                        '₹ 100.50',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.grey.shade900,
                                fontWeight: FontWeight.bold,
                                fontSize: 14)),
                      ),
                    ],
                                 ),
                 ),
                 

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
                     color:Colors.grey.shade300
                   ),
                 ),
                  Container(
                    height: 110,
                    width:MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(

                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 110,
                          width: MediaQuery.of(context).size.width/3,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset('assets/shirt.png',fit: BoxFit.fill,),
                          ),
                        ),
                         Container(
                          height: 110,
                          width: MediaQuery.of(context).size.width/1.5,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                child: Text(
                  'Here is the title of your product that you are buying',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Colors.grey.shade900,
                          fontWeight: FontWeight.bold,
                          fontSize: 13)),
                ),
                              ),
                SizedBox(height: 0,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      Text(
                        '5 item  (200 gr)',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.grey.shade400,
                                
                                fontSize: 12)),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 0,),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal:8),
                   child: Row(
                    children: [
                      Text(
                        '₹ 100.50',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.grey.shade900,
                                fontWeight: FontWeight.bold,
                                fontSize: 14)),
                      ),
                    ],
                                 ),
                 ),
                 

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
                     color:Colors.grey.shade300
                   ),
                 ),
                  Container(
                    height: 110,
                    width:MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(

                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 110,
                          width: MediaQuery.of(context).size.width/3,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset('assets/bag.png',fit: BoxFit.fill,),
                          ),
                        ),
                         Container(
                          height: 110,
                          width: MediaQuery.of(context).size.width/1.5,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                child: Text(
                  'Here is the title of your product that you are buying',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Colors.grey.shade900,
                          fontWeight: FontWeight.bold,
                          fontSize: 13)),
                ),
                              ),
                SizedBox(height: 0,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      Text(
                        '5 item  (200 gr)',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.grey.shade400,
                                
                                fontSize: 12)),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 0,),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal:8),
                   child: Row(
                    children: [
                      Text(
                        '₹ 100.50',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.grey.shade900,
                                fontWeight: FontWeight.bold,
                                fontSize: 14)),
                      ),
                    ],
                                 ),
                 ),
                 

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
                     color:Colors.grey.shade300
                   ),
                 ),
                 SizedBox(height: 10,),
                  Container(
              height: 10,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.grey.shade100
              ),
            ),
            Container(
              height: 130,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap:(){
                        showModalBottomSheet(
                            enableDrag: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)
                      )
                    ),
                          context: context, 
                          builder:(context)=>Container(
                            height:MediaQuery.of(context).size.height,
                            width:MediaQuery.of(context).size.width,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  SizedBox(height:20),
                                                      Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                                  child: Row(
                                                    children: [
                                            Text(
                                              'Choose Courier',
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                              color: Colors.grey.shade900,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                                            ),
                                                    ],
                                                  ),
                                              ),
                                              SizedBox(height: 20,),
                                              Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                                  child: Row(
                                                    children: [
                                            Text(
                                              'DHL',
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                              color: Colors.grey.shade800,
                              fontWeight: FontWeight.bold,
                              fontSize: 15)),
                                            ),
                                                    ],
                                                  ),
                                              ),
                                               SizedBox(height: 10,),
                                              Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                                  child: Row(
                                                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                                    children: [
                                            Text(
                                              'Regular',
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                              color: Colors.grey.shade700,
                              
                              fontSize: 14)),
                                            ),
                                             Text(
                                              '₹ 150',
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                              color: Colors.grey.shade700,
                              
                              fontSize: 14)),
                                            ),
                                                    ],
                                                  ),
                                              ),
                                               SizedBox(height: 7,),
                                              Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                                  child: Row(
                                                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                                    children: [
                                            Text(
                                              'Express',
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                              color: Colors.grey.shade700,
                              
                              fontSize: 14)),
                                            ),
                                             Text(
                                              '₹ 70',
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                              color: Colors.grey.shade700,
                              
                              fontSize: 14)),
                                            ),
                                                    ],
                                                  ),
                                              ),
                                              SizedBox(height:10),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal:20),
                                                child: Divider(
                                                  height:1,
                                                  color:Colors.grey.shade300
                                                ),
                                              ),
                                                SizedBox(height: 20,),
                                              Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                                  child: Row(
                                                    children: [
                                            Text(
                                              'FedEx',
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                              color: Colors.grey.shade800,
                              fontWeight: FontWeight.bold,
                              fontSize: 15)),
                                            ),
                                                    ],
                                                  ),
                                              ),
                                               SizedBox(height: 10,),
                                              Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                                  child: Row(
                                                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                                    children: [
                                            Text(
                                              'Regular',
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                              color: Colors.grey.shade700,
                              
                              fontSize: 14)),
                                            ),
                                             Text(
                                              '₹ 100',
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                              color: Colors.grey.shade700,
                              
                              fontSize: 14)),
                                            ),
                                                    ],
                                                  ),
                                              ),
                                               SizedBox(height: 7,),
                                              Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                                  child: Row(
                                                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                                    children: [
                                            Text(
                                              'Express',
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                              color: Colors.grey.shade700,
                              
                              fontSize: 14)),
                                            ),
                                             Text(
                                              '₹ 50',
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                              color: Colors.grey.shade700,
                              
                              fontSize: 14)),
                                            ),
                                                    ],
                                                  ),
                                              ),
                                              SizedBox(height:10),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal:20),
                                                child: Divider(
                                                  height:1,
                                                  color:Colors.grey.shade300
                                                ),
                                              ),
                                                SizedBox(height: 20,),
                                              Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                                  child: Row(
                                                    children: [
                                            Text(
                                              'Other 1',
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                              color: Colors.grey.shade800,
                              fontWeight: FontWeight.bold,
                              fontSize: 15)),
                                            ),
                                                    ],
                                                  ),
                                              ),
                                               SizedBox(height: 10,),
                                              Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                                  child: Row(
                                                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                                    children: [
                                            Text(
                                              'Regular',
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                              color: Colors.grey.shade700,
                              
                              fontSize: 14)),
                                            ),
                                             Text(
                                              '₹ 60',
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                              color: Colors.grey.shade700,
                              
                              fontSize: 14)),
                                            ),
                                                    ],
                                                  ),
                                              ),
                                               SizedBox(height: 7,),
                                              Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                                  child: Row(
                                                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                                    children: [
                                            Text(
                                              'Express',
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                              color: Colors.grey.shade700,
                              
                              fontSize: 14)),
                                            ),
                                             Text(
                                              '₹ 20',
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                              color: Colors.grey.shade700,
                              
                              fontSize: 14)),
                                            ),
                                                    ],
                                                  ),
                                              ),
                                              SizedBox(height:10),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal:20),
                                                child: Divider(
                                                  height:1,
                                                  color:Colors.grey.shade300
                                                ),
                                              ),
                                                SizedBox(height: 20,),
                                              Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                                  child: Row(
                                                    children: [
                                            Text(
                                              'Other 2',
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                              color: Colors.grey.shade800,
                              fontWeight: FontWeight.bold,
                              fontSize: 15)),
                                            ),
                                                    ],
                                                  ),
                                              ),
                                               SizedBox(height: 10,),
                                              Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                                  child: Row(
                                                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                                    children: [
                                            Text(
                                              'Regular',
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                              color: Colors.grey.shade700,
                              
                              fontSize: 14)),
                                            ),
                                             Text(
                                              '₹ 150',
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                              color: Colors.grey.shade700,
                              
                              fontSize: 14)),
                                            ),
                                                    ],
                                                  ),
                                              ),
                                               SizedBox(height: 7,),
                                              Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                                  child: Row(
                                                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                                    children: [
                                            Text(
                                              'Express',
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                              color: Colors.grey.shade700,
                              
                              fontSize: 14)),
                                            ),
                                             Text(
                                              '₹ 70',
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                              color: Colors.grey.shade700,
                              
                              fontSize: 14)),
                                            ),
                                                    ],
                                                  ),
                                              ),
                                              SizedBox(height:10),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal:20),
                                                child: Divider(
                                                  height:1,
                                                  color:Colors.grey.shade300
                                                ),
                                              )
                                ],
                              ),
                            ),
                          )
                          );
                      },
                      child: Container(
                        height: 40,
                        width:MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [BoxShadow(
                            color: Colors.grey.shade300,spreadRadius: 1
                          )],
                          borderRadius: 
                          BorderRadius.circular(10)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.local_shipping,color: Colors.blue.shade900,size: 25),
                                  SizedBox(width: 10,),
                                  Text(
                                      'Choose delivery',
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              color: Colors.grey.shade600,
                                              
                                              fontSize: 14)),
                                    ),
                                ],
                              ),
                    
                              IconButton(onPressed: (){
                    
                              }, icon: Icon(Icons.arrow_forward_ios,color: Colors.grey.shade400,size: 15,)
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
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
                                          'Sub Total',
                                          style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14)),
                                        ),
                                ],
                              ),
                                    SizedBox(height: 2,),
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
                          return Payment();
                        }));
                          },
                          child: Container(height: 37,
                          
                          width: 90,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(4)
                          ),
                          child: Center(
                            child: Text(
                                        'Pay',
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
            SizedBox(height:30),

          ],
        ),
      ),
    );
  }
}