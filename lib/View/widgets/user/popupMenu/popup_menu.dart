import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Logic/Controller/favourite_controller.dart';
import '../../../../Logic/Controller/product_controller.dart';
import '../../../../Model/menu_item_model.dart';
import '../../../../Model/menu_model.dart';

class PopupMenu extends StatelessWidget {
  PopupMenu({
    super.key,
    required this.productId,
  });

  final String productId;
  final controller = Get.find<ProductController>();
  final favController = Get.find<FavoriteController>();

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<MenuItemModel>(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        onSelected: (item) {
          onSelected(context, item);
        },
        itemBuilder: (context) => [
              ...MenuModel.menuItemsUser.map(buildItem).toList(),
            ]);
  }

  PopupMenuItem<MenuItemModel> buildItem(MenuItemModel item) => PopupMenuItem(
      value: item,
      child: SizedBox(
        width: double.infinity,
        height: 64,
        child: Row(
          children: [
            Icon(item.icon),
            const Text(" "),
            Expanded(
              child: Text(
                item.text,
                style: TextStyle(color: item.color),
              ),
            )
          ],
        ),
      ));

  void onSelected(BuildContext context, MenuItemModel item) {
    switch (item) {
      case MenuModel.addToCart:
        break;

      case MenuModel.itemDelete:
        favController.deleteFav(productId);
        break;
    }
  }
}
