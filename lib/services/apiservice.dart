import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/interceptors/get_modifiers.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vkreta/getx_controllers/productInfo.dart';
import 'package:vkreta/models/WishlistModel.dart';
import 'package:vkreta/models/addorderModel.dart';
import 'package:vkreta/models/addtowishlistModel.dart';
import 'package:vkreta/models/cartlistModel.dart';
import 'package:vkreta/models/carttotalModel.dart';
import 'package:vkreta/models/countryModel.dart';
import 'package:vkreta/models/customdetail.dart';
import 'package:vkreta/models/deleteaddressModel.dart';
import 'package:vkreta/models/homemodel.dart';
import 'package:vkreta/models/listaddressModel.dart';
import 'package:vkreta/models/orderinfordetailModel.dart';
import 'package:vkreta/models/orderlistModel.dart';
import 'package:vkreta/models/orderreturnaddModel.dart';
import 'package:vkreta/models/orderreturnsaveModel.dart';
import 'package:vkreta/models/productsearchModel.dart';
import 'package:vkreta/models/removecartitemModel.dart';
import 'package:vkreta/models/removeproductmodel.dart';
import 'package:vkreta/models/reviewModel.dart';
import 'package:vkreta/models/searchModel.dart';
import 'package:vkreta/models/sellerratingModel.dart';
import 'package:vkreta/models/signupmodel.dart';
import 'package:vkreta/models/updatecartquantityModel.dart';
import 'package:vkreta/models/zoneModel.dart';
import 'package:vkreta/response/sugest_api_response.dart';

import '../models/cartModel.dart';
import '../models/coupon_moder.dart';
import '../models/forgotpasswordmodel.dart';
import '../models/loginmodel.dart';
import '../models/paymentmethodList.dart';
import '../models/productdetailModel.dart';
import '../response/search_products_response.dart';

class ApiService {
  final log = Logger();
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  String basicAuth_username = 'mobile_API';
  String basicAuth_password = 'A4kNlBvMYLpBRwzVuvY8oyVJaHdehe7wyAJDXaT5dUSD7sWKKErT7wpJurwa7ViByfQMLfX6gy7EL8PRbCWtjN4rwjmUcbAEb62dwN14m8ksdcL2DAaNKhsSUvGWaEpN6ywVKZRiBXLsCHHf86Bltxz3zRC1vpPAZZooVNw3HtUCwWmwK2xoKtsWiVUxnNc1CbLvLWt1JkmkZfNhcMP0VdMLxwSPleAGTTi5APr1Lh4gzxCRM4QdrC5UzIbRuqjS';
  // Future<AuthResponse> loginWithGoogle() async {
  //   late AuthResponse response;
  //   try {
  //     final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
  //     final GoogleSignInAuthentication googleAuth =
  //         await googleUser!.authentication;
  //     log.d('accessToken => ${googleAuth.accessToken!}');
  //     log.d('idToken => ${googleAuth.idToken!}');

  //     log.d('googleUser ==================> ${googleAuth.accessToken}');

  //     response = await _dbService.loginWithGoogle(googleAuth.accessToken!);
  //     if (response.success) {
  //       if (response.success) {
  //         _localStorageService.accessToken = response.accessToken;

  //         // isNotificationTurnOn = _localStorageService.notificationFlag != null;
  //         //await _getUserProfile();
  //         //if (isNotificationTurnOn) await _updateFcmToken();
  //       }
  //     }
  //     return response;
  //   } catch (e) {
  //     log.e('Exception @signUpWithGoogle: $e');
  //   }
  //   return response;
  // }

    Future userRegister(String firstname, String lastname, String email, String telephone, String password, String confirm, String newsletter) async {
    String basicAuth = 'Basic ' + base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final loginUrl = Uri.parse("https://www.vkreta.com/index.php?route=api/register");
    final response = await http.post(loginUrl, headers: {
      'authorization': basicAuth
    }, body: {
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'telephone': telephone,
      'password': password,
      'confirm': confirm,
      'newsletter': newsletter,
    });
    // print(response.statusCode.toString());
    // print(response.body.toString());
    RegisterModel _model = registerModelFromJson(response.body);
     print(_model);
    return _model;
    // return json.decode(response.body);
  }

  Future userLogin(String email, String password, String deviceId,) async {
    String basicAuth = 'Basic ' + base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final loginUrl = Uri.parse("https://www.vkreta.com/index.php?route=api/loginverify");
    final response = await http.post(loginUrl, headers: {
      'authorization': basicAuth
    }, body: {
      'email': email,
      'password': password,
      'device_id': deviceId,
    });
    // print(response.statusCode.toString());
    // print(response.body.toString());
    LoginModel _model = loginModelFromJson(response.body);
    print(_model.error);
    return _model;
    // return json.decode(response.body);
  }
  Future<List<ViewAllModel>> viewAll(String preset, String page) async {
      final data= Get.put(ProductList());
    String basicAuth = 'Basic ' + base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final loginUrl = Uri.parse("https://www.vkreta.com/index.php?route=api/home/products&preset=$preset&page=$page");
    final response = await http.post(loginUrl, headers: {
      'authorization': basicAuth
    },);
    var object=jsonDecode(response.body);
    print(response.statusCode.toString());

    if(int.parse(page)==1){
      data.product.clear();
      for (var i in object){
        data.product.add(ViewAllModel.fromJson(i));
      }
      }else{
      for (var i in object){
        data.product.add(ViewAllModel.fromJson(i));
      }
    }
    return data.product;
    // return json.decode(response.body);
  }

  Future forgotPssword(String email,) async {
    String basicAuth = 'Basic ' + base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final loginUrl = Uri.parse("https://www.vkreta.com/index.php?route=api/checkUser/forgotPasswordApi");
    final response = await http.post(
      loginUrl,
      headers: {'authorization': basicAuth},
      body: {
        'email': email,
      },
    );
    print(response.statusCode.toString());
    print(response.body.toString());
    ForgotPasswordModel _model = forgotpasswordModelFromJson(response.body);

    print(_model);
    return _model;
    // return json.decode(response.body);
  }

//home api

  Future getAboutUs() async {
    String basicAuth = 'Basic ' + base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final allAboutUs = Uri.parse("https://www.vkreta.com/index.php?route=api/info&information_id=5");
    final response = await http.get(
      allAboutUs,
      headers: {'authorization': basicAuth},
    );
    print(response.statusCode);
    print(response.body);
    return json.decode(response.body);
  }

  Future getPrivacyPolicy() async {
    String basicAuth = 'Basic ' + base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final allPrivayPolicy = Uri.parse("https://www.vkreta.com/index.php?route=api/info&information_id=3");
    final response = await http.get(
      allPrivayPolicy,
      headers: {'authorization': basicAuth},
    );
    print(response.statusCode);
    print(response.body);
    return json.decode(response.body);
  }

  Future getTermsCondition() async {
    String basicAuth = 'Basic ' + base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final allTermsCondition = Uri.parse("https://www.vkreta.com/index.php?route=api/info&information_id=5");
    final response = await http.get(
      allTermsCondition,
      headers: {'authorization': basicAuth},
    );
    print(response.statusCode);
    print(response.body);
    return json.decode(response.body);
  }

  Future getPageScreenData(int id) async {
    String basicAuth = 'Basic ' + base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final data = Uri.parse("https://www.vkreta.com/index.php?route=api/info&information_id=" + id.toString());
    final response = await http.get(
      data,
      headers: {'authorization': basicAuth},
    );
    // print(response.statusCode);
    // print(response.body);
    return json.decode(response.body);
  }

  Future<HomeScreenModel> getHome() async {
    String basicAuth = 'Basic ' + base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final data = Uri.parse("https://www.vkreta.com/index.php?route=api/home");
    final response = await http.get(
      data,
      headers: {'authorization': basicAuth},
    );
    //  print(response.statusCode);
    print(response.body);
    final homeModel = HomeScreenModel.fromJson(jsonDecode(response.body));
    return homeModel;
  }

  Future getSearchSugest(String text) async {
    // String basicAuth = 'Basic ' +
    //     base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    // final data = Uri.parse("https://www.vkreta.com/index.php?route=api/home");
    // final response = await http.get(
    //   data,
    //   headers: {'authorization': basicAuth},
    // );
    // //  print(response.statusCode);
    // // print(response.body);
    // return json.decode(response.body);
  }

  Future getcustomerDetail() async {
    String basicAuth = 'Basic ' + base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? customer_id = prefs.getInt('customer_id');
    // print(customer_id);

    final loginUrl = Uri.parse("https://www.vkreta.com/index.php?route=api/cutomerInfo");
    final response = await http.post(loginUrl, headers: {
      'authorization': basicAuth
    }, body: {
      'customer_id': customer_id.toString(),
    });

    // check if data is comming proced
    // otherwise snakbar error

    // print(response.statusCode.toString());
    // print(response.body.toString());
    CustomerDetailModel _model = customerDetailModelFromJson(response.body);
    prefs.setString('firstname', _model.firstname.toString());
    prefs.setString('lastname', _model.lastname.toString());
    prefs.setString('phone', _model.phone.toString());
    prefs.setString('email', _model.email.toString());

    // print(response.body);
    return _model;
    // return json.decode(response.body);
  }

  Future changePassword(String email, String password) async {
    String basicAuth = 'Basic ' + base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final loginUrl = Uri.parse("https://www.vkreta.com/index.php?route=api/reset");
    // print(0);
    final response = await http.post(loginUrl, headers: {'authorization': basicAuth}, body: {'email': email, 'password': password});
    // print(0);
    // print(response.statusCode.toString());
    // // print(response.body.toString());
    return json.decode(response.body);
    // print(_model);
  }

  Future addAddress(String firstname, String lastname, String company, String address_1, String address_2, String city, String postcode, int country_id, int zone_id, int _default,) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? customer_id = prefs.getInt('customer_id');
    String basicAuth = 'Basic ' + base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final loginUrl = Uri.parse("https://www.vkreta.com/index.php?route=api/cutomerInfo/address_add");
    // print(0);
    final response = await http.post(loginUrl, headers: {
      'authorization': basicAuth
    }, body: {
      'customer_id': customer_id.toString(),
      'firstname': firstname.toString(),
      'lastname': lastname.toString(),
      'company': company.toString(),
      'address_1': address_1.toString(),
      'address_2': address_2.toString(),
      'city': city.toString(),
      'postcode': postcode.toString(),
      'country_id': country_id.toString(),
      'zone_id': zone_id.toString(),
      '_default': '1',
    });
    // print(0);
    // print(response.statusCode.toString());
    // print(response.body.toString());
    return json.decode(response.body);
    // print(_model);
  }

  Future<WishlistModel> getWishlist(int product_id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? customer_id = prefs.getInt('customer_id');
    String basicAuth = 'Basic ' + base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final wishlist = Uri.parse("https://www.vkreta.com/index.php?route=api/wishlist");
    final response = await http.post(wishlist, headers: {
      'authorization': basicAuth
    }, body: {
      'customer_id': customer_id.toString(),
    });
    // var data= jsonDecode(response.body.toString());

    // print("response.body1");
    // print("response.body2");
    WishlistModel _model = wishlistModelFromJson(response.body);
    // print("response.body3");
    return _model;
  }

  Future<ProductDetailModel> getProductDetail(int product_id) async {
    String basicAuth = 'Basic ' + base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final wishlist = Uri.parse("https://www.vkreta.com/index.php?route=api/productdetail&product_id=${product_id.toString()}");
    final response = await http.post(wishlist, headers: {'authorization': basicAuth}, body: {});

    print("wishlist ---------->> $wishlist");
    print("response.body --------------->>${response.body}");

    ProductDetailModel _model = productDetailModelFromJson(response.body);
    print("response.body --------------->>${_model}");
    return _model;
  }

  //
  Future googleLogin(String email, String firstname) async {
    List name = firstname.split(' ');
    String basicAuth = 'Basic ' + base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final loginUrl = Uri.parse("https://www.vkreta.com/index.php?route=api/register/googleRegisterOrLogin");
    final response = await http.post(loginUrl, headers: {
      'authorization': basicAuth
    }, body: {
      'email': email.toString(),
      'firstname': firstname.toString(),
      'lastname': name[1],
    });
    var data = jsonDecode(response.body);

    return data;
  }

  // Future userLogin(
  //   String email,
  //   String password,
  // ) async {
  //   String basicAuth = 'Basic ' +
  //       base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
  //   final loginUrl =
  //       Uri.parse("https://www.vkreta.com/index.php?route=api/loginverify");
  //   final response = await http.post(loginUrl, headers: {
  //     'authorization': basicAuth
  //   }, body: {
  //     'email': email,
  //     'password': password,
  //   });
  //   // print(response.statusCode.toString());
  //   // print(response.body.toString());
  //   LoginModel _model = loginModelFromJson(response.body);
  //   // print(_model);
  //   return _model;
  //   // return json.decode(response.body);
  // }

  // Future getSearchApi(int? category_id,String search,int limit) async{
  //   String basicAuth = 'Basic ' + base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
  //   final data = Uri.parse('}index.php?route=api/search&search=&category_id=266&limit=5= $category_id,$search,$limit');
  //   final response = await http.get(data,headers: {'authorization': basicAuth},);
  //   // print(response.statusCode);
  //   // print(response.body);
  //   return json.decode(response.body);
  // }
  Future<RemoveproductModel> removewishlistproduct(int product_id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? customer_id = prefs.getInt('customer_id');
    String basicAuth = 'Basic ' + base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final wishlist = Uri.parse("https://www.vkreta.com/index.php?route=api/wishlist/remove");
    final response = await http.post(wishlist, headers: {
      'authorization': basicAuth
    }, body: {
      'customer_id': customer_id.toString(),
      'product_id': product_id.toString(),
    });
    var data = jsonDecode(response.body.toString());
    // print("response.body2");
    // WishlistModel _model = wishlistModelFromJson(response.body);
    // // print("response.body3");
    // return _model;
    RemoveproductModel _model = removeproductModelFromJson(response.body);
    // print(_model);
    return _model;
  }

  Future<CountryModel> getCountry() async {
    String basicAuth = 'Basic ' + base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final wishlist = Uri.parse("https://www.vkreta.com/index.php?route=api/cutomerInfo/country");
    final response = await http.post(wishlist, headers: {'authorization': basicAuth}, body: {});
    var data = jsonDecode(response.body.toString());
    // print("response.body2");
    // WishlistModel _model = wishlistModelFromJson(response.body);
    // // print("response.body3");
    // return _model;
    CountryModel _model = countryModelFromJson(response.body);
    // print(_model);
    return _model;
  }

  Future<ZoneModel> getZone(int country_id) async {
    String basicAuth = 'Basic ' + base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final wishlist = Uri.parse("https://www.vkreta.com/index.php?route=api/cutomerInfo/zone&country_id=99");
    final response = await http.post(wishlist, headers: {
      'authorization': basicAuth
    }, body: {
      'country_id': country_id.toString(),
    });
    var data = jsonDecode(response.body.toString());
    // print("response.body2");
    // WishlistModel _model = wishlistModelFromJson(response.body);
    // // print("response.body3");
    // return _model;
    ZoneModel _model = zoneModelFromJson(response.body);
    // print(_model);
    return _model;
  }

  Future<CartModel> AddToCart(int product_id, int quantity, Map<String, String>? selectedVariants) async {
    print("response.bod");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? customer_id = prefs.getInt('customer_id');
    String basicAuth = 'Basic ' + base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final wishlist = Uri.parse("https://www.vkreta.com/index.php?route=api/cartnew/add");

    //
    Map<String, String> body = {
      'customer_id': customer_id.toString(),
      'product_id': product_id.toString(),
      'quantity': quantity.toString(),
    };
    for (String key in selectedVariants!.keys) {
      print(key);
      print(selectedVariants[key]);
      body["option[" + key + "]"] = selectedVariants[key].toString();
    }

    print(body.toString());
    final response = await http.post(wishlist, headers: {'authorization': basicAuth}, body: body);
    var data = jsonDecode(response.body.toString());
    // print("response.body2");
    // WishlistModel _model = wishlistModelFromJson(response.body);
    print("response.body3");
    // return _model;
    CartModel _model = cartModelFromJson(response.body);
    print("response.body4");
    // print(_model);
    return _model;
  }

  Future<CartlistModel> getCartItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? customer_id = prefs.getInt('customer_id');
    String basicAuth = 'Basic ' + base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final wishlist = Uri.parse("https://www.vkreta.com/index.php?route=api/cartnew");
    final response = await http.post(wishlist, headers: {
      'authorization': basicAuth
    }, body: {
      'customer_id': customer_id.toString(),
    });
    var data = jsonDecode(response.body.toString());
    // print("response.body2");
    // WishlistModel _model = wishlistModelFromJson(response.body);
    // // print("response.body3");
    // return _model;
    CartlistModel _model = cartlistModelFromJson(response.body);
    // print(_model);
    return _model;
  }

  Future<RemovecartitemModel> removeCartItems(int cart_id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? customer_id = prefs.getInt('customer_id');
    String basicAuth = 'Basic ' + base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final wishlist = Uri.parse("https://www.vkreta.com/index.php?route=api/cartnew/remove");
    final response = await http.post(wishlist, headers: {
      'authorization': basicAuth
    }, body: {
      'customer_id': customer_id.toString(),
      'cart_id': cart_id.toString(),
    });
    var data = jsonDecode(response.body.toString());
    // print("response.body2");
    // WishlistModel _model = wishlistModelFromJson(response.body);
    // // print("response.body3");
    // return _model;
    RemovecartitemModel _model = removecartitemModelFromJson(response.body);
    // print(_model);
    return _model;
  }

  Future<UpdatecartquantityModel> updateCartQuantity(int cart_id, int quantity) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? customer_id = prefs.getInt('customer_id');
    String basicAuth = 'Basic ' + base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final wishlist = Uri.parse("https://www.vkreta.com/index.php?route=api/cartnew/edit");
    final response = await http.post(wishlist, headers: {
      'authorization': basicAuth
    }, body: {
      'customer_id': customer_id.toString(),
      'cart_id': cart_id.toString(),
      'quantity': quantity.toString(),
    });

    print(jsonDecode(response.body.toString()));

    UpdatecartquantityModel _model = updatecartquantityModelFromJson(response.body);
    // print(_model);
    return _model;
  }

  Future<CarttotalModel> getTotalCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? customer_id = prefs.getInt('customer_id');
    String basicAuth = 'Basic ' + base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final wishlist = Uri.parse("https://www.vkreta.com/index.php?route=api/cartnew/cartTotal");
    final response = await http.post(wishlist, headers: {
      'authorization': basicAuth
    }, body: {
      'customer_id': customer_id.toString(),
    });

    print("getTotalCart --------------->> " + response.body.toString());

    CarttotalModel _model = carttotalModelFromJson(response.body);

    return _model;
  }

  Future getShippingList(String address_id) async {
    print("address id ????????" + address_id);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? customer_id = prefs.getInt('customer_id');
    String basicAuth = 'Basic ' + base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final wishlist = Uri.parse("https://www.vkreta.com/index.php?route=api/cartnew/shipping_method");
    final response = await http.post(wishlist, headers: {
      'authorization': basicAuth
    }, body: {
      'customer_id': customer_id.toString(),
      'address_id': address_id,
    });
    print('>>>>>>>>>>>>>>>>>' + response.body);
    var data = jsonDecode(response.body);
    print("response.body2: $data");

    return data;
  }

  Future getCoupon() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? customer_id = prefs.getInt('customer_id');
    String basicAuth = 'Basic ' + base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final wishlist = Uri.parse("https://www.vkreta.com/index.php?route=api/cartnew/coupon_lists&customer_id=$customer_id");
    final response = await http.get(
      wishlist,
      headers: {'authorization': basicAuth},
    );

    Coupons data = Coupons.fromJson(jsonDecode(response.body));
    print("response.body2: ${data.total}");

    return data;
  }

  Future applyCoupon(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? customer_id = prefs.getInt('customer_id');
    String basicAuth = 'Basic ' + base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final wishlist = Uri.parse("https://www.vkreta.com/index.php?route=api/coupon/check");
    final response = await http.post(wishlist, headers: {
      'authorization': basicAuth
    }, body: {
      'customer_id': customer_id.toString(),
      'coupon': name,
    });
    print('>>>>>>>>>>>>>>>>>' + response.body);
  }

  Future getPaymentMethod(String address_id) async {
    print("address id ????????" + address_id);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? customer_id = prefs.getInt('customer_id');
    String basicAuth = 'Basic ' + base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final wishlist = Uri.parse("https://www.vkreta.com/index.php?route=api/cartnew/payment_method");
    final response = await http.post(wishlist, headers: {
      'authorization': basicAuth
    }, body: {
      'customer_id': customer_id.toString(),
      'address_id': address_id,
    });
    //print('>>>>>>>>>>>>>>>>>' + response.body);

    Autogenerated data = Autogenerated.fromJson(jsonDecode(response.body));

    print("response.body>>>>>>>>>>>>>>>>>>>>: ${data.paymentMethodsList?[0].code}");

    return data;
  }

  Future getAddressList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? customer_id = prefs.getInt('customer_id');
    String basicAuth = 'Basic ' + base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final wishlist = Uri.parse("https://www.vkreta.com/index.php?route=api/cutomerInfo/address_list");
    final response = await http.post(
      wishlist,
      headers: {'authorization': basicAuth},
      body: {'customer_id': customer_id.toString()},
    );

    log.d(response.body);

    Map<String, ListAddressModel> _model = listAddressModelFromJson(response.body);
    return _model;
  }

  Future<ReviewModel> getProductReview(int product_id, int page, int limit) async {
    String basicAuth = 'Basic ' + base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final data = Uri.parse("https://www.vkreta.com/index.php?route=api/"
        "productdetail/review&product_id=${product_id.toString()}&page=${page.toInt()}&limit=${limit.toInt()}");
    final response = await http.get(
      data,
      headers: {'authorization': basicAuth},
    );
    // print(response.statusCode);
    //  print(response.body);
    // return json.decode(response.body);
    var data2 = jsonDecode(response.body.toString());
    // print("response.body2");
    // WishlistModel _model = wishlistModelFromJson(response.body);
    // // print("response.body3");
    // return _model;
    ReviewModel _model = reviewModelFromJson(response.body);
    // // print(_model);
    return _model;
  }

  Future<DeleteaddressModel> deletAddress(int address_id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? customer_id = prefs.getInt('customer_id');
    String basicAuth = 'Basic ' + base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final wishlist = Uri.parse("https://www.vkreta.com/index.php?route=api/cutomerInfo/address_delete");
    final response = await http.post(wishlist, headers: {
      'authorization': basicAuth
    }, body: {
      'customer_id': customer_id.toString(),
      'address_id': address_id.toString(),
    });
    var data = jsonDecode(response.body.toString());
    // print("response.body2");
    // WishlistModel _model = wishlistModelFromJson(response.body);
    // // print("response.body3");
    // return _model;
    DeleteaddressModel _model = deleteaddressModelFromJson(response.body);
    // // print(_model);
    return _model;
  }

  Future editAddress(String firstname, String lastname, String company, String address_1, String address_2, String city, String postcode, int country_id, int zone_id, int _default,) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? customer_id = prefs.getInt('customer_id');
    String basicAuth = 'Basic ' + base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final loginUrl = Uri.parse("https://www.vkreta.com/index.php?route=api/cutomerInfo/address_update");
    // print(0);
    final response = await http.post(loginUrl, headers: {
      'authorization': basicAuth
    }, body: {
      'customer_id': customer_id.toString(),
      'firstname': firstname.toString(),
      'lastname': lastname.toString(),
      'company': company.toString(),
      'address_1': address_1.toString(),
      'address_2': address_2.toString(),
      'city': city.toString(),
      'postcode': postcode.toString(),
      'country_id': country_id.toString(),
      'zone_id': zone_id.toString(),
      '_default': '1',
    });
    print(0);
    // print(response.statusCode.toString());
    print(response.body.toString());
    return json.decode(response.body);
    // print(_model);
  }

  Future<AddorderModel> addOrder(int payment_address, int shipping_address, String payment_method, String shipping_method, String comment) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? customer_id = prefs.getInt('customer_id');
    String basicAuth = 'Basic ' + base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final loginUrl = Uri.parse("https://www.vkreta.com/index.php?route=api/ordernew/add");

    print("customer_id -------------->> ${customer_id}");
    print("payment_address -------------->> ${payment_address}");
    print("shipping_address -------------->> ${shipping_address}");
    print("payment_method -------------->> ${payment_method}");
    print("shipping_method -------------->> ${shipping_method}");
    print("comment -------------->> ${comment}");

    final response = await http.post(
      loginUrl,
      headers: {'authorization': basicAuth},
      body: {
        'customer_id': customer_id.toString(),
        'payment_address': payment_address.toString(),
        'shipping_address': shipping_address.toString(),
        'payment_method': payment_method.toString(),
        'shipping_method': shipping_method.toString(),
        'comment': comment.toString(),
        'coupon': "",
      },
    );
    var data = jsonDecode(response.body.toString());
    print(data);
    // WishlistModel _model = wishlistModelFromJson(response.body);
    // // print("response.body3");
    // return _model;
    AddorderModel _model = addorderModelFromJson(response.body);
    // // print(_model);
    return _model;
  }

  Future getRazorPay() async {
    String basicAuth = 'Basic ' + base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final loginUrl = Uri.parse("https://www.vkreta.com/index.php?route=api/cartnew/razorpay_access");
    final response = await http.get(
      loginUrl,
      headers: {'authorization': basicAuth},
    );
    var data = jsonDecode(response.body.toString());
    print("response.body2 >>>>>>>>>>>>>> ${data}");
    return data;
  }

  Future<SearchModel> getProductSearch({String? search}) async {
    String basicAuth = 'Basic ' + base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));

    String url = "https://www.vkreta.com/index.php?route=api/search&search=$search";
    // if (search != "") {
    //   url += "&search=${search.toString()}";
    // }
    // if (category_id != null) {
    //   url += "&category_id=${category_id}";
    // }
    // if (limit! > 0) {
    //   url += "&limit=${limit.toString()}";
    // }
    // if (fmin != "0") {
    //   url += "&fmin=${fmin}";
    // }
    // if (fmax != "0") {
    //   url += "&fmax=${fmax}";
    // }

    final data = Uri.parse(url);

    final response = await http.get(
      data,
      headers: {'authorization': basicAuth},
    );
    print(url);
    // print(response.statusCode);
    //  print(response.body);
    // index.php?route=api/"
    // "productdetail/review&product_id=${product_id.toString()}&page=${page.toInt()}&limit=${limit.toInt()}");
    // return json.decode(response.body);
    var data2 = jsonDecode(response.body.toString());
    print(data2);
    // WishlistModel _model = wishlistModelFromJson(response.body);
    // // print("response.body3");
    // return _model;
    print("response.asdasd");
    SearchModel _model = SearchModel.fromJson(jsonDecode(response.body));
    // // print(_model);
    print("response.body3");
    return _model;
  }
  Future<SearchModel> getFilterSearch({String? min,String? max,String? brand,String? discount,String? prices,String? rating}) async {
    String basicAuth = 'Basic ' + base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));

    String url = "https://www.vkreta.com/index.php?route=api/search";
      url += "&fp=$min,$max";
    if (brand != "bbb") {
      url += "&fm=$brand";
    }
    if (discount!= "bbb") {
      url += "&f4=$discount";
    }
    if (rating != "bbb") {
      url += "&f5=$rating";
    }

    final data = Uri.parse(url);

    final response = await http.get(
      data,
      headers: {'authorization': basicAuth},
    );
    print(url);
    // print(response.statusCode);
    //  print(response.body);
    // index.php?route=api/"
    // "productdetail/review&product_id=${product_id.toString()}&page=${page.toInt()}&limit=${limit.toInt()}");
    // return json.decode(response.body);
    var data2 = jsonDecode(response.body.toString());
    print(data2);
    // WishlistModel _model = wishlistModelFromJson(response.body);
    // // print("response.body3");
    // return _model;
    print("response.asdasd");
    SearchModel _model = SearchModel.fromJson(jsonDecode(response.body));
    // // print(_model);
    print("response.body3");
    return _model;
  }

  Future<AddtowishlistModel> addtowishlist(int product_id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? customer_id = prefs.getInt('customer_id');
    String basicAuth = 'Basic ' + base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final addwishlist = Uri.parse("https://www.vkreta.com/index.php?route=api/wishlist/add");
    final response = await http.post(addwishlist, headers: {
      'authorization': basicAuth
    }, body: {
      'customer_id': customer_id.toString(),
      'product_id': product_id.toString(),
    });
    // var data= jsonDecode(response.body.toString());
    // print("response.body2");
    // WishlistModel _model = wishlistModelFromJson(response.body);
    // print("response.body3");
    // return _model;
    AddtowishlistModel _model = addtowishlistModelFromJson(response.body);
    // print(_model);
    // print("response.body4");
    return _model;
  }

  Future Orderlist() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? customer_id = prefs.getInt('customer_id');
    String basicAuth = 'Basic ' + base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final addwishlist = Uri.parse("https://www.vkreta.com/index.php?route=api/ordernew/OrderList");
    final response = await http.post(addwishlist, headers: {
      'authorization': basicAuth
    }, body: {
      'customer_id': customer_id.toString(),
    });
    // var data= jsonDecode(response.body.toString());
    // print("response.body2");
    // WishlistModel _model = wishlistModelFromJson(response.body);
    // print("response.body3");
    // return _model;
    // print(response.body);
    List<OrderlistModel> _model = orderlistModelFromJson(response.body);
    print(_model[0].status);
    // print("response.body4");
    // print(_model);
    // print("response.body4");
    return _model;
  }

  Future Orderinformationdetail(int order_id, int seller_id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? customer_id = prefs.getInt('customer_id');
    String basicAuth = 'Basic ' + base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final addwishlist = Uri.parse("https://www.vkreta.com/index.php?route=api/ordernew/info");
    print("customer_id --------->> ${customer_id}");
    print("order_id --------->> ${order_id}");
    print("seller_id --------->> ${seller_id}");
    final response = await http.post(
      addwishlist,
      headers: {'authorization': basicAuth},
      body: {
        'customer_id': customer_id.toString(),
        'order_id': order_id.toString(),
        'seller_id': seller_id.toString(),
      },
    );
    // return _model;

    print("response ---------------------->>> ${response.body}");
    OrderInfoDetailModel _model = orderInfoDetailModelFromJson(response.body);
    return _model;
  }

  Future SellerRating(int order_id, int seller_id, int rating, String review_description) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? customer_id = prefs.getInt('customer_id');
    String basicAuth = 'Basic ' + base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final addwishlist = Uri.parse("https://www.vkreta.com/index.php?route=api/productdetail/ordersellerreview");
    final response = await http.post(addwishlist, headers: {
      'authorization': basicAuth
    }, body: {
      'customer_id': customer_id.toString(),
      'order_id': order_id.toString(),
      'seller_id': seller_id.toString(),
      'rating': rating.toString(),
      'review_description': review_description,
    });
    // return _model;

    SellerratingModel _model = sellerratingModelFromJson(response.body);
    // print("response.body4");
    // print(_model);
    // print("response.body4");
    return _model;
  }

  Future OrderReturnAdd(int order_id, int product_id,) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? customer_id = prefs.getInt('customer_id');
    String basicAuth = 'Basic ' + base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final addwishlist = Uri.parse("https://www.vkreta.com/index.php?route=api/ordernew/returnorderadd");
    final response = await http.post(addwishlist, headers: {
      'authorization': basicAuth
    }, body: {
      'customer_id': customer_id.toString(),
      'order_id': order_id.toString(),
      'product_id': product_id.toString(),
    });
    // return _model;

    OrderreturnaddModel _model = orderreturnaddModelFromJson(response.body);
    // print("response.body4");
    // print(_model);
    // print("response.body4");
    return _model;
  }

  Future OrderReturnSave(int order_id, int product_id, String firstname, String lastname, String email, String telephone, String date_ordered, String product, String model, String payment_code, int quantity, int return_reason_id, int opened, String comment, String bank_swift_code, String bank_account_name, String bank_account_number, int agree) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? customer_id = prefs.getInt('customer_id');
    String basicAuth = 'Basic ' + base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final addwishlist = Uri.parse("https://www.vkreta.com/index.php?route=api/ordernew/returnorder");
    final response = await http.post(addwishlist, headers: {
      'authorization': basicAuth
    }, body: {
      'customer_id': customer_id.toString(),
      'order_id': order_id.toString(),
      'product_id': product_id.toString(),
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'telephone': telephone.toString(),
      'date_ordered': date_ordered.toString(),
      'product': product.toString(),
      'model': model.toString(),
      'payment_code': payment_code.toString(),
      'quantity': quantity.toString(),
      'return_reason_id': return_reason_id.toString(),
      'opened': opened.toString(),
      'comment': comment.toString(),
      'bank_swift_code': bank_swift_code.toString(),
      'bank_account_name': order_id.toString(),
      'bank_account_number': bank_account_number.toString(),
      'agree': agree.toString(),
    });
    // return _model;

    print(response.body.toString());
    OrderreturnsaveModel _model = orderreturnsaveModelFromJson(response.body);
    print("response.body4");
    // print(_model);
    // print("response.body4");
    return _model;
  }

  Future sugestSearchApiCalled(String item) async {
    try {
      String basicAuth = 'Basic ' + base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // int? customer_id = prefs.getInt('customer_id');
      // print(customer_id);

      final loginUrl = Uri.parse("https://www.vkreta.com/index.php?route=journal3/search&category_id=250&search=${item}");
      final response = await http.get(
        loginUrl,
        headers: {'authorization': basicAuth},
      );
      var data = SugestApiResponse.fromJson(json.decode(response.body));
      print(response.body);
      return data;
    } catch (e) {
      print(e);
    }

    // return json.decode(response.body);
  }

  Future searchApiCalled({String item = '', String pageNO = '', String lmit = ''}) async {
    // try {
    String basicAuth = 'Basic ' + base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // int? customer_id = prefs.getInt('customer_id');
    // print(customer_id);

    final loginUrl = Uri.parse("https://www.vkreta.com/index.php?route=api/search&search=${item}&page=${pageNO}&limit=${lmit}");
    final response = await http.get(
      loginUrl,
      headers: {'authorization': basicAuth},
    );
    var data = SearchApiResponse.fromJson(json.decode(response.body));
    print(response.body);
    return data;
    // } catch (e) {
    //   print(e);
    // }
    // return json.decode(response.body);
  }

  Future filterApiCalled({String item = '', String pageNO = '', String lmit = '', String minp = '', String maxp = '', String category = '', String avaliable = '',}) async {
    // try {
    String basicAuth = 'Basic ' + base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // int? customer_id = prefs.getInt('customer_id');
    // print(customer_id);

    final loginUrl = Uri.parse("https://www.vkreta.com/index.php?route=api/search&search=${item}&page=${pageNO}&limit=${lmit}&fmin=${minp}&fmax=${maxp}&fc=${category}&fm=167&fq=${avaliable}");
    final response = await http.get(
      loginUrl,
      headers: {'authorization': basicAuth},
    );
    var data = SearchApiResponse.fromJson(json.decode(response.body));
    print('>>>>>>>>>>>>>>>>>>>>>  ' + response.body);
    return data;
    // } catch (e) {
    //   print(e);
    // }
    // return json.decode(response.body);
  }
}
