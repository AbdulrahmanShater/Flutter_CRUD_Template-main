import '../View/Screens/login_screen.dart';
import '../View/Screens/admin/stock_screen.dart';
import 'package:get/get.dart';

import '../Logic/Bindings/favorite_binding.dart';
import '../Logic/Bindings/product_binding.dart';
import '../View/Screens/admin/Add_product_form_screen.dart';
import '../View/Screens/user/customer_home.dart';

class AppRoutes {
  //initialRoute
  static const stock = Routes.stockScreen;
  static const login = Routes.logIn;
  static const addProduct = Routes.logIn;
  static const customerHome = Routes.customerHome;

  //getPages
  static final routes = [
    GetPage(
      name: Routes.stockScreen,
      page: () => StockScreen(),
      binding: ProductBinding(),
    ),
    GetPage(
      name: Routes.logIn,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: Routes.addProductForm,
      page: () => AddProductFromScreen(),
    ),
    GetPage(
      name: Routes.customerHome,
      page: () => CustomerHome(),
      binding: FavoriteBindings(),
    ),
  ];
}

class Routes {
  static const stockScreen = '/StockScreen';
  static const logIn = '/loginScreen';
  static const addProductForm = '/AddProductFromScreen';
  static const editProduct = '/EditProductScreen';
  static const customerHome = '/CustomerHome';
}
