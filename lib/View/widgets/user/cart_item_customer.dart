import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Logic/Controller/favourite_controller.dart';
import '../../../Logic/Controller/product_controller.dart';

class CardItem extends StatelessWidget {
  CardItem({Key? key, required this.products}) : super(key: key);
  final controller = Get.find<ProductController>();
  final favController = Get.find<FavoriteController>();
  final List products;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                childAspectRatio: .8,
                mainAxisSpacing: 9.0,
                crossAxisSpacing: 15.0,
                maxCrossAxisExtent: 214),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(5),
                child: Container(
                  height: 214,
                  width: 169,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 153,
                          height: 128,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Stack(
                            children: [
                              Container(
                                height: 106,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(4),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            '${products[index].imageUrl}'),
                                        fit: BoxFit.cover)),
                              ),
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: InkWell(
                                      onTap: () {
                                        favController.manageFavourites(
                                          products[index].productNumber,
                                        );
                                      },
                                      child: Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: Colors.white),
                                        child: Obx((() {
                                          return favController.isFave(
                                                  products[index].productNumber)
                                              ? const Icon(
                                                  Icons.favorite,
                                                  size: 15,
                                                  color: Colors.red,
                                                )
                                              : const Icon(
                                                  Icons.favorite_outline,
                                                  size: 15,
                                                  color: Colors.black,
                                                );
                                        })),
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "${products[index].productName}",
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            )),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "${products[index].category}",
                              style: const TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Color.fromRGBO(151, 151, 151, 1),
                                fontSize: 10,
                              ),
                            )),
                      ),

                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              " \$ ${products[index].price}",
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.shopping_cart_outlined)),
                          ],
                        ),
                      ),
                      // Text('${controller.favouritesList[index]['productNumber']}')
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
