import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
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
          'Payment',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 16)),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Text(
                'Summary',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Colors.grey.shade900,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Payment',
                style: GoogleFonts.poppins(
                    textStyle:
                        TextStyle(color: Colors.grey.shade700, fontSize: 14)),
              ),
              Text(
                '₹ 150',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Colors.grey.shade900,
                        fontWeight: FontWeight.bold,
                        fontSize: 14)),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 10,
          width: MediaQuery.of(context).size.width,
          color: Colors.grey.shade100,
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Payment Change',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Colors.grey.shade900,
                        fontWeight: FontWeight.bold,
                        fontSize: 16)),
              ),
              GestureDetector(
                onTap: (){
                   showModalBottomSheet(
                    enableDrag: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)
                      )
                    ),
                     context: context,
                    builder: (context)=>Column(
                      children: [
SizedBox(height: 15,),
 Padding(
   padding: const EdgeInsets.symmetric(horizontal: 10),
   child: Row(
     children: [
       SizedBox(height: 30,),
       Padding(
         padding: const EdgeInsets.symmetric(horizontal: 10),
         child: Text(
                        'Payment Method',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.grey.shade900,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                      ),
       ),
     ],
   ),
 ),
 SizedBox(height: 25,),
    Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Container(
                  height: 20,
                  width: 40,
                  child: Image.asset(
                    'assets/visa.jpg',
                    fit: BoxFit.fill,
                  )),
              SizedBox(
                width: 5,
              ),
              Text(
                'Visa card ending in 4392',
                style: GoogleFonts.poppins(
                    textStyle:
                        TextStyle(color: Colors.grey.shade700, fontSize: 14)),
              ),
            ],
          ),
        ),
        SizedBox(height: 15,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Divider(height: 1,color:Colors.grey.shade300),
        ),
         SizedBox(height: 15,),
    Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Container(
                  height: 20,
                  width: 40,
                  child: Image.asset(
                    'assets/master.png',
                    fit: BoxFit.cover,
                  )),
              SizedBox(
                width: 5,
              ),
              Text(
                'Master card ending in 4392',
                style: GoogleFonts.poppins(
                    textStyle:
                        TextStyle(color: Colors.grey.shade700, fontSize: 14)),
              ),
            ],
          ),
        ),SizedBox(height: 15,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Divider(height: 1,color:Colors.grey.shade300),
        ),
         SizedBox(height: 15,),
    Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Container(
                  height: 20,
                  width: 40,
                  child: Image.asset(
                    'assets/visa.jpg',
                    fit: BoxFit.fill,
                  )),
              SizedBox(
                width: 5,
              ),
              Text(
                'Visa card ending in 6272',
                style: GoogleFonts.poppins(
                    textStyle:
                        TextStyle(color: Colors.grey.shade700, fontSize: 14)),
              ),
            ],
          ),
        ),
        SizedBox(height: 15,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Divider(height: 1,color:Colors.grey.shade300),
        ),
                      ],
                    )
                    );
                },
                child: Text(
                  'Change',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Colors.blue.shade900,
                          fontWeight: FontWeight.bold,
                          fontSize: 13)),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Container(
                  height: 20,
                  width: 40,
                  child: Image.asset(
                    'assets/visa.jpg',
                    fit: BoxFit.fill,
                  )),
              SizedBox(
                width: 5,
              ),
              Text(
                'Visa card ending in 4392',
                style: GoogleFonts.poppins(
                    textStyle:
                        TextStyle(color: Colors.grey.shade700, fontSize: 14)),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 40,
        ),
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
                'Pay',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14)),
              ),
            ),
          ),
        )
      ])),
    );
  }
}
