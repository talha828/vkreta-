import 'package:flutter/material.dart';
import 'package:vkreta/models/homemodel.dart';

class HomeData extends ChangeNotifier{
  HomeModel? homeData;

  loadData(HomeModel data){
    homeData=data;
    notifyListeners();
  }
}