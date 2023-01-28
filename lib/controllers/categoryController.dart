import 'package:get/get.dart';
import 'package:vkreta/models/TopCategoryModel.dart';


class CategoryController extends GetxController{
  Rx<TopCategoryModel> data =TopCategoryModel().obs;
}