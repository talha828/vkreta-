import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vkreta/entermobileno.dart';
import 'package:vkreta/login.dart';

class SignUp extends StatefulWidget {
  const SignUp({ Key? key }) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _firstname=TextEditingController();
  final TextEditingController _lastname=TextEditingController();
  final TextEditingController _email=TextEditingController();
  final TextEditingController _telephone=TextEditingController();
  final TextEditingController _password=TextEditingController();
  final TextEditingController _confirmpassword=TextEditingController();
  int _value=1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text('Signup',style: GoogleFonts.poppins(
            textStyle: TextStyle(
              color: Colors.blue.shade900,fontWeight: FontWeight.bold,fontSize: 20
            )
          ),),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 20,),
              Row(
                children: [
                  Text('Your Personal Details',style: GoogleFonts.poppins(
                    textStyle:TextStyle(
                      color:Colors.black,fontWeight: FontWeight.bold,fontSize: 20
                    )
                  ),)
                ],
              ),
              SizedBox(height: 10,),
              TextFormField(
                controller: _firstname,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person_outline,size: 23,),
                hintText: 'First Name',
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
                controller: _lastname,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person_outline,size: 23,),
                hintText: 'Last Name',
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
                controller: _telephone,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.call,size: 23,),
                hintText: 'Telephone',
                hintStyle: GoogleFonts.poppins(
                  textStyle:TextStyle(
                    color:Colors.grey.shade600,
                     fontSize: 14
          )
                )
              ),
              ),
                 SizedBox(height: 30,),
              Row(
                children: [
                  Text('Your Password',style: GoogleFonts.poppins(
                    textStyle:TextStyle(
                      color:Colors.black,fontWeight: FontWeight.bold,fontSize: 20
                    )
                  ),)
                ],
              ),
              SizedBox(height: 10,),
              TextFormField(
                controller: _password,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.vpn_key,size: 23,),
                hintText: 'Password',
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
                controller: _confirmpassword,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.vpn_key,size: 23,),
                hintText: 'Confirm Password',
                hintStyle: GoogleFonts.poppins(
                  textStyle:TextStyle(
                    color:Colors.grey.shade600,
                     fontSize: 14
          )
                )
              ),
              ),
              SizedBox(height: 30,),
              Row(
                children: [
                  Text('Newsletter',style: GoogleFonts.poppins(
                    textStyle:TextStyle(
                      color:Colors.black,fontWeight: FontWeight.bold,fontSize: 20
                    )
                  ),)
                ],
              ),
              SizedBox(height: 30,),
              Row(children: [
                Text('Subscribe',style: GoogleFonts.poppins(
                    textStyle:TextStyle(
                      color:Colors.black,fontSize: 15
                    )
                  ),),
                  SizedBox(width: 60,),
                  Radio(
                    value: 1,
                     groupValue: _value,
                   onChanged: (val){
                     setState(() {
                       _value!=val;
                     });
                   }
                   ),
                   Text('Yes',style: GoogleFonts.poppins(
                    textStyle:TextStyle(
                      color:Colors.black,fontSize: 15
                    )
                  ),),
                   Radio(
                    value: 2,
                    groupValue: _value,
                   onChanged: (val){
                     setState(() {
                       _value!=val;
                     });
                   }
                   ),
                   Text('No',style: GoogleFonts.poppins(
                    textStyle:TextStyle(
                      color:Colors.black,fontSize: 15
                    )
                  ),),
              ],),
              SizedBox(height:20),
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
                              t: 'Signup',
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
                  child: Text('Signup',style: GoogleFonts.poppins(
                    textStyle:TextStyle(
                      color:Colors.white,fontWeight: FontWeight.bold,fontSize: 15
                    )
                  ),),
                ),
                          ),
              ),
              SizedBox(height: 30,),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account?',style: GoogleFonts.poppins(
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
                            return LoginScreen();
                          }));
                    },
                    child: Text('Login',style: GoogleFonts.poppins(
                    textStyle:TextStyle(
                      color:Colors.blue.shade900,fontWeight: FontWeight.bold,
                      fontSize: 14
                    )
                  ),),
                  )
                ],
              ),SizedBox(height: 30,)
              
            ],
          ),
        ),
      ),
    );
  }
}