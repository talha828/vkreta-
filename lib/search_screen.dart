import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vkreta/fliter_screen.dart';
import 'package:vkreta/getx_controllers/homepage.dart';
import 'package:vkreta/models/productsearchModel.dart';
import 'package:vkreta/models/searchModel.dart';
import 'package:vkreta/productdisplay.dart';
import 'package:vkreta/services/apiservice.dart';

import 'allnotifications.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final controller=Get.put(ProductSearchModelController());

  Future<SearchModel>getSearch(String key)async{
    setLoading(true);
    SearchModel search=await ApiService().getProductSearch(search: key).then((value){
    controller.product.value=value;
    controller.exist.value=true;
    setLoading(false);
      return value;
    });
    return search;
  }

  setLoading(bool value){
    setState(() {
      isLoading=value;
    });
  }
   bool isLoading=false;
   final TextEditingController _search = TextEditingController();

   @override
  void initState() {
    controller.exist.value=false;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    ProductSearchModelController snapshot=controller;
    var width =MediaQuery.of(context).size.width;
    return SafeArea(
        child:Scaffold(
         body: SingleChildScrollView(
           child: Column(
             children: [
               Padding(
                 padding: EdgeInsets.all(width * 0.04),
                 child: SizedBox(
                   height: width * 0.12,
                   width: MediaQuery.of(context).size.width,
                   child: Row(
                     children: [
                       Expanded(
                         child: TextFormField(
                           controller: _search,
                           textInputAction: TextInputAction.search,
                           onFieldSubmitted: (value) {
                             getSearch(value.trim().toString());
                           },
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
                               borderSide: BorderSide.none,
                             ),
                             hintText: 'Search Product',
                             hintStyle: GoogleFonts.poppins(
                               textStyle: TextStyle(
                                 color: Colors.grey.shade600,
                                 fontSize: 14,
                               ),
                             ),
                           ),
                         ),
                       ),

                       IconButton(
                           onPressed: () {
                           if(controller.exist.value){
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
                                   return const FilterScreen();
                                 }));
                           }else{
                             Fluttertoast.showToast(msg: "No Search to filter results");
                           }
                           },
                           icon: Icon(
                             Icons.filter_list_alt,
                             color: Colors.black,
                             size: width * 0.06,
                           ))
                     ],
                   ),
                 ),
               ),
               const Divider(),
               Stack(
                 children: [
                   if (snapshot.exist.value) Padding(
                     padding:  EdgeInsets.symmetric(horizontal: width * 0.04),
                     child: GridView.count(
                       crossAxisSpacing: width * 0.04,
                       mainAxisSpacing: width * 0.04,
                       physics:const NeverScrollableScrollPhysics(),
                       childAspectRatio: 0.75,
                       shrinkWrap: true,
                       crossAxisCount: 2,
                       children: snapshot.product.value.products!.map((e)=>
                           Padding(
                             padding: EdgeInsets.symmetric(vertical:width * 0.01),
                             child: Container(
                               height: width * 0.5,
                               color: Colors.white,
                               width: MediaQuery.of(context).size.width * 0.4,
                               child:
                               InkWell(
                                 onTap: (){
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
                                         return  ProductDisplay(int.parse(e.productId!));
                                       }));
                                 },
                                 child: Container(
                                   height: width * 0.55,
                                   width: width * 0.4,
                                   decoration: BoxDecoration(
                                     color: Colors.white,
                                     border: Border.all(color: Colors.grey.withOpacity(0.5)),
                                     borderRadius: BorderRadius.circular(7),
                                     // boxShadow: const [
                                     //   BoxShadow(
                                     //       color: Colors.grey,
                                     //       spreadRadius: 1,
                                     //       blurRadius: 2,
                                     //       offset: Offset(-2, 5))
                                     // ]
                                   ),
                                   child: Stack(
                                       children: [
                                         Column(
                                           children: [
                                             const SizedBox(
                                               height: 5,
                                             ),
                                             Container(
                                               height: width * 0.36,
                                               width: width * 0.4,
                                               decoration: BoxDecoration(
                                                   borderRadius: BorderRadius.circular(20)),
                                               child: Padding(
                                                 padding: EdgeInsets.all(width * 0.02),
                                                 child: ClipRRect(
                                                   borderRadius: BorderRadius.circular(7),
                                                   child: Image.network(e.thumb2!.toString()=='null'?"https://dfdsf":e.thumb2!,
                                                     fit: BoxFit.fill,
                                                     errorBuilder: (context,object,straeTree){
                                                       return Icon(Icons.image,color: Colors.grey,size: width * 0.06,);
                                                     },
                                                   ),
                                                 ),
                                               ),
                                             ),
                                             Padding(
                                               padding:
                                               EdgeInsets.symmetric(horizontal: width * 0.02),
                                               child: Text(
                                                 e.name!,
                                                 maxLines: 2,
                                                 overflow: TextOverflow.ellipsis,
                                                 style: GoogleFonts.poppins(
                                                     textStyle: TextStyle(
                                                         color: Colors.grey.shade900,
                                                         fontSize: width * 0.03)),
                                               ),
                                             ),
                                             SizedBox(
                                               height: width * 0.01,
                                             ),
                                             Padding(
                                               padding:
                                               EdgeInsets.symmetric(horizontal: width * 0.01),
                                               child: Row(
                                                 children: [
                                                   Text(
                                                     e.price!,
                                                     style: GoogleFonts.poppins(
                                                         textStyle: TextStyle(
                                                             color: Colors.black,
                                                             fontWeight: FontWeight.bold,
                                                             fontSize: width * 0.035)),
                                                   ),
                                                 ],
                                               ),
                                             ),
                                             SizedBox(
                                               height: width * 0.01,
                                             ),
                                           ],
                                         ),
                                         // Padding(
                                         //   padding: EdgeInsets.all(widget.width * 0.01),
                                         //   child: Row(children: [
                                         //     Container(
                                         //         height: widget.width * 0.12,
                                         //         width: widget.width * 0.1,
                                         //         decoration:const BoxDecoration(
                                         //             color: Colors.red,
                                         //             borderRadius: BorderRadius.only(
                                         //                 bottomRight: Radius.circular(20))),
                                         //         child: Center(
                                         //           child: Text(
                                         //             widget.product![0].special!,
                                         //             style: GoogleFonts.poppins(
                                         //                 textStyle: TextStyle(
                                         //                     color: Colors.white, fontSize: widget.width * 0.03)),
                                         //           ),
                                         //         ))
                                         //   ]),
                                         // ),
                                       ]
                                   ),
                                 ),
                               ),
                             ),
                           )
                     // InkWell(
                     //   onTap: (){
                     //     Navigator.of(context).push(
                     //       PageRouteBuilder(
                     //         transitionDuration:const Duration(seconds: 1),
                     //         transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation, Widget child) {
                     //           animation = CurvedAnimation(
                     //             parent: animation,
                     //             curve: Curves.linear,
                     //           );
                     //           return SharedAxisTransition(
                     //             child: child,
                     //             animation: animation,
                     //             secondaryAnimation: secAnimation,
                     //             transitionType: SharedAxisTransitionType.horizontal,
                     //           );
                     //         },
                     //         pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation) {
                     //           return ProductDisplay(int.parse(e.productId.toString()));
                     //         },
                     //       ),
                     //     );
                     //   },
                     //   child: Container(
                     //     margin: EdgeInsets.symmetric(vertical: width *0.02,horizontal: width *0.02),
                     //     padding: EdgeInsets.symmetric(vertical: width * 0.02,horizontal: width *0.02),
                     //     decoration: BoxDecoration(
                     //       border: Border.all(color: Colors.grey.withOpacity(0.5)),
                     //       borderRadius: BorderRadius.circular(7),
                     //       color: Colors.white,
                     //         boxShadow:const [
                     //          BoxShadow(
                     //           color: Colors.black54,
                     //           blurRadius: 7,
                     //           offset: Offset(0,3),
                     //         )
                     //       ]
                     //     ),
                     //     child: Column(
                     //       crossAxisAlignment: CrossAxisAlignment.start,
                     //       children: [
                     //         Expanded(child: Image.network(e.thumb!,fit: BoxFit.fill,width: width * 0.4,height: width * 0.04,)),
                     //         Text(e.name ==null?"talha":e.name!,maxLines: 2,style: TextStyle(
                     //           fontWeight: FontWeight.bold,
                     //           fontSize: width * 0.03
                     //         ),),
                     //         SizedBox(height:width * 0.01 ,),
                     //         Text(e.price ==null?"talha":snapshot.product.value.products![0].price!,textAlign: TextAlign.start,style: TextStyle(
                     //           fontWeight: FontWeight.bold,
                     //           fontSize: width * 0.04
                     //         ),),
                     //         SizedBox(height:width * 0.01 ,),
                     //         Padding(
                     //           padding:
                     //           EdgeInsets.symmetric(horizontal: width * 0.02),
                     //           child: Row(
                     //             children: [
                     //               Icon(
                     //                 Icons.star,
                     //                 color: Colors.orange,
                     //                 size: width * 0.04,
                     //               ),
                     //               Icon(
                     //                 Icons.star,
                     //                 color: Colors.orange,
                     //                 size: width * 0.04,
                     //               ),
                     //               Icon(
                     //                 Icons.star,
                     //                 color: Colors.orange,
                     //                 size: width * 0.04,
                     //               ),
                     //               Icon(
                     //                 Icons.star,
                     //                 color: Colors.orange,
                     //                 size: width * 0.04,
                     //               ),
                     //               Icon(
                     //                 Icons.star,
                     //                 color: Colors.orange,
                     //                 size: width * 0.04,
                     //               ),
                     //               SizedBox(
                     //                 width: width * 0.02,
                     //               ),
                     //               Text(
                     //                 '(${e.quantity!})',
                     //                 style: GoogleFonts.poppins(
                     //                     textStyle: TextStyle(
                     //                         color: Colors.grey.shade500,
                     //                         fontSize: width * 0.03)),
                     //               ),
                     //             ],
                     //           ),
                     //         ),
                     //       ],
                     //     ),),
                     // ),
                       ).toList(),
                     ),
                   ) else Container(),
                   isLoading?Positioned.fill(child: Container(child:const Center(child: CircularProgressIndicator(),),)):Container()
                 ],
               )

             ],
           ),
         ),
        )
    );
  }
}
