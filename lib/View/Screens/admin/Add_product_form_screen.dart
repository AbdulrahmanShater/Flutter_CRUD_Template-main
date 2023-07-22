import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../Logic/Controller/product_controller.dart';
import '../../../Model/product_model.dart';
import '../../widgets/admin/Add_Product_Widgets/text_field_product.dart';
import '../../widgets/admin/Add_Product_Widgets/text_utils.dart';

class AddProductFromScreen extends StatelessWidget {
  AddProductFromScreen({Key? key}) : super(key: key);

  final controller = Get.find<ProductController>();

  // final controller = Get.find<AddProductController>();
  final myKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // var s = null.obs;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text(
            "Cancel",
            style: TextStyle(
                color: Colors.black, fontSize: 12, fontWeight: FontWeight.w400),
          ),
        ),
        title: const Text(
          "Add new product",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),
        ),
        // titleSpacing: 50,
        centerTitle: true,

        actions: [
          GetBuilder<ProductController>(builder: (_) {
            return TextButton(
              onPressed: () async {
                if (myKey.currentState!.validate()) {
                  Product product = Product(
                      productName: controller.productNameController.text,
                      category: controller.productCategoryController.text,
                      quantity:
                          int.parse(controller.productQuantityController.text),
                      price:
                          double.parse(controller.productPriceController.text),
                      description: controller.productDescriptionController.text,
                      imageUrl: controller.imgUrl);
                  if (controller.pickedFile == null) {
                    if (kDebugMode) {
                      print("no image selected");
                    }
                    Get.snackbar(
                      "Error",
                      "You must add image please",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: const Color.fromRGBO(217, 217, 217, 1),
                    );
                  }
                  await controller.addProduct(product);
                } else {
                  return;
                }
              },
              child: const Text(
                "Add",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
            );
          })
        ],
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 56),
          child: Form(
            key: myKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 16,
                ),
                const TextUtils(
                  text: 'Product Name',
                ),
                const SizedBox(
                  height: 8,
                ),
                ProductTextField(
                  height: 40,
                  width: 361,
                  controller: controller.productNameController,
                  obscureText: false,
                  hintText: 'Product Name',
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      return null;
                    } else {
                      return 'Enter Product Name Please';
                    }
                  },
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                ),
                const SizedBox(
                  height: 16,
                ),
                const TextUtils(
                  text: 'Category',
                ),
                const SizedBox(
                  height: 8,
                ),
                ProductTextField(
                  height: 40,
                  width: 361,
                  controller: controller.productCategoryController,
                  obscureText: false,
                  hintText: 'Product Category',
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      return null;
                    } else {
                      return 'Enter Product Category Please';
                    }
                  },
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                ),
                const SizedBox(
                  height: 16,
                ),
                const TextUtils(
                  text: 'Quantity',
                ),
                const SizedBox(
                  height: 8,
                ),
                ProductTextField(
                  height: 40,
                  width: 361,
                  controller: controller.productQuantityController,
                  keyboardType: TextInputType.number,
                  obscureText: false,
                  hintText: 'Quantity',
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      return null;
                    } else {
                      return 'Enter Product Quantity Please';
                    }
                  },
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                ),
                const SizedBox(
                  height: 16,
                ),
                const TextUtils(
                  text: 'Price',
                ),
                const SizedBox(
                  height: 8,
                ),
                ProductTextField(
                  height: 40,
                  width: 361,
                  controller: controller.productPriceController,
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  hintText: 'Price',
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      return null;
                    } else {
                      return 'Enter Product Price Please';
                    }
                  },
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                ),
                const SizedBox(
                  height: 16,
                ),
                const TextUtils(
                  text: 'Description',
                ),
                const SizedBox(
                  height: 8,
                ),
                ProductTextField(
                  height: 76,
                  width: 361,
                  controller: controller.productDescriptionController,
                  obscureText: false,
                  hintText: 'placeholder',
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      return null;
                    } else {
                      return 'Enter Product Description Please';
                    }
                  },
                  maxLength: 100,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 8),
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.takePhoto(ImageSource.gallery);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(217, 217, 217, 1),
                      padding: const EdgeInsets.all(16),
                      minimumSize: const Size(1, 6)),
                  child: const Row(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Add Image",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.add_photo_alternate_outlined,
                            color: Colors.black,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
