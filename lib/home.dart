import 'package:animations/animations.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vkreta/allnotifications.dart';
import 'package:vkreta/editaddress.dart';
import 'package:vkreta/getx_controllers/homepage.dart';
import 'package:vkreta/lowtohighprice.dart';
import 'package:vkreta/models/homemodel.dart';
import 'package:vkreta/modifyyouraddress.dart';
import 'package:vkreta/notifications.dart';
import 'package:vkreta/productdisplay.dart';
import 'package:vkreta/response/search_products_response.dart';
import 'package:vkreta/search_screen.dart';

import 'package:vkreta/services/apiservice.dart';

import 'package:vkreta/viewall.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

import 'models/listaddressModel.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _search = TextEditingController();
  final homeScreenModel= Get.put(HomePage());

  Future<HomeScreenModel> getHomeScreenData()async{
   setLoading(true);
  HomeScreenModel homeModel=await ApiService().getHome().then((value){
  homeScreenModel.homeScreenModel.value=value;
  setLoading(false);
    return value;
  });
  return homeModel;
  }

  String address="Searching";
  List<ListAddressModel> storeAddress=[];
  getUserLocation() async {//call this async method from whereever you need

    LocationData myLocation;
    String error;
    Location location = Location();
    try {
      myLocation = await location.getLocation();
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        error = 'please grant permission';
        print(error);
      }
      if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        error = 'permission denied- please enable it from app settings';
        print(error);
      }
    }
    myLocation = await location.getLocation();
    List<geo.Placemark> placemarks = await geo.placemarkFromCoordinates(
        myLocation.latitude!, myLocation.longitude!);
    geo.Placemark place = placemarks[0];
    print(placemarks.toString());

    storeAddress.add(ListAddressModel(

      address2: placemarks[0].country.toString() + ", "+ placemarks[0].locality.toString() + ", " +placemarks[0].subLocality.toString(),
      city: placemarks[0].locality,
      country: placemarks[0].country,
    ));
    setState(() {
      address =placemarks[0].country.toString() + ", "+ placemarks[0].locality.toString() + ", " +placemarks[0].subLocality.toString();
    });
   // var first = addresses.first;
   // print(' ${first.locality}, ${first.adminArea},${first.subLocality}, ${first.subAdminArea},${first.addressLine}, ${first.featureName},${first.thoroughfare}, ${first.subThoroughfare}');
    return place;
  }
  setLoading(bool value){
    setState(() {
      isLoading=false;
    });
  }
  bool isLoading=false;
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
            margin: const EdgeInsets.only(
              top: 18,
            ),
            padding: const EdgeInsets.only(
              // top: ResponsiveFlutter.of(context).moderateScale(5),
              bottom: 20,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: widget!,
          ),
        ],
      ),
    );
  }
  TextEditingController postalCode=TextEditingController();
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
              child:const Center(
                child: Text(
                  "CHOOSE YOUR LOCATION",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            //select your address
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const ModifyYourAddress()));
              },
              child: Container(
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
                  const SizedBox(width: 6),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "PIN CODE",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          "Enter a pincode",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 44,
                                child: TextField(
                                  controller: postalCode,
                                  decoration:const InputDecoration(
                                    border: OutlineInputBorder(),
                                    contentPadding: EdgeInsets.all(10),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            InkWell(
                              onTap: (){
                                storeAddress[0].address1 = postalCode.text.toString() ;
                                Navigator.of(context).push(
                                  PageRouteBuilder(
                                    transitionDuration:const Duration(seconds: 1),
                                    transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation, Widget child) {
                                      animation = CurvedAnimation(parent: animation, curve: Curves.linear);
                                      return SharedAxisTransition(child: child, animation: animation, secondaryAnimation: secAnimation, transitionType: SharedAxisTransitionType.horizontal);
                                    },
                                    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation) {
                                      return EditAddress(
                                        object: storeAddress[0],
                                        default_: 1,
                                      );
                                    },
                                  ),
                                );
                              },
                              child: Container(
                                height: 44,
                                width: 100,
                                color: Colors.blue,
                                child:const Center(
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
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.of(context).push(
                  PageRouteBuilder(
                    transitionDuration: Duration(seconds: 1),
                    transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation, Widget child) {
                      animation = CurvedAnimation(parent: animation, curve: Curves.linear);
                      return SharedAxisTransition(child: child, animation: animation, secondaryAnimation: secAnimation, transitionType: SharedAxisTransitionType.horizontal);
                    },
                    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation) {
                      return EditAddress(
                        object: storeAddress[0],
                        default_: 1,
                      );
                    },
                  ),
                );
              },
              child: Container(
                margin:const EdgeInsets.only(bottom: 30, left: 20, right: 20),
                decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1), borderRadius: BorderRadius.circular(5)),
                width: double.infinity,
                padding:const EdgeInsets.all(14),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/location.png",
                      height: 18,
                      width: 18,
                    ),
                    const SizedBox(width: 6),
                    const Expanded(
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
            ),
          ],
        ),
      ),
    );
  }
  launchWhatsApp(phone) async {
    final link = WhatsAppUnilink(phoneNumber: phone, text: "Hey! I'm looking ?");
    await launch('$link');
  }
  String phoneNumber = '';
  @override
  void initState() {
    getHomeScreenData();
    getUserLocation();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var width =MediaQuery.of(context).size.width;
    var height =MediaQuery.of(context).size.height;
    HomeScreenModel snapshot = homeScreenModel.homeScreenModel.value;
    return Scaffold(
      backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () {
            launchWhatsApp(phoneNumber);
          },
          child:const Icon(
            Icons.whatsapp,
            size: 35,
          ),
        ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                    children: [
                      SizedBox(
                        height: width * 0.04,
                      ),
                      Padding(
                        padding: EdgeInsets.all(width * 0.04),
                        child: SizedBox(
                          height: width * 0.12,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const SearchScreen())),
                                  child: TextFormField(
                                    enabled: false,
                                    controller: _search,
                                    textInputAction: TextInputAction.search,
                                    onFieldSubmitted: (value) {
                                      showSearch(
                                        query: _search.text,
                                        context: context,
                                        delegate: CustomSearchDelegate(search: _search.text.trim().toLowerCase()),
                                      );
                                    },
                                    decoration: InputDecoration(
                                      prefixIcon: InkWell(
                                        onTap: () {
                                          showSearch(
                                            query: _search.text,
                                            context: context,
                                            delegate: CustomSearchDelegate(search: _search.text.trim().toLowerCase()),
                                          );
                                        },
                                        child: Icon(
                                          Icons.search,
                                          color: Colors.grey.shade600,
                                          size: 25,
                                        ),
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
                            openBottomSheet(context);
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
                                      address,
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

                      // Top Category

                      Container(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                        height: width * 0.32,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context,index){
                              return CategoryButton(
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
                                      return ViewAll(
                                        title: snapshot!.topCategory![index].name!,
                                      );
                                    }));
                              }, width: width, list: snapshot!.topCategory![index]);
                            }, separatorBuilder: (context,index){
                          return SizedBox(width: width * 0.04,);
                        }, itemCount: snapshot!.topCategory!.length),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Divider(
                          height: 1,
                          color: Colors.grey.shade500,
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics:const NeverScrollableScrollPhysics(),
                        itemBuilder: (context,index){
                        return CarouselSlider(
                            items:snapshot!.silder![index].data!.map((e) => Container(
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
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(7),
                                child: Image.network(e.image!.toString()=='null'?'https://www.vkreta.com/image/cache/catalog/category-data/baby-care-products-100x100.webp':e.image!,fit: BoxFit.cover,
                                  errorBuilder: (context,object,streacTree){
                                    return Icon(Icons.image,size: width * 0.06,color: Colors.grey,);
                                  },
                                ),
                              ),)).toList(),
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
                        );
                      },
                        itemCount: snapshot!.silder!.length,
                      ),

                      SizedBox(
                        height: width * 0.06,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: width * 0.04),
                        child: SingleChildScrollView(
                          child: ListView.separated(
                              physics:const  NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context,index){
                                return ProductCart(width: width, title: snapshot.products![index].title!, viewAll: (){
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
                                          title:snapshot.products![index].preset!,
                                        );
                                      }));
                                },  product: snapshot.products![index].data!);
                              }, separatorBuilder: (context,index){
                            return SizedBox(height: width * 0.15,);
                          }, itemCount: snapshot.products!.length),
                        ),
                      ),
                      SizedBox(height: width * 0.02,),
                      ListView.builder(
                        physics:const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context,index){
                        return BannerWidget(width: width, snapshot: snapshot.banner![index]);
                      },itemCount: snapshot.banner!.length,
                      )
                    ],
                  ),
              isLoading?Positioned.fill(child: Container(child:const Center(child: CircularProgressIndicator(),),)):Container()
            ],
          )
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

  String title="Flash sale";
}

class BannerWidget extends StatelessWidget {
  const BannerWidget({
    Key? key,
    required this.width,
    required this.snapshot,
  }) : super(key: key);

  final double width;
  final BannerModel snapshot;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.all(width * 0.04),
            child: Text(snapshot.title!,textAlign: TextAlign.start,style: TextStyle(fontSize:width * 0.06,fontWeight: FontWeight.w900 ),),
          ),
            GridView.count(
              shrinkWrap: true,
              childAspectRatio: 1.1,
              physics:const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              children: snapshot.data!.map((e) => Container(
                child: Column(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(7),
                        child: Image.network(e.image!,width: width * 0.4,height: width * 0.4,fit: BoxFit.cover,)),
                    Text(e.name!,style: TextStyle(fontSize: width * 0.04),)
                  ],
                ),
              )).toList(),
            ),
        ],
      ),
    );
  }
}

class ProductCart extends StatefulWidget {
  const ProductCart({
    Key? key,
    required this.width,
    required this.title,
    required this.viewAll,
    required this.product,
  }) : super(key: key);

  final double width;
  final String title;
  final Null Function() viewAll;
  final List<ProductInfo>? product;

  @override
  State<ProductCart> createState() => _ProductCartState();
}

class _ProductCartState extends State<ProductCart> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: widget.width * 0.06),
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
         widget.product!.length>1?SizedBox(
          height: widget.width * 0.58,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: widget.product!.length,
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
                              return  ProductDisplay(int.parse(widget.product![index].productId!));
                            }));
                      },
                      child: Container(
                        height: widget.width * 0.55,
                        width: widget.width * 0.4,
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
                                  height: widget.width * 0.36,
                                  width: widget.width * 0.4,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Padding(
                                    padding: EdgeInsets.all(widget.width * 0.02),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(7),
                                      child: Image.network(widget.product![index].thumb!.toString()=='null'?"https://dfdsf":widget.product![index].thumb!,
                                          fit: BoxFit.fill,
                                        errorBuilder: (context,object,straeTree){
                                        return Icon(Icons.image,color: Colors.grey,size: widget.width * 0.06,);
                                      },
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                  EdgeInsets.symmetric(horizontal: widget.width * 0.02),
                                  child: Text(
                                    widget.product![index].name!,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            color: Colors.grey.shade900,
                                            fontSize: widget.width * 0.03)),
                                  ),
                                ),
                                SizedBox(
                                  height: widget.width * 0.01,
                                ),
                                Padding(
                                  padding:
                                  EdgeInsets.symmetric(horizontal: widget.width * 0.01),
                                  child: Row(
                                    children: [
                                      Text(
                                        widget.product![index].price!,
                                        style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: widget.width * 0.03)),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: widget.width * 0.01,
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
            );
          }),
        ):Container(height: widget.width * 0.58,
         //width: widget.width * 0.3,
           alignment: Alignment.center,
           child: const Text("No result are found"),
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
  final TopCategory list;

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
            SizedBox(
                height: width * 0.18,
                width: width * 0.22,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: Image.network(
                    list.image.toString()=="null"?"https://kdfsdf":list.image!,fit: BoxFit.cover,
                    errorBuilder: (context,object,stracktree){
                      return Icon(Icons.image,size: width * 0.06,color: Colors.grey,);
                    },
                  ),
                )),
            SizedBox(
              height: width * 0.015,
            ),
            Text(
              list.name!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                  textStyle:const TextStyle(
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
//
// class Product{
//   String name;
//   String prices;
//   String orderQuantity;
//   String image;
//   String sales;
//   Product({required this.name,required this.prices,required this.orderQuantity,required this.image,required this.sales});
// }

class CustomSearchDelegate extends SearchDelegate {
  final String search;
  CustomSearchDelegate({required this.search});
  final GlobalKey<ScaffoldState> scaffoldKey1 = GlobalKey<ScaffoldState>();

  void openDrawer() {
    scaffoldKey1.currentState?.openDrawer();
  }

  void closeDrawer() {
    Get.back();
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon:const Icon(Icons.filter_alt_outlined),
        onPressed: () async {
          SearchApiResponse response = await Provider.of<Model>(context, listen: false).response;
          print(response.filter?.first.priceRange?.min);
          print(response.filter?.first.priceRange?.max);

          Get.defaultDialog(contentPadding:const EdgeInsets.symmetric(horizontal: 10, vertical: 10), title: "Filter", titleStyle: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold), content: Text('Please select Filters'), actions: [
            ChangeNotifierProvider(
              create: (context) => Model(),
              child: Consumer<Model>(builder: (context, model, child) {
                Provider.of<Model>(context, listen: false).valu = response.filter?.first.priceRange?.min?.toDouble() ?? 100;

                return Column(
                  children: [
                    Text(
                      'Price ${model.valu.toInt()}',
                      style:const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    if (response.filter?.first.priceRange?.min != null)
                      Row(
                        children: [
                          Text('${response.filter?.first.priceRange?.min}'),
                          Slider(
                              label: model.valu.toString(),
                              min: response.filter!.first.priceRange!.min!.toDouble(),
                              max: response.filter!.first.priceRange!.max!.toDouble(),
                              value: model.valu,
                              onChanged: (value) {
                                model.updateValue(value);
                              }),
                          Text('${response.filter!.first.priceRange!.max}'),
                        ],
                      ),
                    const SizedBox(
                      height: 10,
                    ),
                    //Text('${model.valu.toInt()}'),
                  ],
                );
              }),
            ),
          ]);
        },
      ),
      //open sample dailog
    ];
  }

  //create a buildtap

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon:const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: ApiService().searchApiCalled(item: search, pageNO: '1', lmit: '30'),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          Provider.of<Model>(context, listen: false).snapshotTop = snapshot;
          Provider.of<Model>(context, listen: false).response = snapshot.data;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Divider(
                      height: 1,
                      color: Colors.grey.shade400,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GridView.builder(
                        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200, childAspectRatio: 0.85, crossAxisSpacing: 10, mainAxisSpacing: 10,),
                        shrinkWrap: true,
                        itemCount: Provider.of<Model>(context, listen: false).snapshotTop!.data.products.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext ctx, index) {
                          return searchProductCardModel(context, Provider.of<Model>(context, listen: false).snapshotTop!.data.products[index]);
                        }),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // ListView.builder(
    //   itemCount: matchQuery.length,
    //   itemBuilder: (context, index) {
    //     return matchQuery[index];
    //   },
    // );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: ApiService().sugestSearchApiCalled(query),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Divider(
                      height: 1,
                      color: Colors.grey.shade400,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GridView.builder(
                        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200, childAspectRatio: 0.85, crossAxisSpacing: 10, mainAxisSpacing: 10),
                        shrinkWrap: true,
                        itemCount: snapshot.data.response.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext ctx, index) {
                          return searchProductCardModel(context, snapshot.data.response[index]);
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
//deflult

}
Widget searchProductCardModel(context, product) {
  return InkWell(
    onTap: () {
      Navigator.of(context).push(
        PageRouteBuilder(
          transitionDuration:const Duration(seconds: 1),
          transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation, Widget child) {
            animation = CurvedAnimation(
              parent: animation,
              curve: Curves.linear,
            );
            return SharedAxisTransition(
              child: child,
              animation: animation,
              secondaryAnimation: secAnimation,
              transitionType: SharedAxisTransitionType.horizontal,
            );
          },
          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation) {
            return ProductDisplay(int.parse(product.productId.toString()));
          },
        ),
      );
    },
    child: Container(
      margin:const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            spreadRadius: 1,
            blurRadius: 2,
            offset:const Offset(1, 3),
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 5),
              Container(
                width: 130,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: product.thumb != null ? Image.network(product.thumb) : Image.asset('assets/grocery.png'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  product.name,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: Colors.grey.shade900,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Text(
                      product.price ?? '',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
            ],
          ),
        ],
      ),
    ),
  );
}

class Model extends ChangeNotifier {
  double max = 0;
  double valu = 0;

  updateValue(value) {
    valu = value;
    notifyListeners();
  }

  SearchApiResponse response = SearchApiResponse();
  AsyncSnapshot<dynamic>? snapshotTop;
  updateSnapshot(snapshot) {
    snapshotTop = snapshot;
    notifyListeners();
  }
}
