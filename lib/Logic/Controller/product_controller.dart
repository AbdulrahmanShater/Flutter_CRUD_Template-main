import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../../View/Screens/admin/stock_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../Model/product_model.dart';
import '../../Routes/routes.dart';
import '../../Services/DB/db.dart';

class ProductController extends GetxController {
  TextEditingController productNumberController = TextEditingController();
  TextEditingController productNameController = TextEditingController();
  TextEditingController productCategoryController = TextEditingController();
  TextEditingController productQuantityController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();

  File? pickedFile;
  String imgUrl = "";
  final imagePicker = ImagePicker();

  DB db = DB();
  List<dynamic> products = [];

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
  }

  // add to firebase
  Future<void> addProduct(Product product) async {
    // we need Reference to firebase
    final productRef = db.productRef.doc();

    product.productNumber = productRef.id;
    if (pickedFile == null) {
      final ref = db.refStorage.child("${product.productNumber}.jpg");
      await ref.putFile(pickedFile!);
      imgUrl = await ref.getDownloadURL();
    } else {
      final ref = db.refStorage.child("${product.productNumber}.jpg");
      await ref.putFile(pickedFile!);
      imgUrl = await ref.getDownloadURL();
    }
    product.imageUrl = imgUrl.toString();
    final data = product.toJson(); // insert to firebase
    productRef.set(data).whenComplete(() {
      clearController();
      Get.snackbar("", "Added successfully..");
      Get.to(StockScreen());
      update();
    }).catchError((error) {
      Get.snackbar("Error", "something went wrong");
    });
  }

  Future<void> takePhoto(ImageSource source) async {
    final pickedImage =
        await imagePicker.pickImage(source: source, imageQuality: 100);

    pickedFile = File(pickedImage!.path);
    if (kDebugMode) {
      print("..............");
      print(pickedFile);
      print("..............");
    }
  }

  // update on firebase
  Future<void> updateProduct(Product product) async {
    final ref = db.refStorage.child("${product.productNumber}.jpg");
    if (pickedFile == null) {
    } else {
      await ref.putFile(pickedFile!);
      imgUrl = await ref.getDownloadURL();
    }

    final docProduct = db.productRef.doc(product.productNumber);
    docProduct.update({
      "productName": product.productName,
      "category": product.category,
      "quantity": product.quantity,
      "price": product.price,
      "description": product.description,
      "imageUrl": imgUrl.toString(),
    }).whenComplete(() {
      if (kDebugMode) {
        print("update done");
      }
      Get.snackbar("", "Update successfully..");
      // clearController();
      update();
      Get.toNamed(Routes.stockScreen);
    });
  }

  // delete on firebase
  Future<void> deleteData(productNumber) async {
    await db.productRef.doc(productNumber).delete().whenComplete(() async {
      Get.snackbar("", "Delete successfully..");
      if (kDebugMode) {
        print("delete $productNumber");
      }

      db.refStorage
          .child(productNumber + ".jpg")
          .delete()
          .whenComplete(() => print("image delete"));
    });
  }

  // clear Controller
  void clearController() {
    productNameController.clear();
    productCategoryController.clear();
    productQuantityController.clear();
    productPriceController.clear();
    productDescriptionController.clear();
    pickedFile = null;
  }
}
