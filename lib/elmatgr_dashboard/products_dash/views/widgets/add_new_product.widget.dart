import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/colors.dart';
import '../../controllers/admin_products.controller.dart';
import 'admin_text_field.dart';

class AddNewProduct extends StatelessWidget {
  const AddNewProduct({
    super.key,
    required this.controller,
  });
  final AdminProductsController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        shrinkWrap: true,
        children: [
          Row(
            children: [
              Container(
                width: 3,
                height: 25,
                color: AppColors.customRed,
              ),
              const SizedBox(width: 10),
              const Text(
                'اضافة منتج جديد',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          AdminTextField(
            controller: controller.productNameController,
            labelText: 'اسم المنتج',
            hint: 'خزف ملون',
          ),
          const SizedBox(height: 30),
          AdminTextField(
            controller: controller.productDescriptionController,
            maxLines: 5,
            labelText: 'وصف المنتج',
            hint: 'مثال: منتج تمت صناعته بأفضل الخامات ...',
          ),
          const SizedBox(height: 30),
          AdminTextField(
            controller: controller.productPriceController,
            labelText: 'السعر',
            hint: '120 ر.س',
          ),
          const SizedBox(height: 30),
          AdminTextField(
            controller: controller.imageController,
            onTap: () => controller.selectPicture(),
            suffixIcon: Icons.cloud_upload,
            labelText: 'اضافة صورة للمنتج',
            hint: 'ارفق صورة',
          ),
          const SizedBox(height: 30),
          Obx(
            () {
              return DropdownButton<String>(
                isExpanded: true,
                items: controller.categoryItems,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
                value: controller.selectedCategory.value,
                onChanged: (value) {
                  if (value != null) {
                    controller.selectedCategory.value = value;
                  }
                },
              );
            },
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () => controller.addProduct(),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.customRed,
            ),
            child: const Text('اضافة'),
          ),
        ],
      ),
    );
  }
}
