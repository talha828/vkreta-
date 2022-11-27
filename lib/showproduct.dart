import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShoeProduct extends StatefulWidget {
  const ShoeProduct({Key? key}) : super(key: key);

  @override
  State<ShoeProduct> createState() => _ShoeProductState();
}

class _ShoeProductState extends State<ShoeProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
                      'Here is name of product',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.black,
                             fontWeight: FontWeight.bold,
                              fontSize: 16)),
                    ),
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: 
        (){
          Navigator.of(context).pop();
        }
        , icon: Icon(Icons.arrow_back,color: Colors.black,size: 25,)
        ),
      ),
      body: Center(child: Image.asset('assets/shoes.png',fit: BoxFit.cover,)),
    );
  }
}