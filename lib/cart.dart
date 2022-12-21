import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quantity_input/quantity_input.dart';
import 'package:vkreta/delivery.dart';
import 'package:vkreta/models/cartlistModel.dart';
import 'package:vkreta/productdisplay.dart';
import 'package:vkreta/services/apiservice.dart';

import 'models/bages_model.dart';
import 'models/carttotalModel.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  // get product_id => null;
  List<int> simpleIntInput = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text(
          'Shopping Cart',
          style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 16)),
        ),
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder<CartlistModel>(
        future: ApiService().getCartItems(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
            for (int index = 0; index < snapshot.data.products.length; index++) {
              simpleIntInput.add(int.parse(snapshot.data.products[index].quantity));
            }
          }
          if (snapshot.hasData) {
            return Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      for (int index = 0; index < snapshot.data.products.length; index++)
                        InkWell(
                          onTap: (){
                            Navigator.of(context).push(PageRouteBuilder(
                                transitionDuration: Duration(seconds: 1),
                                transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation, Widget child) {
                                  animation = CurvedAnimation(parent: animation, curve: Curves.linear);
                                  return SharedAxisTransition(child: child, animation: animation, secondaryAnimation: secAnimation, transitionType: SharedAxisTransitionType.horizontal);
                                },
                                pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation) {
                                  return ProductDisplay(snapshot.data.products[index].productId);
                                }));
                          },
                          child: Container(
                            // height: 152,
                            padding: EdgeInsets.symmetric(vertical: 10),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      // height: 150,
                                      width: MediaQuery.of(context).size.width / 3.5,
                                      child: Column(
                                        children: [
                                          Container(
                                            // height: 120,
                                              color: Colors.white,
                                              width: MediaQuery.of(context).size.width / 3,
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Image.network(snapshot.data.products[index].thumb),
                                              )),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      // height: 130,
                                      width: MediaQuery.of(context).size.width / 1.4,
                                      color: Colors.white,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 10),
                                            child: Text(
                                              snapshot.data.products[index].name,
                                              // overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 14)),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 10),
                                            child: Row(
                                              children: [
                                                Text(
                                                  snapshot.data.products[index].price,
                                                  style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12)),
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
                                                Container(
                                                  height: 30,
                                                  width: 30,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadiusDirectional.circular(1),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey.shade300,
                                                        spreadRadius: 1,
                                                      ),
                                                    ],
                                                  ),
                                                  child: InkWell(
                                                    onTap: () async {
                                                      final delete = await ApiService().removeCartItems(int.parse(snapshot.data.products[index].cartId));
                                                      String? error = '';

                                                      if (delete.error != null) {
                                                        error = delete.error;
                                                      }
                                                      if (error != '') {
                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                          SnackBar(
                                                            content: Text(error!),
                                                            backgroundColor: Colors.red,
                                                          ),
                                                        );
                                                      }
                                                      if (delete.success != null) {
                                                        Provider.of<BadgesModel>(context, listen: false).updatecart(-1);
                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                          SnackBar(
                                                            content: Text('Item removed from cart'),
                                                            backgroundColor: Colors.green,
                                                          ),
                                                        );

                                                        setState(() {});
                                                      }
                                                    },
                                                    child: Center(
                                                      child: Icon(
                                                        Icons.delete,
                                                        color: Colors.grey.shade700,
                                                        size: 23,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    QuantityInput(
                                                      buttonColor: Colors.blue[900],
                                                      elevation: 0,
                                                      inputWidth: 40,
                                                      decimalDigits: 1,
                                                      value: simpleIntInput[index],
                                                      readOnly: true,
                                                      onChanged: (value) async {
                                                        print("value ------->> $value");

                                                        setState(() => simpleIntInput[index] = int.parse(value.replaceAll('', '')));

                                                        print("simpleIntInput[index] ------->> ${simpleIntInput[index]}");

                                                        final update = await ApiService().updateCartQuantity(
                                                          int.parse(snapshot.data.products[index].cartId),
                                                          simpleIntInput[index],
                                                        );

                                                        String? error = '';

                                                        if (update.error != null) {
                                                          error = update.error;
                                                        }
                                                        if (error != '') {
                                                          ScaffoldMessenger.of(context).showSnackBar(
                                                            SnackBar(
                                                              content: Text(error!),
                                                              backgroundColor: Colors.red,
                                                            ),
                                                          );
                                                        }
                                                        if (update.success != null) {
                                                          setState(() {});
                                                        }
                                                      },
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Divider(height: 2),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 10,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: Colors.grey.shade100),
                ),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      enableDrag: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      context: context,
                      builder: (context) => FutureBuilder(
                        future: ApiService().getCoupon(),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            return Container(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    SizedBox(height: 20),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Select Coupon',
                                            style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                color: Colors.grey.shade900,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    for (int i = 0; i < snapshot.data.couponList.length; i++)
                                      InkWell(
                                        onTap: () async {
                                          await ApiService().applyCoupon(snapshot.data.couponList[i].name);
                                          Navigator.pop(context);
                                          setState(() {});
                                        },
                                        borderRadius: BorderRadius.circular(10),
                                        child: Container(
                                          margin: EdgeInsets.all(10),
                                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                          decoration: BoxDecoration(
                                            color: i % 2 == 0 ? Colors.grey.shade100 : Colors.green.shade100,
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Column(
                                            children: [
                                              Text('Name:      ${snapshot.data.couponList[i].name}'),
                                              Text('Code:      ${snapshot.data.couponList[i].code}'),
                                              Text('Discount:      ${snapshot.data.couponList[i].discount}'),
                                            ],
                                          ),
                                        ),
                                      )
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
                  },
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade300,
                                  spreadRadius: 1,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.loyalty, color: Colors.blue.shade900, size: 25),
                                      SizedBox(width: 10),
                                      Text(
                                        'Use coupons',
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            color: Colors.grey.shade600,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.grey.shade400,
                                    size: 15,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              Container(
                                child: FutureBuilder<CarttotalModel>(
                                  future: ApiService().getTotalCart(),
                                  builder: (context, AsyncSnapshot snapshot) {
                                    if (snapshot.hasData) {
                                      return Column(
                                        children: [
                                          for (int i = 0; i < snapshot.data.totals.length; i++)
                                            Row(
                                              children: [
                                                Text(
                                                  snapshot.data.totals[i].title,
                                                  style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ),
                                                Spacer(),
                                                Text(
                                                  snapshot.data.totals[i].text,
                                                  style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                      color: Colors.red,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 14,
                                                    ),
                                                  ),
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
                              Container(
                                width: MediaQuery.of(context).size.width - 20,
                                margin: EdgeInsets.only(bottom: 20),
                                child: InkWell(
                                  onTap: () {
                                    if (snapshot.data.products.length != 0) {
                                      Navigator.of(context).push(
                                        PageRouteBuilder(
                                          transitionDuration: Duration(seconds: 1),
                                          transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation, Widget child) {
                                            animation = CurvedAnimation(parent: animation, curve: Curves.linear);
                                            return SharedAxisTransition(child: child, animation: animation, secondaryAnimation: secAnimation, transitionType: SharedAxisTransitionType.horizontal);
                                          },
                                          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation) {
                                            return Delivery();
                                          },
                                        ),
                                      );
                                    } else {
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                        content: Text('No card item found'),
                                        backgroundColor: Colors.red,
                                      ));
                                    }
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 100,
                                    decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(4)),
                                    child: Center(
                                      child: Text(
                                        'Next',
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
