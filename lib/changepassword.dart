import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vkreta/services/apiservice.dart';

import 'login.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  String? email;
  SharedPreferences? sharedPrefs;

  @override
  initState() {
    super.initState();
    getSharedPref();
  }

  Future<void> getSharedPref() async {
    SharedPreferences.getInstance().then((prefs) {
      // setState(() => sharedPrefs = prefs);
      sharedPrefs = prefs;
      String? _email = sharedPrefs?.getString("email");

      setState(() {
        email = _email.toString();
      });
    });
  }

  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmpassword = TextEditingController();

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
          'Change Password',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 16)),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
              controller: _password,
              decoration: InputDecoration(
                  hintText: 'New Password',
                  labelText: 'New Password',
                  hintStyle: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Colors.grey.shade500, fontSize: 15))),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
              controller: _confirmpassword,
              decoration: InputDecoration(
                  hintText: 'Confirm Password',
                  labelText: 'Confirm Password',
                  hintStyle: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Colors.grey.shade500, fontSize: 15))),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          InkWell(
            onTap: () async {
              if (_password.text == '' || _confirmpassword.text == '') {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('password cannot be empty'),
                  backgroundColor: Colors.red,
                ));
                // error password can not b empty
              } else if (_password.text != _confirmpassword.text) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('confirm password and password not same'),
                  backgroundColor: Colors.red,
                ));
                // errror confirm passord and password not same
              } else {
                final response = await ApiService().changePassword(
                  email!,
                  _password.text,
                );
                if (response['success'] != '') {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Password changed successfully'),
                    backgroundColor: Colors.green,
                  ));
                  // show msg from server
                }
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 45,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.blue.shade900,
                    borderRadius: BorderRadius.circular(4)),
                child: Center(
                  child: InkWell(
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
              ),
            ),
          )
        ],
      ),
    );
  }
}
