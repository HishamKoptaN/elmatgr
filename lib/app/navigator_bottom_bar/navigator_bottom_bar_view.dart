// ignore_for_file: unused_import
import 'package:elmatgr/helpers/media_query.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import '../../helpers/constants.dart';
import '../categories/categories_view.dart';
import '../favorites/my_favorites_view.dart';
import '../product_details/view/product_details_view.dart';
import '../product_items/products_items_view.dart';
import '../single_category/single_category_view.dart';
import '../../test.dart';
import 'navigator_bottom_bar_cnr.dart';

class NavigateBarScreen extends StatefulWidget {
  const NavigateBarScreen({super.key});
  @override
  State<NavigateBarScreen> createState() => _HomePageState();
}

class _HomePageState extends State<NavigateBarScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<NavigatorBottomBarCnr>(
        init: NavigatorBottomBarCnr(),
        builder: (cnr) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              actions: [
                const Spacer(flex: 1),
                // Icon(Icons.person, size: context.screenSize * 0.15),
                // const Spacer(flex: 3),
                Text(
                  cnr.title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: context.screenSize * sevenFont,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // const Spacer(flex: 3),
                // GestureDetector(
                //     onTap: () {
                //       Get.to(const MyFavoritesView());
                //     },
                //     child:
                //         Icon(Icons.favorite, size: context.screenSize * 0.12)),
                const Spacer(
                  flex: 1,
                ),
              ],
            ),
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.white,
            body: SizedBox(child: cnr.pages[cnr.currentIndex]),
            bottomNavigationBar: SalomonBottomBar(
              currentIndex: cnr.currentIndex,
              backgroundColor: Colors.white30,
              onTap: (int index) async {
                cnr.setCurrentIndex(index);
              },
              items: [
                SalomonBottomBarItem(
                  selectedColor: const Color.fromARGB(255, 42, 38, 2),
                  unselectedColor: Colors.grey,
                  icon: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.black, Colors.black],
                      ).createShader(bounds);
                    },
                    child: Icon(
                      Icons.favorite,
                      size: context.screenSize * 0.10,
                      color: Colors.white,
                    ),
                  ),
                  title: Text(
                    "المفضله",
                    style: TextStyle(fontSize: context.screenSize * threeFont),
                  ),
                ),
                SalomonBottomBarItem(
                  selectedColor: const Color.fromARGB(255, 42, 38, 2),
                  unselectedColor: Colors.grey,
                  icon: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.black, Colors.black],
                      ).createShader(bounds);
                    },
                    child: Icon(
                      Icons.shopping_cart_rounded,
                      size: context.screenSize * 0.10,
                      color: Colors.white,
                    ),
                  ),
                  title: Text(
                    "سلة الطلبات",
                    style: TextStyle(fontSize: context.screenSize * threeFont),
                  ),
                ),
                // SalomonBottomBarItem(
                //   selectedColor: const Color.fromARGB(255, 42, 38, 2),
                //   unselectedColor: Colors.grey,
                //   icon: ShaderMask(
                //     shaderCallback: (Rect bounds) {
                //       return const LinearGradient(
                //         begin: Alignment.topCenter,
                //         end: Alignment.bottomCenter,
                //         colors: [Colors.black, Colors.black],
                //       ).createShader(bounds);
                //     },
                //     child: Icon(
                //       Icons.category_rounded,
                //       size: sizeIcon,
                //       color: Colors.white,
                //     ),
                //   ),
                //   title: Text(
                //     "الفئات",
                //     style: TextStyle(fontSize: sizeFont),
                //   ),
                // ),
                SalomonBottomBarItem(
                  selectedColor: const Color.fromARGB(255, 99, 92, 25),
                  unselectedColor: Colors.grey,
                  icon: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black,
                          Colors.black,
                        ],
                      ).createShader(bounds);
                    },
                    child: Icon(
                      Icons.home,
                      size: context.screenSize * 0.10,
                      color: Colors.white,
                    ),
                  ),
                  title: Text(
                    "الرئيسيه",
                    style: TextStyle(fontSize: context.screenSize * threeFont),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
