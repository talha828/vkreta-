import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:provider/provider.dart';
import 'package:vkreta/entermobileno.dart';
import 'package:vkreta/forgotpasssword.dart';
import 'package:vkreta/helper/helper.dart';
import 'package:vkreta/home.dart';
import 'package:vkreta/models/homemodel.dart';
import 'package:vkreta/providerModel/homedata.dart';
import 'package:vkreta/selectscreen.dart';
import 'package:vkreta/services/apiservice.dart';
import 'package:vkreta/signup.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isVisiblePassword = false;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool isLoading=false;
  void setLoading(bool value){
    setState(() {
      isLoading =value;
    });
  }
  getLogin()async{
    String? email=await Helper.prefGetString("email");
    String? password=await Helper.prefGetString("password");
    if(email != null && password != null){
      String? deviceId = await PlatformDeviceId.getDeviceId;
      var response= ApiService().userLogin(email, password, deviceId!).then((value)async{
        if(value.error == null){
          Get.to(const SelectScreen());
        }
      }).catchError((e){

      });
    }
  }
  @override
  void initState() {
    getLogin();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var height =MediaQuery.of(context).size.height;
    var width =MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'Login',
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: Colors.blue.shade900,
                    fontWeight: FontWeight.bold,
                    fontSize: width * 0.06)),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: height,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: width * 0.06,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 3,
                      width: MediaQuery.of(context).size.width / 1.5,
                      child: Image.asset(
                        'assets/login.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: width * 0.06,
                    ),
                    TextFormField(
                      controller: _email,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.mail,
                            size: 23,
                          ),
                          hintText: 'Email',
                          hintStyle: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.grey.shade600, fontSize: width * 0.04))),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      obscureText: !isVisiblePassword ? true : false,
                      controller: _password,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.vpn_key,
                            size: 23,
                          ),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isVisiblePassword = !isVisiblePassword;
                                });
                              },
                              icon: Icon(!isVisiblePassword
                                  ? Icons.visibility
                                  : Icons.visibility_off)),
                          hintText: 'Password',
                          hintStyle: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.grey.shade600, fontSize:  width * 0.04))),
                    ),
                    SizedBox(
                      height:  width * 0.04,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
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
                                  return const ForgotPassword();
                                }));
                          },
                          child: Text(
                            'Forgot Password?',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.blue.shade900,
                                    fontWeight: FontWeight.bold,
                                    fontSize:  width * 0.035)),
                          ),
                        )
                      ],
                    ),
                   const SizedBox(
                      height: 50,
                    ),
                    InkWell(
                      onTap: ()async{
                        setLoading(true);
                        if (RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(_email.text.trim())) {
                          if (_password.text != null) {
                            String? deviceId = await PlatformDeviceId.getDeviceId;
                             var response= ApiService().userLogin(_email.text, _password.text, deviceId!).then((value)async{
                               if(value.error == null){
                                 await Helper.prefSetString("email", _email.text);
                                 await Helper.prefSetString("password", _password.text);
                                 await Helper.saveUserData(int.parse(value.customerId));


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
                                       return const SelectScreen();
                                       //   EnterMobileNo(
                                       //   t: 'Login',
                                       // );
                                     }));
                                 setLoading(false);
                               }else{
                                 setLoading(false);
                                 Fluttertoast.showToast(msg: "Error: " + value.error.toString());
                               }
                             }).catchError((e){
                               setLoading(false);
                               Fluttertoast.showToast(msg: "Error:" + e.toString());
                             });

                          } else {
                            setLoading(false);
                            Fluttertoast.showToast(msg: "please input valid password");
                          }
                        } else {
                          setLoading(false);
                          Fluttertoast.showToast(msg: "Please Input a valid email");
                        }
                        //TODO : user registration or login

                      },
                      child: Container(
                        height:  width * 0.12,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade900,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                          child: Text(
                            'Login',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize:  width * 0.04)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height:  width * 0.2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'A new user?',
                          style: GoogleFonts.poppins(
                              textStyle:const TextStyle(color: Colors.black, fontSize: 14)),
                        ),
                        SizedBox(
                          width:  width * 0.02,
                        ),
                        GestureDetector(
                          onTap: () {
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
                                  return const SignUp();
                                }));
                          },
                          child: Text(
                            'SignUp',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.blue.shade900,
                                    fontWeight: FontWeight.bold,
                                    fontSize:  width * 0.04)),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              isLoading?Positioned.fill(child: Container(color: Colors.black54,child: Center(child: CircularProgressIndicator(color:  Colors.blue.shade900,),),)):Container()
            ],
          ),
        ),
      ),
    );
  }
}
