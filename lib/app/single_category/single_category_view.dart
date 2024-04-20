import 'package:elmatgr/helpers/media_query.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'single_category_controller.dart';

class SingleCategoryView extends StatelessWidget {
  String category = '';
  SingleCategoryView({super.key, required this.category});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(
          child: MyText(
            text: 'بناطيل',
            fontSize: context.screenSize * 0.1,
          ),
        ),
      ),
      body: Center(
        child: GetBuilder<SingleCategoryController>(
          init: SingleCategoryController(),
          builder: (controller) {
            controller.loadSingleCategories(category);
            return ListView.builder(
              itemCount: controller.categories.length,
              itemBuilder: (context, index) {
                final category = controller.categories[index];
                return GestureDetector(
                  onTap: () async {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: context.screenHeight * 6,
                      color: Colors.green,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(left: 40.0),
                            child: MyText(
                              text: category['product_name'],
                              fontSize: context.screenSize * 0.07,
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class MyText extends StatelessWidget {
  String text = '';
  double fontSize = 0;
  MyText({
    super.key,
    required this.text,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
      ),
    );
  }
}
