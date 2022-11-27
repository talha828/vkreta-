import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vkreta/addaddress.dart';
import 'package:vkreta/editaddress.dart';

class ModifyYourAddress extends StatefulWidget {
  const ModifyYourAddress({Key? key}) : super(key: key);

  @override
  State<ModifyYourAddress> createState() => _ModifyYourAddressState();
}

class _ModifyYourAddressState extends State<ModifyYourAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
       appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back, color: Colors.black, size: 25)),
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text(
          'Set Address',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 16)),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(onPressed:(){
 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddAddress()));
            }, icon:  Icon(Icons.add,color:Colors.blue.shade900,size: 30,)
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
              Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 210,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [BoxShadow(
                    color: Colors.grey.shade300,
                    spreadRadius: 3,blurRadius: 5
                  )]
                ),
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Home Address',style: GoogleFonts.poppins(
                            textStyle:TextStyle(
                              color: Colors.grey.shade900,
                              fontWeight: FontWeight.bold,
                              fontSize: 15
                            )
                          ),),
                          Container(
                            height: 20,width: 60,decoration: BoxDecoration(
                              color: Colors.blue.shade900,borderRadius: BorderRadius.circular(4)
                            ),
                            child: Center(
                              child: Text('Default',style: GoogleFonts.poppins(
                                textStyle:TextStyle(
                                  color: Colors.white,
                                
                                  fontSize: 12
                                )
                              ),),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15,),
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 20),
                         child: Row(
                           children: [
                             Text('Akshay Kumar',style: GoogleFonts.poppins(
                                  textStyle:TextStyle(
                                    color: Colors.grey.shade900,
                                    
                                    fontSize: 14
                                  )
                                ),),
                           ],
                         ),
                       ),
                         SizedBox(height: 5,),
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 20),
                         child: Row(
                           children: [
                             Text('051 352673',style: GoogleFonts.poppins(
                                  textStyle:TextStyle(
                                    color: Colors.grey.shade900,
                                    
                                    fontSize: 14
                                  )
                                ),),
                           ],
                         ),
                       ),
                        SizedBox(height: 5,),
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 20),
                         child: Row(
                           children: [
                             Text('73726 Mumbai Road',style: GoogleFonts.poppins(
                                  textStyle:TextStyle(
                                    color: Colors.grey.shade900,
                                    
                                    fontSize: 14
                                  )
                                ),),
                           ],
                         ),
                       ),
                         SizedBox(height: 5,),
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 20),
                         child: Row(
                           children: [
                             Text('North Mumbai Beach',style: GoogleFonts.poppins(
                                  textStyle:TextStyle(
                                    color: Colors.grey.shade900,
                                    
                                    fontSize: 14
                                  )
                                ),),
                           ],
                         ),
                       ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                           children: [
                             Text('India',style: GoogleFonts.poppins(
                                  textStyle:TextStyle(
                                    color: Colors.grey.shade900,
                                    
                                    fontSize: 14
                                  )
                                ),),
                           ],
                       ),
                        ),
                        SizedBox(height: 5,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
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
                          return EditAddress();
                        }));
                               },
                               child: Text('Edit',style: GoogleFonts.poppins(
                                      textStyle:TextStyle(
                                        color: Colors.blue.shade900,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13
                                      )
                                    ),),
                             ),
                                  SizedBox(width: 10,),
                                   Text('Delete',style: GoogleFonts.poppins(
                                    textStyle:TextStyle(
                                      color: Colors.blue.shade900,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13
                                    )
                                  ),),
                            ],
                          ),
                        )
      
                  ],
                ),
              ),
            ),
             SizedBox(height: 10,),
              Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 210,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [BoxShadow(
                    color: Colors.grey.shade300,
                    spreadRadius: 3,blurRadius: 5
                  )]
                ),
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Home Address',style: GoogleFonts.poppins(
                            textStyle:TextStyle(
                              color: Colors.grey.shade900,
                              fontWeight: FontWeight.bold,
                              fontSize: 15
                            )
                          ),),
                         
                        ],
                      ),
                    ),
                    SizedBox(height: 15,),
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 20),
                         child: Row(
                           children: [
                             Text('Akshay Kumar',style: GoogleFonts.poppins(
                                  textStyle:TextStyle(
                                    color: Colors.grey.shade900,
                                    
                                    fontSize: 14
                                  )
                                ),),
                           ],
                         ),
                       ),
                         SizedBox(height: 5,),
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 20),
                         child: Row(
                           children: [
                             Text('051 352673',style: GoogleFonts.poppins(
                                  textStyle:TextStyle(
                                    color: Colors.grey.shade900,
                                    
                                    fontSize: 14
                                  )
                                ),),
                           ],
                         ),
                       ),
                        SizedBox(height: 5,),
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 20),
                         child: Row(
                           children: [
                             Text('73726 Mumbai Road',style: GoogleFonts.poppins(
                                  textStyle:TextStyle(
                                    color: Colors.grey.shade900,
                                    
                                    fontSize: 14
                                  )
                                ),),
                           ],
                         ),
                       ),
                         SizedBox(height: 5,),
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 20),
                         child: Row(
                           children: [
                             Text('North Mumbai Beach',style: GoogleFonts.poppins(
                                  textStyle:TextStyle(
                                    color: Colors.grey.shade900,
                                    
                                    fontSize: 14
                                  )
                                ),),
                           ],
                         ),
                       ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                           children: [
                             Text('India',style: GoogleFonts.poppins(
                                  textStyle:TextStyle(
                                    color: Colors.grey.shade900,
                                    
                                    fontSize: 14
                                  )
                                ),),
                           ],
                       ),
                        ),
                        SizedBox(height: 5,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                               
                                   Text('MakeDefault',style: GoogleFonts.poppins(
                                    textStyle:TextStyle(
                                      color: Colors.blue.shade900,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13
                                    )
                                  ),),
                                  SizedBox(width: 10,),
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
                          return EditAddress();
                        }));
                               },
                               child: Text('Edit',style: GoogleFonts.poppins(
                                      textStyle:TextStyle(
                                        color: Colors.blue.shade900,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13
                                      )
                                    ),),
                             ),
                                  SizedBox(width: 10,),
                                   Text('Delete',style: GoogleFonts.poppins(
                                    textStyle:TextStyle(
                                      color: Colors.blue.shade900,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13
                                    )
                                  ),),
                            ],
                          ),
                        )
      
                  ],
                ),
              ),
            ),
              SizedBox(height: 10,),
              Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 210,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [BoxShadow(
                    color: Colors.grey.shade300,
                    spreadRadius: 3,blurRadius: 5
                  )]
                ),
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Home Address',style: GoogleFonts.poppins(
                            textStyle:TextStyle(
                              color: Colors.grey.shade900,
                              fontWeight: FontWeight.bold,
                              fontSize: 15
                            )
                          ),),
                         
                        ],
                      ),
                    ),
                    SizedBox(height: 15,),
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 20),
                         child: Row(
                           children: [
                             Text('Akshay Kumar',style: GoogleFonts.poppins(
                                  textStyle:TextStyle(
                                    color: Colors.grey.shade900,
                                    
                                    fontSize: 14
                                  )
                                ),),
                           ],
                         ),
                       ),
                         SizedBox(height: 5,),
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 20),
                         child: Row(
                           children: [
                             Text('051 352673',style: GoogleFonts.poppins(
                                  textStyle:TextStyle(
                                    color: Colors.grey.shade900,
                                    
                                    fontSize: 14
                                  )
                                ),),
                           ],
                         ),
                       ),
                        SizedBox(height: 5,),
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 20),
                         child: Row(
                           children: [
                             Text('73726 Mumbai Road',style: GoogleFonts.poppins(
                                  textStyle:TextStyle(
                                    color: Colors.grey.shade900,
                                    
                                    fontSize: 14
                                  )
                                ),),
                           ],
                         ),
                       ),
                         SizedBox(height: 5,),
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 20),
                         child: Row(
                           children: [
                             Text('North Mumbai Beach',style: GoogleFonts.poppins(
                                  textStyle:TextStyle(
                                    color: Colors.grey.shade900,
                                    
                                    fontSize: 14
                                  )
                                ),),
                           ],
                         ),
                       ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                           children: [
                             Text('India',style: GoogleFonts.poppins(
                                  textStyle:TextStyle(
                                    color: Colors.grey.shade900,
                                    
                                    fontSize: 14
                                  )
                                ),),
                           ],
                       ),
                        ),
                        SizedBox(height: 5,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                               
                                   Text('MakeDefault',style: GoogleFonts.poppins(
                                    textStyle:TextStyle(
                                      color: Colors.blue.shade900,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13
                                    )
                                  ),),
                                  SizedBox(width: 10,),
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
                          return EditAddress();
                        }));
                               },
                               child: Text('Edit',style: GoogleFonts.poppins(
                                      textStyle:TextStyle(
                                        color: Colors.blue.shade900,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13
                                      )
                                    ),),
                             ),
                                  SizedBox(width: 10,),
                                   Text('Delete',style: GoogleFonts.poppins(
                                    textStyle:TextStyle(
                                      color: Colors.blue.shade900,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13
                                    )
                                  ),),
                            ],
                          ),
                        )
      
                  ],
                ),
              ),
            ),
              SizedBox(height: 10,),
              Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 210,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [BoxShadow(
                    color: Colors.grey.shade300,
                    spreadRadius: 3,blurRadius: 5
                  )]
                ),
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Home Address',style: GoogleFonts.poppins(
                            textStyle:TextStyle(
                              color: Colors.grey.shade900,
                              fontWeight: FontWeight.bold,
                              fontSize: 15
                            )
                          ),),
                         
                        ],
                      ),
                    ),
                    SizedBox(height: 15,),
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 20),
                         child: Row(
                           children: [
                             Text('Akshay Kumar',style: GoogleFonts.poppins(
                                  textStyle:TextStyle(
                                    color: Colors.grey.shade900,
                                    
                                    fontSize: 14
                                  )
                                ),),
                           ],
                         ),
                       ),
                         SizedBox(height: 5,),
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 20),
                         child: Row(
                           children: [
                             Text('051 352673',style: GoogleFonts.poppins(
                                  textStyle:TextStyle(
                                    color: Colors.grey.shade900,
                                    
                                    fontSize: 14
                                  )
                                ),),
                           ],
                         ),
                       ),
                        SizedBox(height: 5,),
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 20),
                         child: Row(
                           children: [
                             Text('73726 Mumbai Road',style: GoogleFonts.poppins(
                                  textStyle:TextStyle(
                                    color: Colors.grey.shade900,
                                    
                                    fontSize: 14
                                  )
                                ),),
                           ],
                         ),
                       ),
                         SizedBox(height: 5,),
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 20),
                         child: Row(
                           children: [
                             Text('North Mumbai Beach',style: GoogleFonts.poppins(
                                  textStyle:TextStyle(
                                    color: Colors.grey.shade900,
                                    
                                    fontSize: 14
                                  )
                                ),),
                           ],
                         ),
                       ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                           children: [
                             Text('India',style: GoogleFonts.poppins(
                                  textStyle:TextStyle(
                                    color: Colors.grey.shade900,
                                    
                                    fontSize: 14
                                  )
                                ),),
                           ],
                       ),
                        ),
                        SizedBox(height: 5,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                               
                                   Text('MakeDefault',style: GoogleFonts.poppins(
                                    textStyle:TextStyle(
                                      color: Colors.blue.shade900,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13
                                    )
                                  ),),
                                  SizedBox(width: 10,),
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
                          return EditAddress();
                        }));
                               },
                               child: Text('Edit',style: GoogleFonts.poppins(
                                      textStyle:TextStyle(
                                        color: Colors.blue.shade900,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13
                                      )
                                    ),),
                             ),
                                  SizedBox(width: 10,),
                                   Text('Delete',style: GoogleFonts.poppins(
                                    textStyle:TextStyle(
                                      color: Colors.blue.shade900,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13
                                    )
                                  ),),
                            ],
                          ),
                        )
      
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}