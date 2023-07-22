import '../../../Logic/Controller/favourite_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Logic/Controller/product_controller.dart';
import '../../../Model/product_model.dart';
import '../../../Services/DB/db.dart';
import '../../widgets/search_products.dart';
import '../../widgets/user/cart_item_customer.dart';
import '../../widgets/user/favourites/prodects_favourites.dart';

class CustomerHome extends StatelessWidget {
  CustomerHome({Key? key}) : super(key: key);

  final controller = Get.find<ProductController>();
  final favController = Get.find<FavoriteController>();
  final DB db = DB();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        toolbarHeight: 145,
        iconTheme: const IconThemeData(color: Colors.black),
        title: SearchProducts(),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              if (kDebugMode) {
                print(favController.favouritesList);
              }
              Get.to(ProductsFavourites());
            },
            icon: const Icon(
              Icons.favorite_border_outlined,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          StreamBuilder(
            stream: db.getData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                controller.products = snapshot.data!.docs
                    .map((e) => Product(
                        productNumber: e['productNumber'],
                        productName: e['productName'],
                        category: e['category'],
                        quantity: e['quantity'],
                        price: e['price'],
                        description: e['description'],
                        imageUrl: e['imageUrl']))
                    .toList();

                if (kDebugMode) {
                  print('length ${controller.products.length}');
                }
                if (controller.products.isNotEmpty) {
                  return CardItem(products: controller.products);
                } else {
                  return const Text("No thing");
                }
              } else {
                return CardItem(products: controller.products);
              }
            },
          ),
        ],
      ),
    );
  }
}
