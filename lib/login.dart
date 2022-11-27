import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vkreta/entermobileno.dart';
import 'package:vkreta/forgotpasssword.dart';
import 'package:vkreta/selectscreen.dart';
import 'package:vkreta/signup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isVisiblePassword=false;
  final TextEditingController _email=TextEditingController();
  final TextEditingController _password=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text('Login',style: GoogleFonts.poppins(
            textStyle: TextStyle(
              color: Colors.blue.shade900,fontWeight: FontWeight.bold,fontSize: 20
            )
          ),),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 20,),
            Container(
              height: MediaQuery.of(context).size.height/3,
              width: MediaQuery.of(context).size.width/1.5,
              child: Image.asset('assets/login.png',fit: BoxFit.cover,),
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: _email,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.mail,size: 23,),
              hintText: 'Email',
              hintStyle: GoogleFonts.poppins(
                textStyle:TextStyle(
                  color:Colors.grey.shade600,
                   fontSize: 14
        )
              )
            ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              obscureText: !isVisiblePassword?true:false,
              controller: _password,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.vpn_key,size: 23,),
              suffixIcon: IconButton(onPressed: (){
                setState(() {
                  isVisiblePassword=!isVisiblePassword;
                });
              }, icon:Icon(!isVisiblePassword?Icons.visibility:Icons.visibility_off)
              ),
              hintText: 'Password',
              hintStyle: GoogleFonts.poppins(
                textStyle:TextStyle(
                  color:Colors.grey.shade600,
                  fontSize: 14
        )
              )
            ),
            ),
            SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [GestureDetector(
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
                          return ForgotPassword();
                        }));
                },
                child: Text('Forgot Password?',style: GoogleFonts.poppins(
                  textStyle:TextStyle(
                    color:Colors.blue.shade900,fontWeight: FontWeight.bold,fontSize: 13
                  )
                ),),
              )],
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
                          return EnterMobileNo(
                            t: 'Login',
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
                  child: Text('Login',style: GoogleFonts.poppins(
                    textStyle:TextStyle(
                      color:Colors.white,fontWeight: FontWeight.bold,fontSize: 15
                    )
                  ),),
                ),
              ),
            ),
            SizedBox(height: 70,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('A new user?',style: GoogleFonts.poppins(
                  textStyle:TextStyle(
                    color:Colors.black,
                    fontSize: 14
                  )
                ),),
                SizedBox(width: 5,),
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
                          return SignUp();
                        }));
                  },
                  child: Text('SignUp',style: GoogleFonts.poppins(
                  textStyle:TextStyle(
                    color:Colors.blue.shade900,fontWeight: FontWeight.bold,
                    fontSize: 14
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