import 'product_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../Model/product_model.dart';

class FavoriteController extends GetxController {
  List<dynamic> favouritesList = [].obs;
  final controller = Get.put(ProductController());
  Product? product;

  void manageFavourites(String id) {
    if (kDebugMode) {
      print('First isFav ${isFave(id)}');
    }
    for (var i = 0; i < controller.products.length; i++) {
      var fromJ = productToJson(controller.products[i]);
      var fromJson = productFromJson(fromJ);
      var toJson = fromJson.toJson();
      if (toJson['productNumber'] == id && isFave(id) == false) {
        favouritesList.add(toJson);
        if (kDebugMode) {
          print("added!!!");
        }
      }
    }
    if (kDebugMode) {
      print('Second isFav ${isFave(id)}');
    }
  }

  bool isFave(String productId) {
    return favouritesList
        .any((element) => element['productNumber'] == productId);
  }

  deleteFav(String productId) {
    var removeProduct = favouritesList
        .indexWhere((element) => element['productNumber'] == productId);
    if (kDebugMode) {
      print(removeProduct);
    }
    favouritesList.removeAt(removeProduct);
  }
}
