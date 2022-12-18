import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vkreta/models/homemodel.dart';
import 'package:vkreta/productdisplay.dart';
import 'package:vkreta/services/apiservice.dart';

import 'home.dart';

class ViewAll extends StatefulWidget {
  String title;
  ViewAll({
    required this.title,
  });

  @override
  State<ViewAll> createState() => _ViewAllState();
}

class _ViewAllState extends State<ViewAll> {
  setOrder(String value) {
    setState(() {
      sortingOrder = value;
    });
  }

  String sortingOrder = "none";
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: width * 0.2,
          elevation: 0,
          actions: [
            Column(
              children: [
                PopupMenuButton(
                  icon: Icon(
                    FontAwesomeIcons.filter,
                    color: Colors.black,
                    size: width * 0.05,
                  ),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      //onTap:()=> setOrder("prices"),
                      child:Row(
                        children: [
                          Text(
                            'Brand',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: width * 0.035,
                                )),
                          ),
                        ],
                      ),),
                    PopupMenuItem(
                      //onTap:()=> setOrder("prices"),
                      child:Row(
                        children: [
                          Text(
                            'Discount',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: width * 0.035,
                                )),
                          ),
                        ],
                      ),),
                  ],
                ),
                Text(
                  'Filter',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: width * 0.035,
                  )),
                ),
              ],
            ),
            // SizedBox(width:10),

            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    right: width * 0.02,
                  ),
                  child: PopupMenuButton(
                    icon: Icon(
                      Icons.format_line_spacing,
                      color: Colors.black,
                      size: width * 0.06,
                    ),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                          onTap:()=> setOrder("prices"),
                          child:Row(
                            children: [
                              Text(
                                'High Price',
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: width * 0.035,
                                    )),
                              ),
                            ],
                          ),),
                      PopupMenuItem(
                        onTap:()=> setOrder("popularity"),
                        child:Row(
                          children: [
                            Text(
                              'Popularity',
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.035,
                                  )),
                            ),
                          ],
                        ),),
                      PopupMenuItem(
                        onTap:()=> setOrder("rating"),
                        child:Row(
                          children: [
                            Text(
                              'Rating',
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.035,
                                  )),
                            ),
                          ],
                        ),),
                    ],
                  ),
                ),
                Text(
                  'Sort',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: width * 0.035,
                  )),
                ),
              ],
            ),
          ],
          backgroundColor: Colors.white,
          title: Text(
            widget.title,
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: width * 0.05,
                    fontWeight: FontWeight.bold)),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: width * 0.06,
              )),
        ),
        backgroundColor: Colors.white,
        body: FutureBuilder<List<ProductInfo>>(
            future: ApiService().viewAll("bestseller", 1.toString()),
            builder: (context, snapshot) {
              if (ConnectionState.waiting == snapshot.connectionState) {
                return Container(
                    height: height,
                    width: width,
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator());
              }
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    children: [
                      Container(
                        height: width * 0.2,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          // boxShadow: [BoxShadow(
                          //   color: Colors.grey.shade100,spreadRadius: 5,
                          //   offset: Offset(0, 5)
                          // )]
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Colors.grey.shade600,
                                    size: 25,
                                  ),
                                  isDense: true,
                                  filled: true,
                                  fillColor: Colors.grey.shade100,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none),
                                  hintText: 'Search Product',
                                  hintStyle: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: Colors.grey.shade600,
                                          fontSize: width * 0.04))),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: width * 0.02,
                      ),
                      Divider(
                        height: 1,
                        color: Colors.grey.shade400,
                      ),
                      SizedBox(
                        height: width * 0.02,
                      ),
                      SizedBox(
                        height: width * 0.02,
                      ),
                      //ViewAllCard(onTap: onTap, width: width, product: product),
                      GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          addRepaintBoundaries: false,
                          addAutomaticKeepAlives: false,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.85,
                                  mainAxisSpacing: width * 0.04,
                                  crossAxisSpacing: width * 0.04),
                          itemBuilder: (context, index) {
                            List<ProductInfo> product =
                                sortList(sortingOrder, snapshot.data!);
                            return ViewAllCard(
                                onTap: () {
                                  Navigator.of(context).push(PageRouteBuilder(
                                      transitionDuration:
                                          const Duration(seconds: 1),
                                      transitionsBuilder: (BuildContext context,
                                          Animation<double> animation,
                                          Animation<double> secAnimation,
                                          Widget child) {
                                        animation = CurvedAnimation(
                                            parent: animation,
                                            curve: Curves.linear);
                                        return SharedAxisTransition(
                                            child: child,
                                            animation: animation,
                                            secondaryAnimation: secAnimation,
                                            transitionType:
                                                SharedAxisTransitionType
                                                    .horizontal);
                                      },
                                      pageBuilder: (BuildContext context,
                                          Animation<double> animation,
                                          Animation<double> secAnimation) {
                                        return ProductDisplay(0);
                                      }));
                                },
                                width: width,
                                product: product[index]);
                          })
                    ],
                  ),
                ),
              );
            }));
  }

  List<ProductInfo> sortList(String sortingOrder, List<ProductInfo> list) {
    switch (sortingOrder) {
      case "popularity":
        list.sort((a, b) =>
            int.parse(b.quantity!)!.compareTo(int.parse(a.quantity!)));
        break;
      case "prices":
        list.sort(
            (a, b) => double.parse(b.price!.toString().replaceAll("₹", "").replaceAll(",", ""))!.compareTo(double.parse(a.price!.toString().replaceAll("₹", "").replaceAll(",", ""))));
        break;
      case "Rating":
        list.sort((a, b) => int.parse(b.rating!.toString())!
            .compareTo(int.parse(a.rating!.toString())));
        break;
      case "none":
        break;
    }

    return list;
  }
}

class ViewAllCard extends StatelessWidget {
  const ViewAllCard({
    Key? key,
    required this.onTap,
    required this.width,
    required this.product,
  }) : super(key: key);

  final Null Function() onTap;
  final double width;
  final ProductInfo product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: width * 0.53,
        width: width * 0.4,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(7),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade200,
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(1, 3))
            ]),
        child: Stack(children: [
          Column(
            children: [
              SizedBox(
                height: width * 0.02,
              ),
              Container(
                height: width * 0.25,
                width: width * 0.4,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: EdgeInsets.all(
                    width * 0.02,
                  ),
                  child: Image.network(product.thumb!),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.02,
                ),
                child: Text(
                  product.name!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Colors.grey.shade900, fontSize: width * 0.04)),
                ),
              ),
              SizedBox(
                height: width * 0.015,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.02,
                ),
                child: Row(
                  children: [
                    Text(
                      product.price!,
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: width * 0.038)),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.02,
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.orange,
                      size: 15,
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.orange,
                      size: 15,
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.orange,
                      size: 15,
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.orange,
                      size: 15,
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.orange,
                      size: 15,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '(${product.quantity})',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: width * 0.03)),
                    ),
                  ],
                ),
              ),
            ],
          ),

          //Sales display
          //        Padding(
          //        padding: EdgeInsets.all( width * 0.02,),
          //        child: Row(children: [
          //          Container(
          // height: 25,
          // width: 40,
          // decoration:const  BoxDecoration(
          //     color: Colors.red,
          //     borderRadius: BorderRadius.only(
          //         bottomRight: Radius.circular(20))),
          // child: Center(
          //   child: Text(
          //     '-60%',
          //     style: GoogleFonts.poppins(
          //         textStyle:const TextStyle(
          //             color: Colors.white, fontSize: 10)),
          //   ),
          // ))
          //        ]),
          //      ),
        ]),
      ),
    );
  }
}
