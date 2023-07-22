import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Logic/Controller/product_controller.dart';
import '../../../../Model/menu_item_model.dart';
import '../../../../Model/menu_model.dart';
import '../../../../Model/product_model.dart';
import '../../../Screens/admin/edit_product_screen.dart';

class PopupMenu extends StatelessWidget {
  final Product product;

  PopupMenu({super.key, required this.product});

  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('THIS is imageURL ${controller.imgUrl}');
    }
    return PopupMenuButton<MenuItemModel>(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        onSelected: (item) {
          onSelected(context, item);
        },
        itemBuilder: (context) => [
              ...MenuModel.menuItems.map(buildItem).toList(),
            ]);
  }

  PopupMenuItem<MenuItemModel> buildItem(MenuItemModel item) => PopupMenuItem(
      value: item,
      child: SizedBox(
        width: 147,
        height: 64,
        child: Row(
          children: [
            Icon(item.icon),
            const Text(" "),
            Text(
              item.text,
              style: TextStyle(color: item.color),
            )
          ],
        ),
      ));

  void onSelected(BuildContext context, MenuItemModel item) {
    switch (item) {
      case MenuModel.itemUpdate:
        controller.productNameController.text = product.productName;
        controller.productCategoryController.text = product.category;
        controller.productQuantityController.text = product.quantity.toString();
        controller.productPriceController.text = product.price.toString();
        controller.productDescriptionController.text = product.description;
        controller.imgUrl = product.imageUrl;
        Get.to(EditProductScreen(
          product: product,
        ));
        break;
      case MenuModel.itemDelete:
        controller.deleteData(product.productNumber);
        break;
    }
  }
}
