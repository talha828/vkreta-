import 'package:animations/animations.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:vkreta/allnotifications.dart';
import 'package:vkreta/lowtohighprice.dart';
import 'package:vkreta/notifications.dart';
import 'package:vkreta/productdisplay.dart';

import 'package:vkreta/viewall.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget commonBottomSheets({
    BuildContext? context,
    Widget? widget,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context!).viewInsets.bottom),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: 4,
            width: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 18,
            ),
            padding: EdgeInsets.only(
              // top: ResponsiveFlutter.of(context).moderateScale(5),
              bottom: 20,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: widget!,
          ),
        ],
      ),
    );
  }

  openBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isDismissible: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => commonBottomSheets(
        context: context,
        widget: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: Colors.grey.withOpacity(0.1),
              width: MediaQuery.of(context).size.width,
              padding:const EdgeInsets.symmetric(vertical: 16),
              child: Center(
                child:const Text(
                  "CHOOSE YOUR LOCATION",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Container(
              margin:const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1), borderRadius: BorderRadius.circular(5)),
              width: double.infinity,
              padding:const EdgeInsets.all(14),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/ic_home.png",
                    height: 18,
                    width: 18,
                  ),
                  const SizedBox(width: 6),
                  const Expanded(
                    child: Text(
                      "SELECT ADDRESS",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin:const EdgeInsets.only(bottom: 30, left: 20, right: 20),
              decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1), borderRadius: BorderRadius.circular(5)),
              width: double.infinity,
              padding:const EdgeInsets.all(14),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/ic_pincode.png",
                    height: 18,
                    width: 18,
                  ),
                  SizedBox(width: 6),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "PIN CODE",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Enter a pincode",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 6),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 44,
                                child: TextField(
                                  controller: TextEditingController(),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    contentPadding: EdgeInsets.all(10),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Container(
                              height: 44,
                              width: 100,
                              color: Colors.blue,
                              child: Center(
                                child: Text(
                                  "LOGIN",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 30, left: 20, right: 20),
              decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1), borderRadius: BorderRadius.circular(5)),
              width: double.infinity,
              padding: EdgeInsets.all(14),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/location.png",
                    height: 18,
                    width: 18,
                  ),
                  SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      "USE MY CURRENT LOCATION",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
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
  var onTap=(){};
  var viewAll=(){};
  @override
  Widget build(BuildContext context) {
    var width =MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: width * 0.04,
              ),
              Padding(
                padding: EdgeInsets.all(width * 0.04),
                child: Container(
                  height: width * 0.12,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.grey.shade600,
                                size: width * 0.07,
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

                      IconButton(
                          onPressed: () {
                             Navigator.of(context).push(PageRouteBuilder(
                          transitionDuration:const Duration(seconds: 1),
                          transitionsBuilder: (BuildContext context,
                              Animation<double> animation,
                              Animation<double> secAnimation,
                              Widget child) {
                            animation = CurvedAnimation(
                                parent: animation, curve: Curves.linear);
                            return SharedAxisTransition(
                                child: child,
                                animation: animation,
                                secondaryAnimation: secAnimation,
                                transitionType:
                                    SharedAxisTransitionType.horizontal);
                          },
                          pageBuilder: (BuildContext context,
                              Animation<double> animation,
                              Animation<double> secAnimation) {
                            return const AllNotifications();
                          }));
                          },
                          icon: Icon(
                            Icons.notifications,
                            color: Colors.black,
                            size: width * 0.06,
                          ))
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal:width * 0.028),
                child: InkWell(
                  onTap:(){

                  },
                  child: Container(
                    height:width * 0.14,
                    width:MediaQuery.of(context).size.width,
                    decoration:BoxDecoration(
                      color:Colors.blue,
                      borderRadius:BorderRadius.circular(5)
                    ),
                    child:Row(
                      children:[
                        SizedBox(width:width * 0.02),
                        Icon(Icons.room,color:Colors.white,size:width * 0.05),
                        SizedBox(width:width * 0.04),
                         Text(
                          'Deliver to shanti - Uklana Mnadi 125436',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: width * 0.035,
                                  )),
                        ),
                      ]
                    )
                  ),
                ),
              ),
              SizedBox(
                height: 100,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index){
                  return CategoryButton(onTap: (){
                    Navigator.of(context).push(PageRouteBuilder(
                        transitionDuration:const Duration(seconds: 1),
                        transitionsBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secAnimation,
                            Widget child) {
                          animation = CurvedAnimation(
                              parent: animation, curve: Curves.linear);
                          return SharedAxisTransition(
                              child: child,
                              animation: animation,
                              secondaryAnimation: secAnimation,
                              transitionType:
                              SharedAxisTransitionType.horizontal);
                        },
                        pageBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secAnimation) {
                          return ViewAll(
                            title: 'Baby',
                          );
                        }));
                  }, width: width, list: list[index]);
                }, separatorBuilder: (context,index){
                  return SizedBox(width: width * 0.04,);
                }, itemCount: list.length),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Divider(
                  height: 1,
                  color: Colors.grey.shade500,
                ),
              ),
              CarouselSlider(
                  items:list.map((e) => Container(
                    margin: EdgeInsets.symmetric(vertical: width * 0.02),
                    width: width * 0.9,
                    height: width * 0.2,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(7),
                        boxShadow:const [
                          BoxShadow(
                            color: Colors.black38,
                            offset: Offset(-2,3),
                            blurRadius: 7
                          )
                        ]
                    ),
                      child: Image.asset(e.image),)).toList(),
                  options: CarouselOptions(
                    height: width * 0.45,
                    aspectRatio: 9/14,
                    viewportFraction: 1,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval:const Duration(seconds: 3),
                    autoPlayAnimationDuration:const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    onPageChanged: (ss,aa){},
                    scrollDirection: Axis.horizontal,
                  )
              ),
              SizedBox(
                height: width * 0.06,
              ),
              SingleChildScrollView(
                child: ListView.separated(
                  physics:const  NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context,index){
                  return ProductCart(width: width, title: title, viewAll: (){
                    Navigator.of(context).push(PageRouteBuilder(
                        transitionDuration: Duration(seconds: 1),
                        transitionsBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secAnimation,
                            Widget child) {
                          animation = CurvedAnimation(
                              parent: animation, curve: Curves.linear);
                          return SharedAxisTransition(
                              child: child,
                              animation: animation,
                              secondaryAnimation: secAnimation,
                              transitionType:
                              SharedAxisTransitionType.horizontal);
                        },
                        pageBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secAnimation) {
                          return ViewAll(
                            title:'Flash Sale',
                          );
                        }));
                  }, onTap: (){
                    Navigator.of(context).push(PageRouteBuilder(
                        transitionDuration:const Duration(seconds: 1),
                        transitionsBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secAnimation,
                            Widget child) {
                          animation = CurvedAnimation(
                              parent: animation, curve: Curves.linear);
                          return SharedAxisTransition(
                              child: child,
                              animation: animation,
                              secondaryAnimation: secAnimation,
                              transitionType:
                              SharedAxisTransitionType.horizontal);
                        },
                        pageBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secAnimation) {
                          return const ProductDisplay();
                        }));
                  }, product: product);
                }, separatorBuilder: (context,index){
                  return SizedBox(height: width * 0.15,);
                }, itemCount: 3),
              )
                    ],
                  ),
        ),
              )
    );
  }
  List<Category>list=[
    Category(image: "assets/baby.png",label: "Baby"),
    Category(image: "assets/beauty.png",label: "Beauty"),
    Category(image: "assets/food.png",label: "Foods"),
    Category(image: "assets/grocery.png",label: "Grocery"),
    Category(image: "assets/health.png",label: "Health"),
    Category(image: "assets/home.png",label: "Home"),
  ];
  List<Product>product=[
    Product(name: "Here is the title of your product", prices: "100", orderQuantity: "150", image: "assets/shoes.png", sales: "-60%"),
    Product(name: "Here is the title of your product", prices: "100", orderQuantity: "150", image: "assets/shoes.png", sales: "-60%"),
    Product(name: "Here is the title of your product", prices: "100", orderQuantity: "150", image: "assets/shoes.png", sales: "-60%"),
    Product(name: "Here is the title of your product", prices: "100", orderQuantity: "150", image: "assets/shoes.png", sales: "-60%"),
    Product(name: "Here is the title of your product", prices: "100", orderQuantity: "150", image: "assets/shoes.png", sales: "-60%"),
    Product(name: "Here is the title of your product", prices: "100", orderQuantity: "150", image: "assets/shoes.png", sales: "-60%"),
    Product(name: "Here is the title of your product", prices: "100", orderQuantity: "150", image: "assets/shoes.png", sales: "-60%"),
    Product(name: "Here is the title of your product", prices: "100", orderQuantity: "150", image: "assets/shoes.png", sales: "-60%"),
    Product(name: "Here is the title of your product", prices: "100", orderQuantity: "150", image: "assets/shoes.png", sales: "-60%"),
  ];
  String title="Flash sale";
}

class ProductCart extends StatefulWidget {
  const ProductCart({
    Key? key,
    required this.width,
    required this.title,
    required this.viewAll,
    required this.onTap,
    required this.product,
  }) : super(key: key);

  final double width;
  final String title;
  final Null Function() viewAll;
  final Null Function() onTap;
  final List<Product> product;

  @override
  State<ProductCart> createState() => _ProductCartState();
}

class _ProductCartState extends State<ProductCart> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: widget.width * 0.06),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: widget.width * 0.06,
                        fontWeight: FontWeight.bold)),
              ),
              GestureDetector(
                onTap:widget.viewAll,
                child: Text(
                  'View All',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Colors.blue.shade900,
                          fontSize: 12,
                          fontWeight: FontWeight.bold)),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: widget.width * 0.02,
        ),
        SizedBox(
          height: widget.width * 0.58,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 10,
              separatorBuilder: (context,index){
                return SizedBox(width: widget.width * 0.04,);
              },
              itemBuilder: (context,index){
            return Padding(
              padding: EdgeInsets.symmetric(vertical: widget.width * 0.01),
              child: Container(
                height: widget.width * 0.6,
                color: Colors.white,
                width: MediaQuery.of(context).size.width * 0.4,
                child:
                InkWell(
                      onTap: widget.onTap,
                      child: Container(
                        height: widget.width * 0.55,
                        width: widget.width * 0.4,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(7),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: Offset(-2, 5))
                            ]),
                        child: Stack(
                            children: [Column(
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  height: widget.width * 0.26,
                                  width: widget.width * 0.4,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Padding(
                                    padding: EdgeInsets.all(widget.width * 0.02),
                                    child: Image.asset(widget.product[0].image),
                                  ),
                                ),
                                Padding(
                                  padding:
                                  EdgeInsets.symmetric(horizontal: widget.width * 0.02),
                                  child: Text(
                                    widget.product[0].name,
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            color: Colors.grey.shade900,
                                            fontSize: widget.width * 0.04)),
                                  ),
                                ),
                                SizedBox(
                                  height: widget.width * 0.02,
                                ),
                                Padding(
                                  padding:
                                  EdgeInsets.symmetric(horizontal: widget.width * 0.02),
                                  child: Row(
                                    children: [
                                      Text(
                                        '₹ ${widget.product[0].prices}',
                                        style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: widget.width * 0.04)),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: widget.width * 0.01,
                                ),
                                Padding(
                                  padding:
                                  EdgeInsets.symmetric(horizontal: widget.width * 0.02),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                        size: widget.width * 0.04,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                        size: widget.width * 0.04,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                        size: widget.width * 0.04,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                        size: widget.width * 0.04,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                        size: widget.width * 0.04,
                                      ),
                                      SizedBox(
                                        width: widget.width * 0.02,
                                      ),
                                      Text(
                                        '(${widget.product[0].orderQuantity})',
                                        style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                                color: Colors.grey.shade500,
                                                fontSize: widget.width * 0.03)),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                              Padding(
                                padding: EdgeInsets.all(widget.width * 0.01),
                                child: Row(children: [
                                  Container(
                                      height: widget.width * 0.12,
                                      width: widget.width * 0.1,
                                      decoration:const BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(20))),
                                      child: Center(
                                        child: Text(
                                          widget.product[0].sales,
                                          style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                  color: Colors.white, fontSize: widget.width * 0.03)),
                                        ),
                                      ))
                                ]),
                              ),
                            ]
                        ),
                      ),
                    ),
              ),
            );
          }),
        )
      ],
    );
  }
}

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    Key? key,
    required this.onTap,
    required this.width,
    required this.list,
  }) : super(key: key);

  final Null Function() onTap;
  final double width;
  final Category list;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(width * 0.02),
      child: InkWell(
        onTap:onTap,
        child: Container(
          height: width * 0.2,
          width: width * 0.2,
          color: Colors.white,
          child: Column(children: [
            Container(
                height: width * 0.18,
                width: width * 0.22,
                child: Image.asset(list.image,fit: BoxFit.cover,scale: 5,)),
            SizedBox(
              height: width * 0.015,
            ),
            Text(
              list.label,
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontWeight: FontWeight.bold)),
            ),
          ]),
        ),
      ),
    );
  }
}

class Category{
  String image;
  String label;
  Category({required this.image, required this.label});
}

class Product{
  String name;
  String prices;
  String orderQuantity;
  String image;
  String sales;
  Product({required this.name,required this.prices,required this.orderQuantity,required this.image,required this.sales});
}