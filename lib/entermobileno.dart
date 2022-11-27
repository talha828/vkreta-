import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vkreta/enterotp.dart';

class EnterMobileNo extends StatefulWidget {
  String t;
  EnterMobileNo({
required this.t,
  });

  @override
  State<EnterMobileNo> createState() => _EnterMobileNoState();
}

class _EnterMobileNoState extends State<EnterMobileNo> {
   final TextEditingController _mobileno=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 60,
                      width: 140,
                      child: Image.asset('assets/logo.png',fit: BoxFit.fill,color: Colors.blue.shade900),
                    ),
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height/3,
                  width: MediaQuery.of(context).size.width/1.5,
                  child: Image.asset('assets/no.png',fit: BoxFit.cover,),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Enter your mobile number to',style:  GoogleFonts.poppins(
                      textStyle:TextStyle(
                        color:Colors.black,fontWeight: FontWeight.bold,fontSize: 18
                      )
                    ),),
                   
      
                  ],
                ),
                 SizedBox(height: 5,),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('continue',style:  GoogleFonts.poppins(
                      textStyle:TextStyle(
                        color:Colors.black,fontWeight: FontWeight.bold,fontSize: 18
                      )
                    ),),
                   
      
                  ],
                ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('+91 ',style:  GoogleFonts.poppins(
                      textStyle:TextStyle(
                        color:Colors.blue.shade900,fontSize: 18
                      )
                    ),),
                    SizedBox(width: 10,),
                    Expanded(child: 
                    TextFormField(
                  controller: _mobileno,
                decoration: InputDecoration(
                  //prefixIcon: Icon(Icons.mail,size: 23,),
                  hintText: 'Number',
                  hintStyle: GoogleFonts.poppins(
                    textStyle:TextStyle(
                      color:Colors.grey.shade600,
                       fontSize: 14
            )
                  )
                ),
                ),)
                    ],
                ),
                SizedBox(height: 50,),
                 InkWell(
                   onTap: (){
                      Navigator.of(context).pushReplacement(PageRouteBuilder(
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
                            return EnterOtp(
                              no: _mobileno.text,
                              t: widget.t,
                            );
                          }));
                   },
                   child: Container(
                               height: 45,
                               width: MediaQuery.of(context).size.width,
                               decoration: BoxDecoration(
                    color: Colors.blue.shade900,
                    borderRadius: BorderRadius.circular(100),
                               ),
                               child: Center(
                    child: Text('Continue',style: GoogleFonts.poppins(
                      textStyle:TextStyle(
                        color:Colors.white,fontWeight: FontWeight.bold,fontSize: 15
                      )
                    ),),
                               ),
                             ),
                 ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}