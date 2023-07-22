import 'menu_item_model.dart';
import 'package:flutter/material.dart';

class MenuModel {
  static const List<MenuItemModel> menuItems = [
    itemUpdate,
    itemDelete,
  ];

  static const List<MenuItemModel> menuItemsUser = [
    addToCart,
    seeSimilarItems,
    itemDelete,
  ];

  static const itemUpdate =
      MenuItemModel(icon: Icons.edit, text: 'Edit', color: Colors.black);

  static const itemDelete = MenuItemModel(
      icon: Icons.delete_forever_outlined, text: 'Delete', color: Colors.red);

  static const addToCart = MenuItemModel(
      icon: Icons.shopping_cart_outlined,
      text: 'Add To Cart',
      color: Colors.black);

  static const seeSimilarItems = MenuItemModel(
      icon: Icons.search, text: 'See Similar item', color: Colors.black);
}
