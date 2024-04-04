// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'categories/categories_view.dart';
import 'elmatgr_dashboard/products_dash/views/admin_products.view.dart';
import 'single_category/single_category_view.dart';

class NavigateBarScreen extends StatefulWidget {
  const NavigateBarScreen({super.key});
  @override
  State<NavigateBarScreen> createState() => _HomePageState();
}

class _HomePageState extends State<NavigateBarScreen> {
  final List<Widget> _pages = [
    const CategoriesView(),
    const AdminProductsView(),
    const AdminProductsView(),
    const AdminProductsView(),
  ];
  int _currentIndex = 0;
  double sizeIcon = 25;
  double sizeFont = 12;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.amber,
      body: SizedBox(child: _pages[_currentIndex]),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.white30,
        onTap: (int index) {
          setState(
            () {
              _currentIndex = index;
            },
          );
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
                Icons.monetization_on_outlined,
                size: sizeIcon,
                color: Colors.white,
              ),
            ),
            title: Text(
              "My Investments",
              style: TextStyle(fontSize: sizeFont),
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
                FontAwesomeIcons.gem,
                size: sizeIcon,
                color: Colors.white,
              ),
            ),
            title: Text(
              "Jewelry",
              style: TextStyle(fontSize: sizeFont),
            ),
          ),
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
                size: sizeIcon,
                color: Colors.white,
              ),
            ),
            title: Text(
              "Home",
              style: TextStyle(fontSize: sizeFont),
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
                Icons.monitor_heart_sharp,
                size: sizeIcon,
                color: Colors.white,
              ),
            ),
            title: Text(
              "Invest now",
              style: TextStyle(fontSize: sizeFont),
            ),
          ),
        ],
      ),
    );
  }
}
