import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:vkreta/changeaddress.dart';
import 'package:vkreta/modifyyouraddress.dart';
import 'package:vkreta/services/apiservice.dart';

import 'models/bages_model.dart';
import 'models/listaddressModel.dart';
import 'models/paymentmethodList.dart';

class Payment extends StatefulWidget {
  Payment(this.addressId, this.totalbillamount, {Key? key}) : super(key: key);
  int addressId;
  String totalbillamount;
  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  late Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  PaymentMethods? paymentMethods;
  int? newpaymentadress;
  ListAddressModel? address;
  @override
  Widget build(BuildContext context) {
    var width =MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back, color: Colors.black, size: width * 0.06)),
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text(
          'Payment',
          style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 16)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: width * 0.02,
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: width * 0.02),
              child: Row(
                children: [
                  Text(
                    'Summary',
                    style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: width * 0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Payment',
                    style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade700, fontSize: 14)),
                  ),
                  Text(
                    widget.totalbillamount,
                    style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade900, fontWeight: FontWeight.bold, fontSize: 14)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: width * 0.02,
            ),
            Container(
              height: width * 0.02,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey.shade100,
            ),
            SizedBox(
              height: width * 0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Payment Change',
                    style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade900, fontWeight: FontWeight.bold, fontSize: 16)),
                  ),
                  // GestureDetector(
                  //   onTap: () {
                  //     showModalBottomSheet(
                  //         enableDrag: true,
                  //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
                  //         context: context,
                  //         builder: (context) => Column(
                  //           children: [
                  //             SizedBox(
                  //               height: 15,
                  //             ),
                  //             Padding(
                  //               padding: const EdgeInsets.symmetric(horizontal: 10),
                  //               child: Row(
                  //                 children: [
                  //                   SizedBox(
                  //                     height: 30,
                  //                   ),
                  //                   Padding(
                  //                     padding: const EdgeInsets.symmetric(horizontal: 10),
                  //                     child: Text(
                  //                       'Payment Method',
                  //                       style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade900, fontWeight: FontWeight.bold, fontSize: 16)),
                  //                     ),
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //             SizedBox(
                  //               height: 25,
                  //             ),
                  //             Padding(
                  //               padding: const EdgeInsets.symmetric(horizontal: 20),
                  //               child: Divider(height: 1, color: Colors.grey.shade300),
                  //             ),
                  //             FutureBuilder(
                  //               future: ApiService().getPaymentMethod(widget.addressId.toString()),
                  //               builder: (context, AsyncSnapshot snapshot) {
                  //                 if (snapshot.hasData) {
                  //                   return ListView.builder(
                  //                       shrinkWrap: true,
                  //                       itemCount: snapshot.data.paymentMethodsList.length,
                  //                       itemBuilder: (context, index) {
                  //                         return InkWell(
                  //                           onTap: () {
                  //                             setState(() {
                  //                               paymentMethods = PaymentMethods(code: snapshot.data.paymentMethodsList[index].code, title: snapshot.data.paymentMethodsList[index].title);
                  //                             });
                  //
                  //                             Future.delayed(Duration(milliseconds: 500)).then((value) {
                  //                               Navigator.of(context).pop();
                  //                             });
                  //                           },
                  //                           borderRadius: BorderRadius.all(Radius.circular(12)),
                  //                           child: Container(
                  //                             padding: EdgeInsets.all(10),
                  //                             margin: EdgeInsets.all(10),
                  //                             decoration: BoxDecoration(
                  //                               borderRadius: BorderRadius.circular(12),
                  //                               color: Colors.grey.shade200,
                  //                             ),
                  //                             child: Column(
                  //                               children: [
                  //                                 Row(
                  //                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                                   children: [
                  //                                     Text('Code: ${snapshot.data.paymentMethodsList[index].code}'),
                  //                                     Icon(
                  //                                       Icons.check,
                  //                                       color: paymentMethods != null && paymentMethods?.code == snapshot.data.paymentMethodsList[index].code ? Colors.green : Colors.grey,
                  //                                     )
                  //                                   ],
                  //                                 ),
                  //                                 Row(
                  //                                   children: [
                  //                                     Text('Title:'),
                  //                                     Expanded(
                  //                                       child: Html(data: snapshot.data.paymentMethodsList[index].title),
                  //                                     ),
                  //                                   ],
                  //                                 ),
                  //                                 Padding(
                  //                                   padding: const EdgeInsets.symmetric(horizontal: 20),
                  //                                   child: Divider(height: 1, color: Colors.grey.shade300),
                  //                                 ),
                  //                               ],
                  //                             ),
                  //                           ),
                  //                         );
                  //                       });
                  //                 } else {
                  //                   return Center(
                  //                     child: CircularProgressIndicator(),
                  //                   );
                  //                 }
                  //               },
                  //             ),
                  //           ],
                  //         ));
                  //   },
                  //   child: Text(
                  //     'Change',
                  //     style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.blue.shade900, fontWeight: FontWeight.bold, fontSize: 13)),
                  //   ),
                  // ),
                ],
              ),
            ),
            SizedBox(
              height: width * 0.02,
            ),
          Column(
            children: [
              SizedBox(
                height: width * 0.03,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                child: Divider(height: 1, color: Colors.grey.shade300),
              ),
              FutureBuilder(
                future: ApiService().getPaymentMethod(widget.addressId.toString()),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data.paymentMethodsList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                paymentMethods = PaymentMethods(code: snapshot.data.paymentMethodsList[index].code, title: snapshot.data.paymentMethodsList[index].productId);
                              });
                            },
                            borderRadius: BorderRadius.all(Radius.circular(width * 0.02)),
                            child: Container(
                              padding: EdgeInsets.all(width * 0.02),
                              margin: EdgeInsets.all(width * 0.04),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(width * 0.02),
                                color: Colors.grey.shade200,
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Code: ${snapshot.data.paymentMethodsList[index].code}'),
                                      Icon(
                                        Icons.check,
                                        color: paymentMethods != null && paymentMethods?.code == snapshot.data.paymentMethodsList[index].code ? Colors.green : Colors.grey,
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Text('Title:'),
                                      Expanded(
                                        child: Html(data: snapshot.data.paymentMethodsList[index].productId),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20),
                                    child: Divider(height: 1, color: Colors.grey.shade300),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ],
          ),
            // paymentMethods != null
            //     ? Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 10),
            //   child: Container(
            //     padding: EdgeInsets.all(10),
            //     margin: EdgeInsets.all(10),
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(12),
            //       color: Colors.grey.shade200,
            //     ),
            //     child: Column(
            //       children: [
            //         Row(
            //           children: [
            //             Text('Code: ${paymentMethods?.code}'),
            //           ],
            //         ),
            //         Row(
            //           children: [
            //             Text('Title:'),
            //             Expanded(
            //               child: Html(data: paymentMethods?.title),
            //             ),
            //           ],
            //         ),
            //         Padding(
            //           padding: const EdgeInsets.symmetric(horizontal: 20),
            //           child: Divider(height: 1, color: Colors.grey.shade300),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            //
            //     : InkWell(
            //   child: TextButton(
            //     child: Text('Choose Payment Method'),
            //     onPressed: () {
            //       showModalBottomSheet(
            //           enableDrag: true,
            //           shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
            //           context: context,
            //           builder: (context) =>
            //               ;
            //     },
            //   ),
            // ),
            SizedBox(
              height: width * 0.02,
            ),
            address == null
                ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Do you want change billing address?',
                  style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade900, fontWeight: FontWeight.bold, fontSize: 12)),
                ),
                InkWell(
                  child: TextButton(
                    child:const  Text('Change'),
                    onPressed: () async {
                      address = await Navigator.push(context, MaterialPageRoute(builder: (context) =>const ModifyYourAddress()));
                      if (address != null) {
                        setState(()=> newpaymentadress = int.parse(address!.addressId!));
                      }
                    },
                  ),
                ),
              ],
            )
                : Padding(
              padding: EdgeInsets.only(left: width * 0.02, bottom: width * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Address',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          child: TextButton(
                            child: Text(
                              'Change',
                              style: TextStyle(color: Colors.blue.shade900, fontWeight: FontWeight.bold, fontSize: 13),
                            ),
                            onPressed: () async {
                              address = await Navigator.push(context, MaterialPageRoute(builder: (context) => const ChanegAddress()));
                              if (address != null) {
                                      setState(() {
                                        newpaymentadress =
                                            int.parse(address!.addressId!);
                                      });
                                    }
                                  },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Text(
                          address?.postcode ?? '',
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
                    width: width * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Text(
                          address?.address1 ?? '' + ' ${address?.address2 ?? ''}',
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
                    width: width * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Text(
                          address?.zone ?? '' + ' ${address?.city ?? ''}',
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
                    width: width * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Text(
                          address?.country ?? '',
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
                    width: width * 0.02,
                  ),
                ],
              ),
            ),

            //
            //
            //
            //
            //
            //
            //
            //
            //
            //pay button

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: InkWell(
                onTap: paymentMethods != null
                    ? () async {
                  if (paymentMethods!.code! != "cod") {
                    final response = await ApiService().getRazorPay();
                    double amount = double.parse(widget.totalbillamount.substring(1, widget.totalbillamount.length)) * 100;
                    callPayment(key: response['key_id'], email: Provider.of<BadgesModel>(context, listen: false).email, name: '', amount: amount.toString(), phone: '');
                  } else {
                    final order = await ApiService().addOrder(
                      newpaymentadress ?? widget.addressId,
                      widget.addressId,
                      paymentMethods!.code!,
                      Provider.of<BadgesModel>(context, listen: false).shipping_method,
                      'test',
                    );
                    String? error = '';

                    if (order.error != '') {
                      error = order.error;
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(error ?? ''),
                        backgroundColor: Colors.red,
                      ));
                    }

                    if (order.success != null) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('successfully'),
                        backgroundColor: Colors.green,
                      ));

                      setState(() {});
                    }
                  }
                }
                    : null,
                child: Container(
                  height: 45,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: Colors.blue.shade900, borderRadius: BorderRadius.circular(4)),
                  child: Center(
                    child: Text(
                      'Pay',
                      style: GoogleFonts.poppins(textStyle:const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  callPayment({String? key, String? amount, String? name, String? email, String? phone, String? orderId, String? contact}) async {
    var options = {
      'key': key,
      'amount': amount,
      'name': name,
      'description': 'Payment',
      'prefill': {'contact': contact, 'email': email}
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      print("razorpay error : $e");
    }
  }

  Future<void> _handlePaymentSuccess(PaymentSuccessResponse response) async {
    //Snackbar
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Payment Successful ${response.paymentId}\n${response.orderId}'),
      backgroundColor: Colors.green,
    ));
    final order = await ApiService().addOrder(
      newpaymentadress ?? widget.addressId,
      widget.addressId,
      paymentMethods!.code!,
      Provider.of<BadgesModel>(context, listen: false).shipping_method,
      'test',
    );
    String? error = '';

    if (order.error != '') {
      error = order.error;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(error ?? ''),
        backgroundColor: Colors.red,
      ));
    }

    if (order.success != null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('successfully'),
        backgroundColor: Colors.green,
      ));

      setState(() {});
    }
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    //Snackbar
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Payment Failed ${response.code} - ${response.message}'),
      backgroundColor: Colors.red,
    ));
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    //Snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('External Wallet ${response.walletName}'),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
