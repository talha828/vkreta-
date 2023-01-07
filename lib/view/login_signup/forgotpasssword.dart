import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vkreta/view/login_signup/login.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({ Key? key }) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _email=TextEditingController();
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text('Forgot Password',style: GoogleFonts.poppins(
            textStyle: TextStyle(
              color: Colors.blue.shade900,fontWeight: FontWeight.bold,fontSize: width * 0.05
            )
          ),),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.06),
        child: Column(
          children: [
        SizedBox(height: width * 0.1,),
        Container(
          height: 60,
          width: MediaQuery.of(context).size.width,
          child:Text('Enter the e-mail address associated with your account. Click submit to have a password reset link emailed to you',style: GoogleFonts.poppins(
                  textStyle:TextStyle(
                    color:Colors.grey.shade600,
                    fontSize: width * 0.04
          ),)
        )),
        SizedBox(height: width * 0.1,),
         TextFormField(
                controller: _email,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.mail,size: width * 0.05,),
                hintText: 'Email',
                hintStyle: GoogleFonts.poppins(
                  textStyle:TextStyle(
                    color:Colors.grey.shade600,
                     fontSize: width * 0.04
          )
                )
              ),
              ),
              SizedBox(height: width * 0.06,),
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
                            return LoginScreen();
                          }));
                 },
                 child: Container(
                  height: width * 0.12,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade900,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Text('Submit',style: GoogleFonts.poppins(
                      textStyle:TextStyle(
                        color:Colors.white,fontWeight: FontWeight.bold,fontSize: width * 0.04
                      )
                    ),),
                  ),
                             ),
               ),
               SizedBox(height: width * 0.2,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Dont want to reset?',style: GoogleFonts.poppins(
                    textStyle:TextStyle(
                      color:Colors.black,
                      fontSize: width * 0.04
                    )
                  ),),
                  SizedBox(width: width * 0.04,),
                  GestureDetector(
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
                            return LoginScreen();
                          }));
                    },
                    child: Text('Login',style: GoogleFonts.poppins(
                    textStyle:TextStyle(
                      color:Colors.blue.shade900,fontWeight: FontWeight.bold,
                      fontSize: width * 0.04
                    )
                  ),),
                  )
                ],
              )
          ],
        ),
      ),
    );
  }
}