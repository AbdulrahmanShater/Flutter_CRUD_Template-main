import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Logic/Controller/product_controller.dart';
import '../../../../Model/product_model.dart';
import '../popupMenu/popup_menu.dart';

class ProductsInStock extends StatelessWidget {
  ProductsInStock({super.key, required this.products});
  final List<dynamic> products;
  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: products.length,
        itemBuilder: ((context, index) {
          return Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
            height: 138,
            width: 393,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(255, 255, 255, 1),
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                Container(
                  height: 106,
                  width: 96,
                  margin: const EdgeInsets.only(left: 15),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(4),
                      image: DecorationImage(
                          image: NetworkImage('${products[index].imageUrl}'),
                          fit: BoxFit.cover)),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Text(
                              "${products[index].productNumber}",
                              style: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700),
                            ),
                            const Spacer(),
                            PopupMenu(
                              product: Product(
                                  productNumber: products[index].productNumber,
                                  productName: '${products[index].productName}',
                                  category: '${products[index].category}',
                                  quantity:
                                      int.parse('${products[index].quantity}'),
                                  price:
                                      double.parse('${products[index].price}'),
                                  description: '${products[index].description}',
                                  imageUrl: '${products[index].imageUrl}'),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        "${products[index].productName}",
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: Color.fromRGBO(0, 0, 0, 1)),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "${products[index].category}",
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(0, 0, 0, 1)),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "${products[index].quantity}",
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(0, 0, 0, 1)),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(children: [
                        Text("\$${products[index].price}",
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(0, 0, 0, 1))),
                        const Spacer(),
                        Switch(
                          value: true,
                          onChanged: (value) {},
                          activeTrackColor:
                              const Color.fromRGBO(67, 24, 255, 1),
                          activeColor: Colors.white,
                        ),
                      ]),
                    ],
                  ),
                ),
              ],
            ),
          );
        }));
  }
}
