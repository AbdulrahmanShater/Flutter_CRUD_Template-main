import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Routes/routes.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.grey.shade200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.playlist_remove_outlined,
            size: 100,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 18,
          ),
          const DefaultTextStyle(
            style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            child: Text('The stock is empty'),
          ),
          const SizedBox(
            height: 22,
          ),
          SizedBox(
              height: 41,
              width: 197,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  backgroundColor: Colors.grey.shade300,
                  elevation: 0,
                ),
                onPressed: () {
                  Get.toNamed(Routes.addProductForm);
                },
                child: const Text(
                  "Add product",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
