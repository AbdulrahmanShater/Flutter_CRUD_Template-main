import 'empty_favourites.dart';
import '../popupMenu/popup_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Logic/Controller/favourite_controller.dart';

class ProductsFavourites extends StatelessWidget {
  ProductsFavourites({super.key});

  final favController = Get.find<FavoriteController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 145,
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text(
            "Favorite",
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
          centerTitle: true,
        ),
        body: Obx((() => favController.favouritesList.isNotEmpty
            ? ListView.builder(
                itemCount: favController.favouritesList.length,
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
                                  image: NetworkImage(
                                      '${favController.favouritesList[index]['imageUrl']}'),
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
                                      "${favController.favouritesList[index]['productName']}",
                                      style: const TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    const Spacer(),
                                    PopupMenu(
                                        productId:
                                            '${favController.favouritesList[index]['productNumber']}'),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                "${favController.favouritesList[index]['category']}",
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                    color: Color.fromRGBO(0, 0, 0, 1)),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(children: [
                                Text(
                                    "\$${favController.favouritesList[index]['price']}",
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(0, 0, 0, 1))),
                                const Spacer(),
                              ]),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }))
            : const EmptyScreen())));
  }
}
