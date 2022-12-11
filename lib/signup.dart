import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vkreta/entermobileno.dart';
import 'package:vkreta/login.dart';
import 'package:vkreta/services/apiservice.dart';

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
  int? _value=1;
  bool isLoading=false;

  void setLoading(bool value){
    setState(() {
      isLoading=value;
    });
  }

  @override
  Widget build(BuildContext context) {
    var width =MediaQuery.of(context).size.width;
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text('Signup',style: GoogleFonts.poppins(
            textStyle: TextStyle(
              color: Colors.blue.shade900,fontWeight: FontWeight.bold,fontSize: width * 0.06
            )
          ),),
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.06),
              child: Column(
                children: [
                  SizedBox(height: width * 0.06,),
                  Row(
                    children: [
                      Text('Your Personal Details',style: GoogleFonts.poppins(
                        textStyle:TextStyle(
                          color:Colors.black,fontWeight: FontWeight.bold,fontSize: width * 0.06
                        )
                      ),)
                    ],
                  ),
                  SizedBox(height: width * 0.06,),
                  TextFormField(
                    controller: _firstname,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person_outline,size: width * 0.06,),
                    hintText: 'First Name',
                    hintStyle: GoogleFonts.poppins(
                      textStyle:TextStyle(
                        color:Colors.grey.shade600,
                         fontSize: width * 0.04
              )
                    )
                  ),
                  ),
                  SizedBox(height: width * 0.04,),
                  TextFormField(
                    controller: _lastname,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person_outline,size: 23,),
                    hintText: 'Last Name',
                    hintStyle: GoogleFonts.poppins(
                      textStyle:TextStyle(
                        color:Colors.grey.shade600,
                         fontSize: width * 0.04
              )
                    )
                  ),
                  ),
                  SizedBox(height: width * 0.04,),
                  TextFormField(
                    controller: _email,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.mail,size: width * 0.04,),
                    hintText: 'Email',
                    hintStyle: GoogleFonts.poppins(
                      textStyle:TextStyle(
                        color:Colors.grey.shade600,
                         fontSize: 14
              )
                    )
                  ),
                  ),
                  SizedBox(height: width * 0.04,),
                  TextFormField(
                    controller: _telephone,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.call,size: width * 0.04,),
                    hintText: 'Telephone',
                    hintStyle: GoogleFonts.poppins(
                      textStyle:TextStyle(
                        color:Colors.grey.shade600,
                         fontSize: width * 0.04
              )
                    )
                  ),
                  ),
                     SizedBox(height: width * 0.04,),
                  Row(
                    children: [
                      Text('Your Password',style: GoogleFonts.poppins(
                        textStyle:TextStyle(
                          color:Colors.black,fontWeight: FontWeight.bold,fontSize: width * 0.06
                        )
                      ),)
                    ],
                  ),
                  SizedBox(height: width * 0.04,),
                  TextFormField(
                    controller: _password,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.vpn_key,size: width * 0.04,),
                    hintText: 'Password',
                    hintStyle: GoogleFonts.poppins(
                      textStyle:TextStyle(
                        color:Colors.grey.shade600,
                         fontSize: width * 0.04
              )
                    )
                  ),
                  ),
                  SizedBox(height: width * 0.04,),
                  TextFormField(
                    controller: _confirmpassword,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.vpn_key,size: width * 0.04,),
                    hintText: 'Confirm Password',
                    hintStyle: GoogleFonts.poppins(
                      textStyle:TextStyle(
                        color:Colors.grey.shade600,
                         fontSize: width * 0.04
              )
                    )
                  ),
                  ),
                  SizedBox(height: width * 0.08,),
                  Row(
                    children: [
                      Text('Newsletter',style: GoogleFonts.poppins(
                        textStyle:TextStyle(
                          color:Colors.black,fontWeight: FontWeight.bold,fontSize: width * 0.06
                        )
                      ),)
                    ],
                  ),
                  SizedBox(height: width * 0.04,),
                  Row(children: [
                    Text('Subscribe',style: GoogleFonts.poppins(
                        textStyle:TextStyle(
                          color:Colors.black,fontSize: width * 0.04
                        )
                      ),),
                      SizedBox(width: width * 0.25,),
                      Radio(
                        value: 1,
                         groupValue: _value,
                       onChanged: (val){
                         setState(() {
                           _value=int.parse(val.toString());
                         });
                       }
                       ),
                       Text('Yes',style: GoogleFonts.poppins(
                        textStyle:TextStyle(
                          color:Colors.black,fontSize: width * 0.04
                        )
                      ),),
                       Radio(
                        value: 2,
                        groupValue: _value,
                       onChanged: (val){
                         setState(() {
                           _value=int.parse(val.toString());
                         });
                       }
                       ),
                       Text('No',style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color:Colors.black,fontSize: width * 0.04
                        )
                      ),),
                  ],),
                   SizedBox(height:width * 0.06),
                  InkWell(
                    onTap: (){
                      setLoading(true);
                        if(_firstname.text.toString() != ""){
                          if(_lastname.text.toString() !=""){
                            if(_email.text.toString()!="" && RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(_email.text.trim())){
                              if(_telephone.text.toString() != "" && _telephone.text.toString().length >12){
                                if(_password.text.toString()!= "" &&_password.text.toString().length >5 ){
                                  if(_password.text == _confirmpassword.text ){
                                      var response=ApiService().userRegister(_firstname.text, _lastname.text, _email.text, _telephone.text, _password.text, _confirmpassword.text, _value.toString()).then((value){
                                        Navigator.of(context).pushReplacement(PageRouteBuilder(
                                              transitionDuration:const Duration(seconds: 1),
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
                                        setLoading(false);
                                      }).catchError((e){
                                        Fluttertoast.showToast(msg: "Error: "+e.toString());
                                        setLoading(false);
                                      });
                                  }else{
                                    setLoading(false);
                                    Fluttertoast.showToast(msg: "PLease Enter your password");
                                  }
                                }else{
                                  setLoading(false);
                                  Fluttertoast.showToast(msg: "PLease Enter your password");
                                }
                              }else{
                                setLoading(false);
                                Fluttertoast.showToast(msg: "PLease check your telephone number");
                              }
                            }else{
                              setLoading(false);
                              Fluttertoast.showToast(msg: "PLease check your email");
                            }
                          }else{
                            setLoading(false);
                            Fluttertoast.showToast(msg: "PLease Enter your last name");
                          }
                        }else{
                          setLoading(false);
                          Fluttertoast.showToast(msg: "PLease Enter your first name");
                        }
                    },
                    child: Container(
                    height: width * 0.11,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade900,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Center(
                      child: Text('Signup',style: GoogleFonts.poppins(
                        textStyle:const TextStyle(
                          color:Colors.white,fontWeight: FontWeight.bold,fontSize: 15
                        )
                      ),),
                    ),
                              ),
                  ),
                  SizedBox(height: width * 0.04,),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account?',style: GoogleFonts.poppins(
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
                  ),SizedBox(height: width * 0.04,)

                ],
              ),
            ),
          ),
          isLoading?Positioned.fill(child: Container(color: Colors.black54,child: Center(child: CircularProgressIndicator(color:  Colors.blue.shade900,),),)):Container()
        ],
      ),
    );
  }
}