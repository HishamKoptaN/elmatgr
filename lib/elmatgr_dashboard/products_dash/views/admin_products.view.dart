import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/admin_products.controller.dart';
import 'widgets/add_new_product.widget.dart';

class AdminProductsView extends GetView<AdminProductsController> {
  const AdminProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AdminProductsController());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          'اضافة منتج',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color.fromARGB(255, 139, 121, 121),
          ),
        ),
      ),
      body: AddNewProduct(
        controller: controller,
      ),
    );
  }
}
