import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vkreta/changeaddress.dart';
import 'package:vkreta/models/bages_model.dart';
import 'package:vkreta/payment.dart';
import 'package:vkreta/services/apiservice.dart';

import 'models/cartlistModel.dart';
import 'models/carttotalModel.dart';
import 'models/listaddressModel.dart';
import 'modifyyouraddress.dart';

class Delivery extends StatefulWidget {
  Delivery({Key? key}) : super(key: key);

  @override
  State<Delivery> createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
  String totalbillamount = "0";
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
          'Delivery',
          style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 16)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            if (addressList.length == 0)
              FutureBuilder(
                  future: ApiService().getAddressList(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      addressList = snapshot.data.values.toList();
                      return Column(
                        children: [
                          for (int i = 0; i < 1; ++i)
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Home Address',
                                        style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 16, fontWeight: FontWeight.bold)),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      if (addressList[i].customField != null)
                                        Container(
                                          height: 20,
                                          width: 60,
                                          decoration: BoxDecoration(color: Colors.blue.shade900, borderRadius: BorderRadius.circular(4)),
                                          child: Center(
                                            child: Text(
                                              'Default',
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 11,
                                                  )),
                                            ),
                                          ),
                                        )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15),
                                  child: Row(
                                    children: [
                                      Text(
                                        addressList[i].firstname + " " + addressList[i].lastname,
                                        style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              color: Colors.grey.shade600,
                                              fontSize: 14,
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15),
                                  child: Row(
                                    children: [
                                      Text(
                                        addressList[i].postcode,
                                        style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              color: Colors.grey.shade600,
                                              fontSize: 14,
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15),
                                  child: Row(
                                    children: [
                                      Text(
                                        addressList[i].address1 + " " + addressList[i].address2,
                                        style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              color: Colors.grey.shade600,
                                              fontSize: 14,
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15),
                                  child: Row(
                                    children: [
                                      Text(
                                        addressList[i].zone + " " + addressList[i].city,
                                        style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              color: Colors.grey.shade600,
                                              fontSize: 14,
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15),
                                  child: Row(
                                    children: [
                                      Text(
                                        addressList[i].country,
                                        style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              color: Colors.grey.shade600,
                                              fontSize: 14,
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                //change address
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      GestureDetector(
                                        onTap: () async {
                                          ListAddressModel? address = await Navigator.push(context, MaterialPageRoute(builder: (context) => ModifyYourAddress()));
                                          if (address != null)
                                            setState(() {
                                              addressList = [];
                                              addressList.add(address);
                                            });
                                        },
                                        child: Text(
                                          'Change Address',
                                          style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                color: Colors.green,
                                                fontSize: 14,
                                              )),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                        ],
                      );
                    }
                    return snapshot.connectionState == ConnectionState.done
                        ? Text(
                      'No address Found, Please add a address',
                      style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 14)),
                    )
                        : Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
            if (addressList.length != 0)
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Home Address',
                          style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 16, fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 20,
                          width: 60,
                          decoration: BoxDecoration(color: Colors.blue.shade900, borderRadius: BorderRadius.circular(4)),
                          child: Center(
                            child: Text(
                              'Default',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Text(
                          addressList.first.firstname.toString() + " " + addressList.first.lastname.toString(),
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 14,
                              )),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Text(
                          addressList.first.postcode.toString(),
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 14,
                              )),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Text(
                          addressList.first.address1.toString() + " " + addressList.first.address2.toString(),
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 14,
                              )),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Text(
                          addressList.first.zone.toString() + " " + addressList.first.city.toString(),
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 14,
                              )),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Text(
                          addressList.first.country.toString(),
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 14,
                              )),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            ListAddressModel? address = await Navigator.push(context, MaterialPageRoute(builder: (context) => ChanegAddress()));
                            if (address != null)
                              setState(() {
                                addressList = [];
                                addressList.add(address);
                              });
                          },
                          child: Text(
                            'Change Address',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: Colors.green,
                                  fontSize: 14,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            SizedBox(height: 10),
            Container(height: 10, width: MediaQuery.of(context).size.width, color: Colors.grey.shade100),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text(
                    'Order List',
                    style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade900, fontWeight: FontWeight.bold, fontSize: 16)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            FutureBuilder<CartlistModel>(
                future: ApiService().getCartItems(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        for (int index = 0; index < snapshot.data.products.length; index++)
                          Column(
                            children: [
                              Container(
                                height: 110,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 110,
                                      width: MediaQuery.of(context).size.width / 3,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Image.network(
                                          snapshot.data.products[index].thumb,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 110,
                                      width: MediaQuery.of(context).size.width / 1.5,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                            child: Text(
                                              snapshot.data.products[index].name,
                                              maxLines: 2,
                                              style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade900, fontWeight: FontWeight.bold, fontSize: 13)),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 0,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Qty: " + snapshot.data.products[index].quantity,
                                                  style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey[900], fontSize: 12)),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 0,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8),
                                            child: Row(
                                              children: [
                                                Text(
                                                  snapshot.data.products[index].price,
                                                  style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade900, fontWeight: FontWeight.bold, fontSize: 14)),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Divider(height: 1, color: Colors.grey.shade300),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Divider(height: 1, color: Colors.grey.shade300),
                              ),
                            ],
                          ),
                      ],
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 10,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.grey.shade100),
            ),
            Container(
              // height: 220,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: () {
                        if (addressList.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('No address Found, Please add a address'),
                            backgroundColor: Colors.red,
                          ));
                        } else {
                          showModalBottomSheet(
                            enableDrag: true,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
                            context: context,
                            builder: (context) => FutureBuilder(
                              future: ApiService().getShippingList(addressList.first.addressId.toString()),
                              builder: (context, AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  return Container(
                                    height: MediaQuery.of(context).size.height,
                                    width: MediaQuery.of(context).size.width,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          SizedBox(height: 20),
                                          //choose Courier
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 10),
                                            child: Row(
                                              children: [
                                                Text(
                                                  'Choose Courier',
                                                  style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade900, fontWeight: FontWeight.bold, fontSize: 16)),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          for (int i = 0; i < snapshot.data.length; i++)
                                            CourierOptions(
                                              function: () {
                                                Future.delayed(Duration(seconds: 2), () {
                                                  Navigator.pop(context, true);
                                                });
                                                setState(() {});
                                              },
                                              title: '${snapshot.data[i]['title']}',
                                              cost: '${snapshot.data[i]['cost']}',
                                              code: '${snapshot.data[i]['code']}',
                                              // regularPrice: '150',
                                            ),
                                          // CourierOptions(
                                          //   title: 'FedEX',
                                          //   expressPrice: '70',
                                          //   regularPrice: '150',
                                          // ),
                                          // CourierOptions(
                                          //   title: 'other',
                                          //   expressPrice: '70',
                                          //   regularPrice: '150',
                                          // ),
                                        ],
                                      ),
                                    ),
                                  );
                                } else {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              },
                            ),
                          );
                        }
                      },
                      child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Colors.grey.shade300, spreadRadius: 1)], borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.local_shipping, color: Colors.blue.shade900, size: 25),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    Provider.of<BadgesModel>(context).selectedCourier == '' ? "Choose delivery" : Provider.of<BadgesModel>(context).selectedCourier,
                                    style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade600, fontSize: 14)),
                                  ),
                                ],
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.grey.shade400,
                                  size: 15,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Container(
                          // height: 220,width: MediaQuery.of(context).size.width - 20,
                          child: FutureBuilder<CarttotalModel>(
                            future: ApiService().getTotalCart(),
                            builder: (context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                totalbillamount = snapshot.data.totals[3].text;
                                return Column(
                                  children: [
                                    for (int i = 0; i < snapshot.data.totals.length; i++)
                                      Row(
                                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            snapshot.data.totals[i].title,
                                            style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14)),
                                          ),
                                          Spacer(),
                                          Text(
                                            snapshot.data.totals[i].text,
                                            style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 14)),
                                          ),
                                        ],
                                      ),
                                  ],
                                );
                              }
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                          ),
                        ),
                        //pay button
                        Container(
                          // height: 220,
                          width: MediaQuery.of(context).size.width - 20,
                          child: InkWell(
                            onTap: () {
                              if (addressList.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text('No address Found, Please add a address'),
                                  backgroundColor: Colors.red,
                                ));
                              } else {
                                Navigator.of(context).push(
                                  PageRouteBuilder(
                                    transitionDuration: Duration(seconds: 1),
                                    transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation, Widget child) {
                                      animation = CurvedAnimation(parent: animation, curve: Curves.linear);
                                      return SharedAxisTransition(child: child, animation: animation, secondaryAnimation: secAnimation, transitionType: SharedAxisTransitionType.horizontal);
                                    },
                                    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation) {
                                      return Payment(
                                        int.parse(addressList.first.addressId),
                                        totalbillamount,
                                      );
                                    },
                                  ),
                                );
                              }
                            },
                            child: Center(
                              child: Container(
                                height: 40,
                                width: MediaQuery.of(context).size.width - 20,
                                decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(4)),
                                child: Center(
                                  child: Text(
                                    'Pay',
                                    style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CourierOptions extends StatelessWidget {
  CourierOptions({
    Key? key,
    required this.cost,
    this.code,
    required this.title,
    required this.function,
  }) : super(key: key);

  final String title;
  final String? code;
  final String cost;
  final function;

  Color iconColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<BadgesModel>(context, listen: false).updateSelectedCourier(title);
        Provider.of<BadgesModel>(context, listen: false).updateShippingMethod(code);
        function();

        // dely of 10 seconds
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(color: Colors.grey.shade800, fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
                Icon(
                  Icons.check_circle_outline,
                  color: Provider.of<BadgesModel>(
                    context,
                  ).selectedCourier ==
                      title
                      ? Colors.greenAccent
                      : iconColor,
                )
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
                  'Code',
                  style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade700, fontSize: 14)),
                ),
                Text(
                  '$code',
                  style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade700, fontSize: 14)),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Cost',
                  style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade700, fontSize: 14)),
                ),
                Text(
                  '₹ $cost',
                  style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade700, fontSize: 14)),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(height: 1, color: Colors.grey.shade300),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
