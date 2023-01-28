import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vkreta/models/TopCategoryModel.dart';
import 'package:vkreta/services/apiservice.dart';
import 'package:vkreta/view/product/category_filter_screen.dart';
import 'package:vkreta/view/product/productdisplay.dart';

import '../../controllers/categoryController.dart';
import '../filter/fliter_screen.dart';
import '../home/home.dart';
import 'otherSellerProductsScreen.dart';

class TopCategoryScreen extends StatefulWidget {
  final String id;
  const TopCategoryScreen({required this.id, Key? key}) : super(key: key);

  @override
  State<TopCategoryScreen> createState() => _TopCategoryScreenState();
}

class _TopCategoryScreenState extends State<TopCategoryScreen> {
  final data=Get.put(CategoryController());
  getData()async{
    var response=await ApiService().getProductList(widget.id).then((value){
      data.data.value=
      TopCategoryModel.fromJson(value);
      setState(() {});
      print(data.data.value.thumb.toString());
    });

  }
  @override
  void initState() {
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title:const Text("Top Category"),
        leading:IconButton(onPressed: ()=>Navigator.pop(context),icon: const Icon(Icons.arrow_back_ios),),
        actions: [
          IconButton(
              onPressed: () {
                if(data.data != null){
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
                        return const CategoryFilterScreen();
                      }));
                }else{
                  Fluttertoast.showToast(msg: "No Search to filter results");
                }
              },
              icon: Icon(
                Icons.filter_list_alt,
                color: Colors.white,
                size: width * 0.06,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: width * 0.04,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: width * 0.04),
              height: width * 0.32,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(width * 0.01),
                      child: InkWell(
                        onTap: (){},
                        child: Container(
                          height: width * 0.2,
                          width: width * 0.2,
                          color: Colors.white,
                          child: Column(children: [
                            SizedBox(
                                height: width * 0.18,
                                width: width * 0.22,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(7),
                                  child: Image.network(
                                    data.data.value.categories![index].image == "null"
                                        ? "https://kdfsdf"
                                        :  data.data.value.categories![index].image! ,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, object, stracktree) {
                                      return Icon(
                                        Icons.image,
                                        size: width * 0.06,
                                        color: Colors.grey,
                                      );
                                    },
                                  ),
                                )),
                            SizedBox(
                              height: width * 0.015,
                            ),
                            Text(
                              data.data.value.categories![index].name!,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ]),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: width * 0.01,
                    );
                  },
                  itemCount:
                  data.data.value.categories!.length),
            ),
            SizedBox(height: width * 0.04,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: width * 0.03),
              child: Expanded(
                child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: data.data.value.products!.length,
                    addRepaintBoundaries: false,
                    addAutomaticKeepAlives: false,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.85,
                        mainAxisSpacing: width * 0.04,
                        crossAxisSpacing: width * 0.04),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProductDisplay(int.parse(data.data.value.products![index].productId!))));
                        },
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
                                    child: Image.network(data.data.value.products![index].thumb != null?data.data.value.products![index].thumb! :"https://sdad",
                                    errorBuilder: (context,error,streak){
                                      return Icon(Icons.image,color: Colors.grey,);
                                    },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.02,
                                  ),
                                  child: Text(
                                    data.data.value.products![index].name!,
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
                                        data.data.value.products![index].price!,
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
                                        '(${data.data.value.products![index].rating.toString()})',
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
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
