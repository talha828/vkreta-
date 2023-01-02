import 'package:animations/animations.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_badged/flutter_badge.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vkreta/return_policy.dart';
import 'package:vkreta/services/apiservice.dart';
import 'package:vkreta/showproduct.dart';
import 'Enterpincode.dart';
import 'allreviews.dart';
import 'cart.dart';
import 'helpsupport.dart';
import 'lowtohighprice.dart';
import 'models/bages_model.dart';
import 'models/productdetailModel.dart';

class ProductDisplay extends StatefulWidget {
  final int productId;
  ProductDisplay( this.productId, {Key? key}) : super(key: key);

  @override
  State<ProductDisplay> createState() => _ProductDisplayState();
}

class _ProductDisplayState extends State<ProductDisplay> {
  bool dis = false;

  check(String price, String special) {
    int p = int.parse(price.replaceAll( RegExp(r'[^\w\s]+'), ''));
    int sp = int.parse(special.replaceAll(RegExp(r'[^\w\s]+'), ''));
    double d = ((p - sp) / p) * 100;
    if (d.toInt() > 0) {
      dis = true;
    } else {
      dis = false;
    }
  }

  Color _iconColor = Colors.black;
  Map<String, String> selectedVariants = {};

  @override
  Widget build(BuildContext context) {
    var width =MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child:
        FutureBuilder<ProductDetailModel>(
          future: ApiService().getProductDetail(widget.productId),
          builder: (context, AsyncSnapshot<ProductDetailModel> snapshot) {
            print("snapshot ----------------------------->>$snapshot");
            print("snapshot.hasData --------------->>${snapshot.hasData}");

            if (snapshot.hasData) {
              check(snapshot.data!.price!, snapshot.data!.special!);

              return Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: width * 0.02),
                          child: ProductDisplayAppBar(width: width),
                        ),
                        Divider(
                          height: 1,
                          color: Colors.grey.shade300,
                        ),
                        Container(
                          height: width *0.8,
                          width: MediaQuery.of(context).size.width,
                          decoration:const BoxDecoration(color: Colors.white),
                          child: Stack(children: [
                            CarouselSlider(
                              options: CarouselOptions(height: width * 0.8),
                              items: [
                                for (int i = 0; i < snapshot.data!.images!.length; ++i)
                                  if (snapshot.data!.images![i].popup != null)
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.of(context).push(
                                            PageRouteBuilder(
                                              transitionDuration:const Duration(seconds: 1),
                                              transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation, Widget child) {
                                                animation = CurvedAnimation(parent: animation, curve: Curves.linear);
                                                return SharedAxisTransition(child: child, animation: animation, secondaryAnimation: secAnimation, transitionType: SharedAxisTransitionType.horizontal);
                                              },
                                              pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation) {
                                                return  ShoeProduct(
                                                    int.parse(snapshot.data!.productId!), snapshot.data!.headingTitle!, snapshot.data!.images![i].popup!
                                                );
                                              },
                                            ),
                                          );
                                        },
                                        child:
                                        Image(
                                          image: NetworkImage(snapshot.data!.images![i].popup!.toString()!="null"?snapshot.data!.images![i].popup!.toString():"https:///asd",
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    )
                              ],
                            ),
                            if (dis)
                              Padding(
                                padding: EdgeInsets.all(width * 0.03),
                                child: Row(children: [
                                  Container(
                                    height: width * 0.03,
                                    width: width * 0.06,
                                    decoration: const BoxDecoration(color: Colors.red, borderRadius: BorderRadius.only(bottomRight: Radius.circular(20))),
                                    child: Center(
                                      child: percentageCalc(snapshot.data!.price!, snapshot.data!.special!),
                                    ),
                                  ),
                                ]),
                              ),
                          ]),
                        ),
                        SizedBox(height: width * 0.01),
                        Padding(
                          padding:   EdgeInsets.symmetric(horizontal: width * 0.01),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  snapshot.data!.headingTitle!,
                                  maxLines: 4,
                                  style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: width * 0.05)),
                                ),
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
                              Row(children: [
                                Text(
                                  'MRP -',
                                  style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade700, fontSize: 14)),
                                ),
                                SizedBox(width: width * 0.01),
                                Container(
                                  height: width * 0.045,
                                  // width: 50,
                                  color: Colors.white,
                                  child: Stack(children: [
                                    Center(
                                      child: Text(
                                        snapshot.data!.price!.toString(),
                                        style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade700, fontSize: 14)),
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(height: 1, width: width * 0.03, color: Colors.grey.shade400),
                                      ],
                                    )
                                  ]),
                                ),
                                SizedBox(width: width * 0.03),
                                Container(
                                    height: width * 0.05,
                                    width: width * 0.08,
                                    decoration: BoxDecoration(color: Colors.blue.shade900, borderRadius: BorderRadius.circular(10)),
                                    child: Center(
                                      child: percentageCalc(snapshot.data!.price!.toString(), snapshot.data!.special!.toString()),
                                    )),
                                SizedBox(width: width * 0.03),
                                Text(
                                  'DISCOUNT',
                                  style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue.shade900, fontSize: 12)),
                                ),
                              ]),
                              //like button
                              IconButton(
                                  onPressed: () async {
                                    if (_iconColor == Colors.black) {
                                      //
                                      final addtowishlist = await ApiService().addtowishlist(int.parse(snapshot.data!.productId!.toString()));
                                      String? error = '';
                                      if (addtowishlist.error != null) {
                                        error = addtowishlist.error;
                                      }
                                      if (error != '') {
                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                          content: Text(error!),
                                          backgroundColor: Colors.red,
                                        ));
                                      }
                                      if (addtowishlist.success != null) {
                                        Provider.of<BadgesModel>(context, listen: false).updateWishList(1);
                                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                          content: Text('Item added to wishlist'),
                                          backgroundColor: Colors.green,
                                        ));

                                        setState(() {});
                                      }
                                      setState(() {
                                        _iconColor = Colors.red;
                                      });
                                    } else {
                                      final delete = await ApiService().removewishlistproduct(int.parse(snapshot.data!.productId!.toString()));

                                      String? error = '';

                                      if (delete.error != null) {
                                        error = delete.error;
                                      }

                                      if (error != '') {
                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                          content: Text(error!),
                                          backgroundColor: Colors.red,
                                        ));
                                      }
                                      if (delete.success != null) {
                                        Provider.of<BadgesModel>(context, listen: false).updateWishList(-1);
                                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                          content: Text('product delete successfully'),
                                          backgroundColor: Colors.green,
                                        ));

                                        setState(() {});
                                      }

                                      setState(() {
                                        _iconColor = Colors.black;
                                      });
                                    }
                                  },
                                  icon: Icon((Icons.favorite), color: _iconColor, size: width * 0.06)),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: width * 0.02,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                          child: Row(
                            children: [
                              Text(
                                snapshot.data!.special!.toString(),
                                style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: width * 0.05)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: width * 0.03,
                        ),
                        SizedBox(
                          height: width * 0.2,
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                            child: Text(
                              snapshot.data!.headingTitle!.toString(),
                              maxLines: 1,
                              style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 16)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: width * 0.02,
                        ),

                        if (snapshot.data!.options!.isNotEmpty && snapshot.data!.options!.length > 0)
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Variation',
                                      maxLines: 1,
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 16),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: width * 0.02,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      snapshot.data!.options![0].name.toString(),
                                      maxLines: 1,
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(color: Colors.grey.shade900, fontSize: width * 0.03),
                                      ),
                                    ),
                                  ],
                                ),
                                //pictures
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      for (int i = 0; i < snapshot.data!.options![0].productOptionValue!.length; i++)
                                        Padding(
                                          padding: EdgeInsets.all(width * 0.02),
                                          child: InkWell(
                                            borderRadius: BorderRadius.circular(7),
                                            onTap: () {
                                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                                return ProductDisplay(
                                                  int.parse(snapshot.data!.options![0].productOptionValue![i].productId.toString()),
                                                );
                                              }));
                                            },
                                            child: Column(
                                              children: [
                                                CircleAvatar(
                                                  radius: 35,
                                                  backgroundColor: Colors.grey.shade200,
                                                  backgroundImage: NetworkImage(snapshot.data!.options![0].productOptionValue![i].image.toString()),
                                                ),
                                                Text(snapshot.data!.options![0].productOptionValue![i].name.toString())
                                              ],
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                //Sizees
                                  //talha
                                for (int option = 1; option < snapshot.data!.options!.length; ++option)
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 10),
                                          child: Row(
                                            children: [
                                              Text(
                                                snapshot.data!.options![option].name!,
                                                style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14)),
                                              ),
                                              // Text(
                                              //   'XS',
                                              //   style: GoogleFonts.poppins(
                                              //       textStyle: TextStyle(
                                              //           color: Colors.grey.shade900,
                                              //           fontWeight: FontWeight.bold,
                                              //           fontSize: 14)),
                                              // ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 10),
                                          child: Row(
                                            children: [
                                              for (int optionValues = 0; optionValues < snapshot.data!.options![option].productOptionValue!.length; ++optionValues)
                                                InkWell(
                                                  onTap: () {
                                                    print(selectedVariants);
                                                    String product_option_id = snapshot.data!.options![option].productOptionId!;
                                                    String product_option_value_id = snapshot.data!.options![option].productOptionValue![optionValues].productOptionValueId!;
                                                    if (selectedVariants.containsKey(product_option_id)) {
                                                      selectedVariants[product_option_id] = product_option_value_id;
                                                    } else {
                                                      selectedVariants.addAll({product_option_id: product_option_value_id});
                                                    }
                                                    setState(() {});
                                                  },
                                                  child: Container(
                                                    // height: 35,
                                                    // width: 35,
                                                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                                    margin: const EdgeInsets.only(right: 5),
                                                    decoration: BoxDecoration(
                                                      color: selectedVariants.containsKey(snapshot.data!.options![option].productOptionId)
                                                          ? selectedVariants[snapshot.data!.options![option].productOptionId] == snapshot.data!.options![option].productOptionValue![optionValues].productOptionValueId
                                                          ? Colors.blue.shade900
                                                          : Colors.black26
                                                          : Colors.black26,
                                                      borderRadius: BorderRadiusDirectional.circular(7),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        snapshot.data!.options![option].productOptionValue![optionValues].name!,
                                                        style: GoogleFonts.poppins(textStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                      ],
                                    ),
                                  ),
                                // if ( snapshot.data!.options!.length == 2)
                                //   Column(
                                //     children: [
                                //       Row(
                                //         children: [
                                //           Text(
                                //             snapshot.data!.options![1].name.toString(),
                                //             maxLines: 1,
                                //             style: GoogleFonts.poppins(
                                //               textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 14),
                                //             ),
                                //           ),
                                //         ],
                                //       ),
                                //       //size list
                                //       Row(
                                //         children: [
                                //           for (int i = 0; i < snapshot.data!.options![1].productOptionValue!.length; i++)
                                //             Padding(
                                //               padding: EdgeInsets.all(width * 0.03),
                                //               child: InkWell(
                                //                 borderRadius: BorderRadius.circular(35),
                                //                 onTap: () {
                                //                   Navigator.push(context,
                                //                       MaterialPageRoute(
                                //                           builder: (context) {
                                //                     return ProductDisplay(
                                //                       int.parse(snapshot
                                //                           .data!
                                //                           .options![0]
                                //                           .productOptionValue![i]
                                //                           .productId!),
                                //                     );
                                //                   }));
                                //                 },
                                //                 child: Container(
                                //                   decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(12)),
                                //                   child: Padding(
                                //                     padding: EdgeInsets.all(width * 0.02),
                                //                     child: Text(snapshot.data!.options![1].productOptionValue![i].name.toString()),
                                //                   ),
                                //                 ),
                                //               ),
                                //             ),
                                //         ],
                                //       ),
                                //     ],
                                //   ),
                              ],
                            ),
                          ),

                        SizedBox(
                          height: width * 0.02,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.orange,
                                size: width * 0.05,
                              ),
                              Text(
                                snapshot.data!.rating.toString(),
                                style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade900, fontWeight: FontWeight.bold, fontSize: 14)),
                              ),
                              SizedBox(
                                width: width * 0.02,
                              ),
                              Text(
                                snapshot.data!.tabReview!.toString(),
                                style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade500, fontSize: 13)),
                              ),
                              SizedBox(
                                width: width * 0.02,
                              ),
                              Container(
                                width: 1,
                                height: width * 0.02,
                                color: Colors.grey.shade400,
                              ),
                              SizedBox(
                                width: width * 0.02,
                              ),
                              Text(
                                'sale ' + snapshot.data!.quantity!.toString(),
                                style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade500, fontSize: 13)),
                              ),
                              SizedBox(
                                width: width * 0.02,
                              ),
                              Container(
                                width: 1,
                                height: width * 0.02,
                                color: Colors.grey.shade400,
                              ),
                              SizedBox(
                                width: width * 0.02,
                              ),
                              Icon(
                                Icons.room,
                                color: Colors.grey.shade500,
                                size: width * 0.05,
                              ),
                              Text(
                                'Brooklyn',
                                style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade500, fontSize: 13)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: width * 0.02 ,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                          child: Row(children: [
                            Text(
                              'Product identification no :',
                              style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade800, fontSize: 13)),
                            ),
                            SizedBox(width: width * 0.02),
                            Text(
                              snapshot.data!.productId.toString(),
                              style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: width * 0.04)),
                            ),
                          ]),
                        ),
                        SizedBox(
                          height: width * 0.02,
                        ),
                        Container(
                          height: width * 0.02,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.grey.shade100,
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
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                            Text(
                              'Enter your pin code to check availability',
                              style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade900, fontSize: 11)),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(PageRouteBuilder(
                                    transitionDuration:const Duration(seconds: 1),
                                    transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation, Widget child) {
                                      animation = CurvedAnimation(parent: animation, curve: Curves.linear);
                                      return SharedAxisTransition(child: child, animation: animation, secondaryAnimation: secAnimation, transitionType: SharedAxisTransitionType.horizontal);
                                    },
                                    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation) {
                                      return const EnterPinCode();
                                    }));
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: width * 0.02,horizontal: width * 0.02),
                                decoration: BoxDecoration(color: Colors.blue.shade900, borderRadius: BorderRadius.circular(7)),
                                child: Center(
                                  child: Text(
                                    'Enter Pin Code',
                                    style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 12)),
                                  ),
                                ),
                              ),
                            ),
                          ]),
                        ),
                        SizedBox(height: width * 0.02),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [

                          ]),
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
                          height:  width * 0.02,
                        ),
                        Container(
                          height:  width * 0.2,
                          alignment: Alignment.centerLeft,
                          child: ListView.builder(
                            itemCount: snapshot.data!.specialSection!.length,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            padding: EdgeInsets.symmetric(horizontal:  width * 0.02),
                            physics:const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                if (snapshot.data!.specialSection![index].description != null) {
                                  Navigator.of(context).push(
                                    PageRouteBuilder(
                                      transitionDuration:const Duration(seconds: 1),
                                      transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation, Widget child) {
                                        animation = CurvedAnimation(parent: animation, curve: Curves.linear);
                                        return SharedAxisTransition(child: child, animation: animation, secondaryAnimation: secAnimation, transitionType: SharedAxisTransitionType.horizontal);
                                      },
                                      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation) {
                                        return ReturnPolicy(snapshot.data!.specialSection![index].title!, snapshot.data!.specialSection![index].description!);
                                      },
                                    ),
                                  );
                                }
                              },
                              child: Container(
                                height:  width * 0.03,
                                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                                color: Colors.white,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height:  width * 0.12,
                                      width:  width * 0.15,
                                      child: Image.network(
                                        snapshot.data!.specialSection![index].image!,
                                        // color:Colors.blue,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    const SizedBox(height: 1),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          snapshot.data!.specialSection![index].title!,
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              // fontWeight: FontWeight.bold,
                                              color: Colors.grey.shade700,
                                              fontSize:  width * 0.03,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                         SizedBox(
                          height:  width * 0.02,
                        ),
                        Container(
                          height: 10,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.grey.shade100,
                        ),

                        SizedBox(
                          height:  width * 0.02,
                        ),

                        //section variants
                        // if (snapshot.data!.options!.length > 0)
                        //   Column(
                        //     children: [
                        //       Padding(
                        //         padding: const EdgeInsets.symmetric(horizontal: 10),
                        //         child: Row(
                        //           children: [
                        //             Text(
                        //               'Variants',
                        //               style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade900, fontWeight: FontWeight.bold, fontSize: 16)),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //       SizedBox(
                        //         height: 15,
                        //       ),
                        //
                        //     ],
                        //   ),

                        Container(
                          height:  width * 0.02,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.grey.shade100,
                        ),
                        SizedBox(
                          height:  width * 0.02,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal:  width * 0.02),
                          child: Row(children: [
                            Text(
                              'SELLER NAME :',
                              style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade800, fontSize: 13)),
                            ),
                            SizedBox(width:  width * 0.02),
                            Text(
                              snapshot.data!.sellerDetail!.sellerName ?? "no Name",
                              style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue.shade900, fontSize: 13)),
                            ),
                          ]),
                        ),
                        SizedBox(
                          height:  width * 0.02,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal:  width * 0.02),
                          child: Row(children: [
                            Text(
                              'SELLER RATING:',
                              style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade800, fontSize: 13)),
                            ),
                            SizedBox(width:  width * 0.02),
                            Text(
                              snapshot.data!.sellerDetail!.sellerRating ?? "no ratig",
                              style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue.shade900, fontSize: 13)),
                            ),
                          ]),
                        ),
                        SizedBox(
                          height:  width * 0.02,
                        ),
                        Padding(
                          padding:   EdgeInsets.symmetric(horizontal:  width * 0.02),
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                            Row(
                              children: [
                                Text(
                                  'SELLER COUNT:',
                                  style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade800, fontSize: 13)),
                                ),
                                SizedBox(width:  width * 0.02),
                                Text(
                                  snapshot.data!.sellerDetail!.otherSellerCount.toString(),
                                  style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue.shade900, fontSize: 13)),
                                ),
                              ],
                            ),
                            int.parse(snapshot.data!.sellerDetail!.otherSellerCount!) != 0
                                ? InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  PageRouteBuilder(
                                    transitionDuration:const Duration(seconds: 1),
                                    transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation, Widget child) {
                                      animation = CurvedAnimation(parent: animation, curve: Curves.linear);
                                      return SharedAxisTransition(child: child, animation: animation, secondaryAnimation: secAnimation, transitionType: SharedAxisTransitionType.horizontal);
                                    },
                                    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation) {
                                      return const LowToHighPrice(
                                          //snapshot.data!.productId!.toString()
                                      );
                                    },
                                  ),
                                );
                              },
                              child: Row(
                                children: [
                                  Text(
                                    'view all',
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue.shade900,
                                        fontSize:  width * 0.02,
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_right,
                                    color: Colors.blue.shade900,
                                    size:  width * 0.02,
                                  ),
                                ],
                              ),
                            )
                                : Container(),
                          ]),
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

                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              PageRouteBuilder(
                                transitionDuration:const Duration(seconds: 1),
                                transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation, Widget child) {
                                  animation = CurvedAnimation(parent: animation, curve: Curves.linear);
                                  return SharedAxisTransition(child: child, animation: animation, secondaryAnimation: secAnimation, transitionType: SharedAxisTransitionType.horizontal);
                                },
                                pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation) {
                                  return ReturnPolicy('Description', snapshot.data!.description!);
                                },
                              ),
                            );
                          },
                          child: Container(
                            height: width * 0.12,
                            width: MediaQuery.of(context).size.width * 0.9,
                            padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey.shade100,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Description',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: Colors.grey.shade900,
                                      fontWeight: FontWeight.bold,
                                      fontSize: width * 0.04,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.black,
                                  size: width * 0.06,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: width * 0.02,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              PageRouteBuilder(
                                transitionDuration:const Duration(seconds: 1),
                                transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation, Widget child) {
                                  animation = CurvedAnimation(parent: animation, curve: Curves.linear);
                                  return SharedAxisTransition(child: child, animation: animation, secondaryAnimation: secAnimation, transitionType: SharedAxisTransitionType.horizontal);
                                },
                                pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation) {
                                  return const AllReviews(
                                      //snapshot.data!.productId!
                                  );
                                },
                              ),
                            );
                          },
                          child: Container(
                            height: width * 0.12,
                            width: MediaQuery.of(context).size.width * 0.9,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey.shade100,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Reviews',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: Colors.grey.shade900,
                                      fontWeight: FontWeight.bold,
                                      fontSize: width * 0.04,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.black,
                                  size: width * 0.06,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: width * 0.02,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              PageRouteBuilder(
                                transitionDuration:const Duration(seconds: 1),
                                transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation, Widget child) {
                                  animation = CurvedAnimation(parent: animation, curve: Curves.linear);
                                  return SharedAxisTransition(child: child, animation: animation, secondaryAnimation: secAnimation, transitionType: SharedAxisTransitionType.horizontal);
                                },
                                pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation) {
                                  return ReturnPolicy('Disclaimer', snapshot.data!.disclaimer!);
                                },
                              ),
                            );
                          },
                          child: Container(
                            height: width * 0.12,
                            width: MediaQuery.of(context).size.width * 0.9,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey.shade100,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Disclaimer',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: Colors.grey.shade900,
                                      fontWeight: FontWeight.bold,
                                      fontSize: width * 0.04,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.black,
                                  size: width * 0.06,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: width * 0.02,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              PageRouteBuilder(
                                transitionDuration:const Duration(seconds: 1),
                                transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation, Widget child) {
                                  animation = CurvedAnimation(parent: animation, curve: Curves.linear);
                                  return SharedAxisTransition(child: child, animation: animation, secondaryAnimation: secAnimation, transitionType: SharedAxisTransitionType.horizontal);
                                },
                                pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation) {
                                  return ReturnPolicy('Return Policy', snapshot.data!.returnPolicy!);
                                },
                              ),
                            );
                          },
                          child: Container(
                            height: width * 0.12,
                            width: MediaQuery.of(context).size.width * 0.9,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey.shade100,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Return Policy',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: Colors.grey.shade900,
                                      fontWeight: FontWeight.bold,
                                      fontSize: width * 0.04,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.black,
                                  size: width * 0.06,
                                ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(height: width * 0.25),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: width * 0.2,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Colors.grey.shade200, spreadRadius: 1)]),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(PageRouteBuilder(
                                      transitionDuration:const Duration(seconds: 1),
                                      transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation, Widget child) {
                                        animation = CurvedAnimation(parent: animation, curve: Curves.linear);
                                        return SharedAxisTransition(child: child, animation: animation, secondaryAnimation: secAnimation, transitionType: SharedAxisTransitionType.horizontal);
                                      },
                                      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation) {
                                        return const HelpSupport();
                                      }));
                                },
                                child: Container(
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                      color: Colors.blue.shade900,
                                      shape: BoxShape.circle,
                                    ),
                                    child:const Center(
                                        child: Icon(
                                          Icons.chat,
                                          color: Colors.white,
                                          size: 20,
                                        ))),
                              ),
                              const SizedBox(width: 10),
                              InkWell(
                                onTap: () async {
                                  final addcart = await ApiService().AddToCart(int.parse(snapshot.data!.productId!.toString()), 1, selectedVariants);
                                  String? error = '';
                                  // print(signUp.firstname);
                                  // signUp.then((value){
                                  if (addcart.error != null) {
                                    error = addcart.error;
                                  }
                                  if (error != '') {
                                    // print('1');
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                      content: Text(error!),
                                      backgroundColor: Colors.red,
                                    ));
                                    // print('2');
                                  }

                                  if (addcart.success != null) {
                                    // print('3');
                                    Provider.of<BadgesModel>(context, listen: false).updatecart(1);
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                      content: Text('Item added to cart'),
                                      backgroundColor: Colors.green,
                                    ));
                                    // print('4');

                                  }
                                },
                                child: Container(
                                  height: 35,
                                  width: MediaQuery.of(context).size.width / 1.3,
                                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(1), boxShadow: [BoxShadow(color: Colors.blue.shade900, spreadRadius: 1)]),

                                  //title
                                  child: Center(
                                    child: Text(
                                      'Add to cart',
                                      style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.blue.shade900, fontWeight: FontWeight.bold, fontSize: 14)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }
            else if(snapshot.hasError){
              return Text(snapshot.error.toString()+"error");
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

  Widget percentageCalc(String price, String speical) {
    int disc;
    int p = int.parse(price.replaceAll(new RegExp(r'[^\w\s]+'), ''));
    int sp = int.parse(speical.replaceAll(new RegExp(r'[^\w\s]+'), ''));
    print("sp ------------>> $sp");
    if (sp > 0) {
      double d = ((p - sp) / p) * 100;
      disc = d.toInt();
      return Text(
        disc.toString() + "%",
        style: TextStyle(
          color: Colors.white,
        ),
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}

class ProductDisplayAppBar extends StatelessWidget {
  const ProductDisplayAppBar({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: width * 0.15,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: width * 0.04,
              )),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey.shade600,
                    size: width * 0.04,
                  ),
                  isDense: true,
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                  hintText: 'Search Product',
                  hintStyle: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade600, fontSize: 14))),
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(PageRouteBuilder(
                  transitionDuration:const Duration(seconds: 1),
                  transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation, Widget child) {
                    animation = CurvedAnimation(parent: animation, curve: Curves.linear);
                    return SharedAxisTransition(child: child, animation: animation, secondaryAnimation: secAnimation, transitionType: SharedAxisTransitionType.horizontal);
                  },
                  pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation) {
                    return const Cart();
                  }));
            },
            icon: FlutterBadge(
              itemCount: Provider.of<BadgesModel>(
                context,
              ).cartCount,
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.grey.shade700,
                size: width * 0.05,
              ),
              textSize: width * 0.04,
              badgeColor: Colors.blue.shade400,
              borderRadius: width * 0.03,
            ),
          )
        ],
      ),
    );
  }
}
