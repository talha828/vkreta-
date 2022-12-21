import 'package:get/get.dart';
import 'package:vkreta/models/homemodel.dart';
import 'package:vkreta/models/productsearchModel.dart';

import '../models/searchModel.dart';

class HomePage extends GetxController{
  Rx<HomeScreenModel> homeScreenModel=HomeScreenModel().obs;
}
class ViewAllController extends GetxController{
  RxList<ViewAllModel> viewAllModel=<ViewAllModel>[].obs;
}
class ProductSearchModelController extends GetxController{
  Rx<SearchModel> product=SearchModel().obs;
  RxBool exist=false.obs;
}
class FilterSearchModelController extends GetxController{
  Rx<SearchModel> product=SearchModel().obs;
  RxBool exist=false.obs;
}