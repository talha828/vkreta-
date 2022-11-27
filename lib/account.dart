import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vkreta/about.dart';
import 'package:vkreta/allnotifications.dart';
import 'package:vkreta/changepassword.dart';
import 'package:vkreta/contactus.dart';
import 'package:vkreta/modifyyouraddress.dart';
import 'package:vkreta/notifications.dart';
import 'package:vkreta/paymentmethod.dart';
import 'package:vkreta/privacypolicy.dart';
import 'package:vkreta/profilechange.dart';
import 'package:vkreta/reviewproduct.dart';
import 'package:vkreta/termandconditions.dart';
import 'package:vkreta/vieworderhistory.dart';

class Account extends StatefulWidget {
  const Account({ Key? key }) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
     appBar: AppBar(
       backgroundColor: Colors.white,
       elevation: 0.1,
       title:  Text(
                        'My Account',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.grey.shade900, fontSize: 17)),
                      ),
                      actions: [
                        
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
   body:SingleChildScrollView(
     child: Column(
       children: [
         SizedBox(height: 20,),
      ListTile(
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
                            return ProfileChange();
                          }));
        },
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.asset('assets/cr7.jpg',fit: BoxFit.fill,)),
        subtitle: Text(
                          'A Great Footballer',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.grey.shade500, fontSize: 15,
                                 
                                  )),
                        ),
        title: Text(
                          'Christiano Ronaldo',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.grey.shade900, fontSize: 17,
                                  fontWeight: FontWeight.bold
                                  )),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,color: Colors.grey.shade500,size: 16,
                        ),
      ),
      SizedBox(height: 20,),
      ListTile(
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
                          return ChangePassword();
                        }));
        },
        trailing: Icon(
                          Icons.arrow_forward_ios,color: Colors.grey.shade500,size: 16,
                        ),
        title: Text(
                          'Change Password',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.grey.shade700, fontSize: 14,
                                 
                                  )),
                        ),
      ),
       Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20),
               child: Divider(
                height: 1,
                color: Colors.grey.shade400,
            ),
             ),
       ListTile(
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
                          return ModifyYourAddress();
                        }));
         },
        trailing: Icon(
                          Icons.arrow_forward_ios,color: Colors.grey.shade500,size: 16,
                        ),
        title: Text(
                          'Modify your Address Book Entries',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.grey.shade700, fontSize: 14,
                                 
                                  )),
                        ),
      ),
       Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20),
               child: Divider(
                height: 1,
                color: Colors.grey.shade400,
            ),
             ),
       ListTile(
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
                          return PaymentMethod();
                        }));
         },
        trailing: Icon(
                          Icons.arrow_forward_ios,color: Colors.grey.shade500,size: 16,
                        ),
        title: Text(
                          'Payment Method',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.grey.shade700, fontSize: 14,
                                 
                                  )),
                        ),
      ),
      Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20),
               child: Divider(
                height: 1,
                color: Colors.grey.shade400,
            ),
             ),
     
       ListTile(
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
                          return ViewOrderHistory();
                        }));
         },
        trailing: Icon(
                          Icons.arrow_forward_ios,color: Colors.grey.shade500,size: 16,
                        ),
        title: Text(
                          'View your Order History',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.grey.shade700, fontSize: 14,
                                 
                                  )),
                        ),
      ),
       Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20),
               child: Divider(
                height: 1,
                color: Colors.grey.shade400,
            ),
             ),
       ListTile(
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
                          return Notifications();
                        }));
         },
        trailing: Icon(
                          Icons.arrow_forward_ios,color: Colors.grey.shade500,size: 16,
                        ),
        title: Text(
                          'Notifications',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.grey.shade700, fontSize: 14,
                                 
                                  )),
                        ),
      ),
       Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20),
               child: Divider(
                height: 1,
                color: Colors.grey.shade400,
            ),
             ),
       ListTile(
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
                          return ReviewProduct();
                        }));
         },
        trailing: Icon(
                          Icons.arrow_forward_ios,color: Colors.grey.shade500,size: 16,
                        ),
        title: Text(
                          'Review Product',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.grey.shade700, fontSize: 14,
                                 
                                  )),
                        ),
      ),
       Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20),
               child: Divider(
                height: 1,
                color: Colors.grey.shade400,
            ),
             ),
     
       
     
       ListTile(
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
                            return About();
                          }));
         },
        trailing: Icon(
                          Icons.arrow_forward_ios,color: Colors.grey.shade500,size: 16,
                        ),
        title: Text(
                          'About',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.grey.shade700, fontSize: 14,
                                 
                                  )),
                        ),
      ),
      Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20),
               child: Divider(
                height: 1,
                color: Colors.grey.shade400,
            ),
             ),
       ListTile(
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
                            return Contactus();
                          }));
         },
        trailing: Icon(
                          Icons.arrow_forward_ios,color: Colors.grey.shade500,size: 16,
                        ),
        title: Text(
                          'Contact Us',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.grey.shade700, fontSize: 15,
                                 
                                  )),
                        ),
      ),
       Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20),
               child: Divider(
                height: 1,
                color: Colors.grey.shade400,
            ),
             ),
       ListTile(
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
                            return TC();
                          }));
         },
        trailing: Icon(
                          Icons.arrow_forward_ios,color: Colors.grey.shade500,size: 16,
                        ),
        title: Text(
                          'Terms and Conditions',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.grey.shade700, fontSize: 15,
                                 
                                  )),
                        ),
      ),
       Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20),
               child: Divider(
                height: 1,
                color: Colors.grey.shade400,
            ),
             ),
       ListTile(
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
                            return PP();
                          }));
         },
        trailing: Icon(
                          Icons.arrow_forward_ios,color: Colors.grey.shade500,size: 16,
                        ),
        title: Text(
                          'Privacy Policy',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.grey.shade700, fontSize: 15,
                                 
                                  )),
                        ),
      ),
       Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20),
               child: Divider(
                height: 1,
                color: Colors.grey.shade400,
            ),
             ),
             Container(
               height: 50,
               width: MediaQuery.of(context).size.width,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.logout,color: Colors.red,size: 20,),
                    SizedBox(width: 10,),
                    Text(
                                'Sign Out',
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Colors.red, fontSize: 15,
                                       
                                        )),
                              ),
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
       ],
     ),
   ) ,
    );
  }
}