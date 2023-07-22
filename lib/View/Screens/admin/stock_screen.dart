import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Logic/Controller/product_controller.dart';
import '../../../Model/product_model.dart';
import '../../../Routes/routes.dart';
import '../../../Services/DB/db.dart';
import '../../widgets/admin/stock/empty_screen.dart';
import '../../widgets/admin/stock/products_in_stock.dart';
import '../../widgets/side_bar_menu.dart';

class StockScreen extends StatelessWidget {
  StockScreen({Key? key}) : super(key: key);
  final controller = Get.find<ProductController>();
  final DB db = DB();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 154,
          iconTheme: const IconThemeData(color: Colors.black),
          title:
              const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "Stock",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ]),
          elevation: 0,
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Get.toNamed(Routes.addProductForm);
              },
              icon: const Icon(
                Icons.add,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: StreamBuilder(
            stream: db.getData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (kDebugMode) {
                  print("not empty screen");
                }
                controller.products = snapshot.data!.docs
                    .map((e) => Product(
                        productNumber: e['productNumber'],
                        productName: e['productName'],
                        description: e['description'],
                        category: e['category'],
                        price: e['price'],
                        quantity: e['quantity'],
                        imageUrl: e['imageUrl']))
                    .toList();
                if (kDebugMode) {
                  print("products.length   ${controller.products.length}");
                }

                if (controller.products.isNotEmpty) {
                  return ProductsInStock(
                    products: controller.products,
                  );
                } else {
                  if (kDebugMode) {
                    print("empty screen");
                  }
                  return const EmptyScreen();
                }
              } else {
                return ProductsInStock(
                  products: controller.products,
                );
              }
            }),
        drawer: const SideBarMenu());
  }
}
