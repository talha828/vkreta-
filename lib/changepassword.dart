import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
       appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back, color: Colors.black, size: 25)),
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text(
          'Change Password',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 16)),
        ),
      ),
body: Column(
  children: [
    SizedBox(height: 20,),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'New Password',
          labelText: 'New Password',
          hintStyle: GoogleFonts.poppins(
            textStyle:TextStyle(
              color: Colors.grey.shade500,fontSize: 15
            )
          )
        ),
      ),
    ),
    SizedBox(height: 10,),
      
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'Confirm Password',
          labelText: 'Confirm Password',
          hintStyle: GoogleFonts.poppins(
            textStyle:TextStyle(
              color: Colors.grey.shade500,fontSize: 15
            )
          )
        ),
      ),
    ),
    SizedBox(height: 50,),
     Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            height: 45,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.blue.shade900,
                borderRadius: BorderRadius.circular(4)),
            child: Center(
              child: Text(
                'Change',
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
    );
  }
}