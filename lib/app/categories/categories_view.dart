import 'package:elmatgr/helpers/media_query.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../single_category/single_category_view.dart';
import 'categories_controller.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({
    super.key,
  });
  @override
  _CategoriesViewState createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(
          child: MyText(
            text: 'تصنيفات',
            fontSize: context.screenSize * 0.1,
          ),
        ),
      ),
      body: Center(
        child: GetBuilder<CategoryController>(
          init: CategoryController(),
          builder: (controller) {
            return ListView.builder(
              itemCount: controller.categories.length,
              itemBuilder: (context, index) {
                final category = controller.categories[index];
                return GestureDetector(
                  onTap: () async {
                    await Get.to(
                      SingleCategoryView(
                        category: '${category['category_title']}',
                      ),
                    );
                  },
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
                              text: category['category_name'],
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
