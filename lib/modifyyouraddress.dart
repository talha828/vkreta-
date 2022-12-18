import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vkreta/addaddress.dart';
import 'package:vkreta/editaddress.dart';
import 'package:vkreta/models/listaddressModel.dart';
import 'package:vkreta/services/apiservice.dart';

class ModifyYourAddress extends StatefulWidget {
  const ModifyYourAddress({Key? key}) : super(key: key);

  @override
  State<ModifyYourAddress> createState() => _ModifyYourAddressState();
}

class _ModifyYourAddressState extends State<ModifyYourAddress> {
  List addressList = [];
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
            'Set Address',
            style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 16)),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: IconButton(
                onPressed: () async {
                  ListAddressModel newAddress = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddAddress(
                          default_: 1,
                        )),
                  );
                  setState(() {
                    addressList.add(newAddress);
                  });
                },
                icon: Icon(
                  Icons.add,
                  color: Colors.blue.shade900,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
        body: FutureBuilder(
          future: ApiService().getAddressList(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              addressList = snapshot.data.values.toList();
              // print(addressList[0].firstname);
              return SingleChildScrollView(
                child: Column(
                  children: [
                    for (int i = 0; i < addressList.length; ++i)
                      Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Container(
                              height: 210,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: [BoxShadow(color: Colors.grey.shade300, spreadRadius: 3, blurRadius: 5)]),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Home Address',
                                          style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade900, fontWeight: FontWeight.bold, fontSize: 15)),
                                        ),
                                        if (addressList[i].customField != null)
                                          Container(
                                            height: 20,
                                            width: 60,
                                            decoration: BoxDecoration(color: Colors.blue.shade900, borderRadius: BorderRadius.circular(4)),
                                            child: Center(
                                              child: Text(
                                                'Default',
                                                style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.white, fontSize: 12)),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20),
                                    child: Row(
                                      children: [
                                        Text(
                                          addressList[i].firstname + " " + addressList[i].lastname,
                                          style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                color: Colors.grey.shade900,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20),
                                    child: Row(
                                      children: [
                                        Text(
                                          addressList[i].telephone,
                                          style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 14)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20),
                                    child: Row(
                                      children: [
                                        Text(
                                          addressList[i].address1 + " " + addressList[i].address2,
                                          style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 14)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20),
                                    child: Row(
                                      children: [
                                        Text(
                                          addressList[i].zone + " " + addressList[i].city,
                                          style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 14)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20),
                                    child: Row(
                                      children: [
                                        Text(
                                          addressList[i].country,
                                          style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 14)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                              PageRouteBuilder(
                                                transitionDuration: Duration(seconds: 1),
                                                transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation, Widget child) {
                                                  animation = CurvedAnimation(parent: animation, curve: Curves.linear);
                                                  return SharedAxisTransition(child: child, animation: animation, secondaryAnimation: secAnimation, transitionType: SharedAxisTransitionType.horizontal);
                                                },
                                                pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation) {
                                                  return EditAddress(
                                                    object: addressList[i],
                                                    default_: 1,
                                                  );
                                                },
                                              ),
                                            );
                                          },
                                          child: Text(
                                            'Edit',
                                            style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.blue.shade900, fontWeight: FontWeight.bold, fontSize: 13)),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        InkWell(
                                          onTap: () async {
                                            final delete = await ApiService().deletAddress(int.parse(addressList[i].addressId.toString()));
                                            // print(delete);
                                            // String? error = '';
                                            // // print(signUp.firstname);
                                            // // signUp.then((value){
                                            // if (delete.error != null) {
                                            //   error = delete.error;
                                            // }
                                            // });

                                            // snapshot.data!
                                            //     .products.remove(index);

                                            // print error if found from api
                                            // if (error != '') {
                                            //   ScaffoldMessenger.of(context)
                                            //       .showSnackBar(SnackBar(
                                            //     content: Text(error!),
                                            //     backgroundColor: Colors.red,
                                            //   ));
                                            // }
                                            if (delete.success != null) {
                                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                content: Text('Address deleted successfully'),
                                                backgroundColor: Colors.green,
                                              ));

                                              setState(() {
                                                addressList.removeAt(i);
                                              });
                                            }
                                          },
                                          child: Text(
                                            'Delete',
                                            style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.blue.shade900, fontWeight: FontWeight.bold, fontSize: 13)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              );
            }
            return Center(
              child: snapshot.connectionState == ConnectionState.done
                  ? Text(
                'No address Found, Please add a address',
                style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 16)),
              )
                  : CircularProgressIndicator(),
            );
          },
        ));
  }
}
