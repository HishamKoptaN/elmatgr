import 'package:elmatgr/app/product_items/products_items_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../helpers/strings.dart';
import '../favorites/my_favorites_view.dart';
import '../my_orders/my_orders_view.dart';

class NavigatorBottomBarCnr extends GetxController {
  String title = homeTitle;
  final List<Widget> pages = [
    const MyFavoritesView(),
    const MyOrdersView(),
    const ProductItemsView(),
  ];
  int currentIndex = 2;
  void setCurrentIndex(int index) async {
    switch (index) {
      case 0:
        title = favoriteTitle;
      case 1:
        title = ordersTitle;
      case 2:
        title = homeTitle;
    }
    currentIndex = index;
    update();
  }
}
