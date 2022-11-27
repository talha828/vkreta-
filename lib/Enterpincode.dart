import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EnterPinCode extends StatefulWidget {
  const EnterPinCode({Key? key}) : super(key: key);

  @override
  State<EnterPinCode> createState() => _EnterPinCodeState();
}

class _EnterPinCodeState extends State<EnterPinCode> {
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
          'Check Availability',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 16)),
        ),
      ),
       body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(height: 50,),
            Row(
              children: [
                Text(
          'Pin Code',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: Colors.grey.shade900,
                  fontSize: 13,fontWeight: FontWeight.bold
                  )),
        ),
              ],
            ),
            SizedBox(height: 5,),
            TextFormField(
              decoration: InputDecoration(
                fillColor: Colors.grey.shade200,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none
                ),
                prefixIcon: Icon(Icons.person,color: Colors.grey.shade500,),
                hintText: 'Enter Pin Code',
                hintStyle: GoogleFonts.poppins(
                  textStyle:TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 14
                  )
                )
              ),
            ),
            SizedBox(height: 60,),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.blue.shade900,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Center(
                child: Text(
          'Check',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
        ),
              ),
            )
          ],
        ),
      ),
    );
  }
}