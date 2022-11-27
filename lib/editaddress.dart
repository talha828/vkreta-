import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditAddress extends StatefulWidget {
  const EditAddress({Key? key}) : super(key: key);

  @override
  State<EditAddress> createState() => _EditAddressState();
}

class _EditAddressState extends State<EditAddress> {
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
          'Edit Address',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 16)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
             Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'First Name',
          labelText: 'First Name',
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
          hintText: 'Last Name',
          labelText: 'Last Name',
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
          hintText: 'Company',
          labelText: 'Company',
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
          hintText: 'Address 1',
          labelText: 'Address 1',
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
          hintText: 'Address 2',
          labelText: 'Address 2',
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
          hintText: 'City',
          labelText: 'City',
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
          hintText: 'Post Code',
          labelText: 'Post Code',
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
          hintText: 'Country',
          labelText: 'Country',
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
           suffixIcon:PopupMenuButton(
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black,
                                size: 30,
                              ),
                              itemBuilder: (context) => [
                                PopupMenuItem(
                                    child: Column(
                                  children: [
                                    SizedBox(height: 10,),
                                    GestureDetector(
                                     
                                      child: Row(
                                        children: [
                                          Text(
                                            "Andaman and Nicobar Islands",
                                            style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                    color: Colors.grey.shade900,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold)),
                                          ),
                                        ],
                                      ),
                                    ),
                                     SizedBox(
                                      height: 10,
                                    ),
                                    
                                    GestureDetector(
                                      
                                      child: Row(
                                        children: [
                                          Text(
                                            "Andhra Pardesh",
                                            style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                          color: Colors.grey.shade900,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                          ),
                                        ],
                                      ),
                                    ),
                                   SizedBox(height: 10,),
                                  
                                    GestureDetector(
                                      
                                      child: Row(
                                        children: [
                                          Text(
                                                "Arunachal Pradesh",
                                                style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        color: Colors.grey.shade900,
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.bold)),
                                              ),
                                        ],
                                      ),
                                    ),
                                      SizedBox(height: 10,),
                                  
                                    GestureDetector(
                                      
                                      child: Row(
                                        children: [
                                          Text(
                                                "Assam",
                                                style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        color: Colors.grey.shade900,
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.bold)),
                                              ),
                                        ],
                                      ),
                                    ),
                                      SizedBox(height: 10,),
                                  
                                    GestureDetector(
                                      
                                      child: Row(
                                        children: [
                                          Text(
                                                "Bihar",
                                                style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        color: Colors.grey.shade900,
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.bold)),
                                              ),
                                        ],
                                      ),
                                    ),
                                      SizedBox(height: 10,),
                                  
                                    GestureDetector(
                                      
                                      child: Row(
                                        children: [
                                          Text(
                                                "Chandigarh",
                                                style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        color: Colors.grey.shade900,
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.bold)),
                                              ),
                                        ],
                                      ),
                                    ),
                                      SizedBox(height: 10,),
                                  
                                    GestureDetector(
                                      
                                      child: Row(
                                        children: [
                                          Text(
                                                "Chhattisgarh",
                                                style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        color: Colors.grey.shade900,
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.bold)),
                                              ),
                                        ],
                                      ),
                                    ),
                                      SizedBox(height: 10,),
                                  
                                    GestureDetector(
                                      
                                      child: Row(
                                        children: [
                                          Text(
                                                "Dadra and Nagra Haveli and Daman and Diu",
                                                style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        color: Colors.grey.shade900,
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.bold)),
                                              ),
                                        ],
                                      ),
                                    ),
                                      SizedBox(height: 10,),
                                  
                                    GestureDetector(
                                      
                                      child: Row(
                                        children: [
                                          Text(
                                                "Daman and Diu",
                                                style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        color: Colors.grey.shade900,
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.bold)),
                                              ),
                                        ],
                                      ),
                                    ),
                                      SizedBox(height: 10,),
                                  
                                    GestureDetector(
                                      
                                      child: Row(
                                        children: [
                                          Text(
                                                "Delhi",
                                                style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        color: Colors.grey.shade900,
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.bold)),
                                              ),
                                        ],
                                      ),
                                    ),
                                      SizedBox(height: 10,),
                                  
                                    GestureDetector(
                                      
                                      child: Row(
                                        children: [
                                          Text(
                                                "Goa",
                                                style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        color: Colors.grey.shade900,
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.bold)),
                                              ),
                                        ],
                                      ),
                                    ),
                                      SizedBox(height: 10,),
                                  
                                    GestureDetector(
                                      
                                      child: Row(
                                        children: [
                                          Text(
                                                "Gujrat",
                                                style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        color: Colors.grey.shade900,
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.bold)),
                                              ),
                                        ],
                                      ),
                                    ),
                                      SizedBox(height: 10,),
                                  
                                    GestureDetector(
                                      
                                      child: Row(
                                        children: [
                                          Text(
                                                "Haryana",
                                                style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        color: Colors.grey.shade900,
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.bold)),
                                              ),
                                        ],
                                      ),
                                    ),
                                      SizedBox(height: 10,),
                                  
                                    GestureDetector(
                                      
                                      child: Row(
                                        children: [
                                          Text(
                                                "Himachal Pradesh",
                                                style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        color: Colors.grey.shade900,
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.bold)),
                                              ),
                                        ],
                                      ),
                                    ),
                                      SizedBox(height: 10,),
                                  
                                    GestureDetector(
                                      
                                      child: Row(
                                        children: [
                                          Text(
                                                "Jammu and Kashmir",
                                                style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        color: Colors.grey.shade900,
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.bold)),
                                              ),
                                        ],
                                      ),
                                    ),
                                      SizedBox(height: 10,),
                                  
                                    GestureDetector(
                                      
                                      child: Row(
                                        children: [
                                          Text(
                                                "Jharkhand",
                                                style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        color: Colors.grey.shade900,
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.bold)),
                                              ),
                                        ],
                                      ),
                                    ),
                                      SizedBox(height: 10,),
                                  
                                    GestureDetector(
                                      
                                      child: Row(
                                        children: [
                                          Text(
                                                "Karnataka",
                                                style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        color: Colors.grey.shade900,
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.bold)),
                                              ),
                                        ],
                                      ),
                                    ),
                                      SizedBox(height: 10,),
                                  
                                    GestureDetector(
                                      
                                      child: Row(
                                        children: [
                                          Text(
                                                "Kerala",
                                                style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        color: Colors.grey.shade900,
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.bold)),
                                              ),
                                        ],
                                      ),
                                    ),
                                      SizedBox(height: 10,),
                                  
                                    GestureDetector(
                                      
                                      child: Row(
                                        children: [
                                          Text(
                                                "Ladakh",
                                                style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        color: Colors.grey.shade900,
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.bold)),
                                              ),
                                        ],
                                      ),
                                    ),
                                      SizedBox(height: 10,),
                                  
                                    GestureDetector(
                                      
                                      child: Row(
                                        children: [
                                          Text(
                                                "Laksgadweep",
                                                style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        color: Colors.grey.shade900,
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.bold)),
                                              ),
                                        ],
                                      ),
                                    ),
                                      SizedBox(height: 10,),
                                  
                                    GestureDetector(
                                      
                                      child: Row(
                                        children: [
                                          Text(
                                                "MadhyaPradesh",
                                                style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        color: Colors.grey.shade900,
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.bold)),
                                              ),
                                        ],
                                      ),
                                    ),
                                      SizedBox(height: 10,),
                                  
                                    GestureDetector(
                                      
                                      child: Row(
                                        children: [
                                          Text(
                                                "Maharashtra",
                                                style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        color: Colors.grey.shade900,
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.bold)),
                                              ),
                                        ],
                                      ),
                                    ),
                                      SizedBox(height: 10,),
                                  
                                    GestureDetector(
                                      
                                      child: Row(
                                        children: [
                                          Text(
                                                "Manipur",
                                                style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        color: Colors.grey.shade900,
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.bold)),
                                              ),
                                        ],
                                      ),
                                    ),
                                      SizedBox(height: 10,),
                                  
                                    GestureDetector(
                                      
                                      child: Row(
                                        children: [
                                          Text(
                                                "Meghalaya",
                                                style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        color: Colors.grey.shade900,
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.bold)),
                                              ),
                                        ],
                                      ),
                                    ),
                                      SizedBox(height: 10,),
                                  
                                    GestureDetector(
                                      
                                      child: Row(
                                        children: [
                                          Text(
                                                "Mizoram",
                                                style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        color: Colors.grey.shade900,
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.bold)),
                                              ),
                                        ],
                                      ),
                                    ),
                                      SizedBox(height: 10,),
                                  
                                    GestureDetector(
                                      
                                      child: Row(
                                        children: [
                                          Text(
                                                "Nagaland",
                                                style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        color: Colors.grey.shade900,
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.bold)),
                                              ),
                                        ],
                                      ),
                                    ),
                                      SizedBox(height: 10,),
                                  
                                    GestureDetector(
                                      
                                      child: Row(
                                        children: [
                                          Text(
                                                "Odisha",
                                                style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        color: Colors.grey.shade900,
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.bold)),
                                              ),
                                        ],
                                      ),
                                    ),
                                      SizedBox(height: 10,),
                                  
                                    GestureDetector(
                                      
                                      child: Row(
                                        children: [
                                          Text(
                                                "Puducherry",
                                                style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        color: Colors.grey.shade900,
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.bold)),
                                              ),
                                        ],
                                      ),
                                    ),
                                      SizedBox(height: 10,),
                                  
                                    GestureDetector(
                                      
                                      child: Row(
                                        children: [
                                          Text(
                                                "Punjab",
                                                style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        color: Colors.grey.shade900,
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.bold)),
                                              ),
                                        ],
                                      ),
                                    ),
                                      SizedBox(height: 10,),
                                  
                                    GestureDetector(
                                      
                                      child: Row(
                                        children: [
                                          Text(
                                                "Rajasthan",
                                                style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        color: Colors.grey.shade900,
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.bold)),
                                              ),
                                        ],
                                      ),
                                    ),
                                      SizedBox(height: 10,),
                                  
                                    GestureDetector(
                                      
                                      child: Row(
                                        children: [
                                          Text(
                                                "Sikkim",
                                                style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        color: Colors.grey.shade900,
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.bold)),
                                              ),
                                        ],
                                      ),
                                    ),
                                      SizedBox(height: 10,),
                                  
                                    GestureDetector(
                                      
                                      child: Row(
                                        children: [
                                          Text(
                                                "Tamil Naddu",
                                                style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        color: Colors.grey.shade900,
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.bold)),
                                              ),
                                        ],
                                      ),
                                    ),
                                      SizedBox(height: 10,),
                                  
                                    GestureDetector(
                                      
                                      child: Row(
                                        children: [
                                          Text(
                                                "Telenghana",
                                                style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        color: Colors.grey.shade900,
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.bold)),
                                              ),
                                        ],
                                      ),
                                    ),
                                      SizedBox(height: 10,),
                                  
                                    GestureDetector(
                                      
                                      child: Row(
                                        children: [
                                          Text(
                                                "Tripura",
                                                style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        color: Colors.grey.shade900,
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.bold)),
                                              ),
                                        ],
                                      ),
                                    ),
                                      SizedBox(height: 10,),
                                  
                                    GestureDetector(
                                      
                                      child: Row(
                                        children: [
                                          Text(
                                                "Uttar Pradesh",
                                                style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        color: Colors.grey.shade900,
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.bold)),
                                              ),
                                        ],
                                      ),
                                    ),
                                      SizedBox(height: 10,),
                                  
                                    GestureDetector(
                                      
                                      child: Row(
                                        children: [
                                          Text(
                                                "West Bengal",
                                                style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        color: Colors.grey.shade900,
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.bold)),
                                              ),
                                        ],
                                      ),
                                    ),
                                   
                                   SizedBox(height: 10,),
                                  ],
                                    ))]),
          hintText: 'Select State',
          labelText: 'Region/State',
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
                'Save',
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
      ),
    );
  }
}