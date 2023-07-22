import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Routes/routes.dart';

class SideBarMenu extends StatelessWidget {
  const SideBarMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(
            height: 20,
          ),
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Text(
              'Store Name',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.home),
            title: Text('Dashboard'),
          ),
          const ListTile(
            leading: Icon(Icons.import_export),
            title: Text('Stock'),
          ),
          const ListTile(
            leading: Icon(Icons.bookmark_added_sharp),
            title: Text('Orders'),
          ),
          const ListTile(
            leading: Icon(Icons.person),
            title: Text('Customars'),
          ),
          const SizedBox(height: 220),
          const ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Jack Madsen'),
          ),
          ListTile(
            leading: IconButton(
              onPressed: () {
                Get.toNamed(Routes.logIn);
              },
              icon: Icon(Icons.logout),
            ),
            title: const Text('Log Out'),
          ),
        ],
      ),
    );
  }
}
