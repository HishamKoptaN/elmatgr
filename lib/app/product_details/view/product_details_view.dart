import 'package:elmatgr/helpers/constants.dart';
import 'package:elmatgr/helpers/media_query.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../add_order/add_order_view.dart';
import '../controllers/product_details_cnr.dart';

class ProDetView extends StatelessWidget {
  final String productId;
  const ProDetView(this.productId, {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'تفاصيل المنتج',
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
            color: Colors.black,
            size: 28,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<ProductDetailsController>(
          init: ProductDetailsController(),
          builder: (cnr) {
            cnr.getFavoritesList(productId);
            return FutureBuilder<DocumentSnapshot>(
              future: cnr.questionss.doc(productId).get(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return GetBuilder<ProductDetailsController>(
                    builder: (optionController) {
                      Map<String, dynamic> document =
                          snapshot.data!.data() as Map<String, dynamic>;
                      return Card(
                        color: Colors.white,
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              const Spacer(
                                flex: 2,
                              ),
                              Stack(
                                children: [
                                  Image.network(
                                    document['product_image'],
                                    fit: BoxFit.contain,
                                    height: context.screenHeight * 25,
                                    width: context.screenWidth * 100,
                                  ),
                                ],
                              ),
                              const Spacer(),
                              MyText(
                                text: document['product_name'],
                                fontSize: context.screenSize * fourFont,
                                direction: false,
                              ),
                              const Spacer(),
                              MyText(
                                text: 'سعر المنتج',
                                fontSize: context.screenSize * fiveFont,
                                direction: true,
                              ),
                              const Divider(
                                indent: 250,
                                thickness: 3,
                              ),
                              MyText(
                                text: '\$${document['product_price']}',
                                fontSize: context.screenSize * fourFont,
                                direction: true,
                              ),
                              const Spacer(),
                              MyText(
                                text: 'وصف المنتج',
                                fontSize: context.screenSize * fiveFont,
                                direction: true,
                              ),
                              const Divider(
                                indent: 250,
                                thickness: 3,
                              ),
                              MyText(
                                fontSize: context.screenSize * fourFont,
                                text: '${document['product_description']}',
                                direction: true,
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  cnr.addToFavsProductList(productId);
                                },
                                child: Container(
                                  width: context.screenWidth * 40,
                                  height: context.screenHeight * 7.5,
                                  decoration: BoxDecoration(
                                    color: cnr.isFavourite
                                        ? Colors.green
                                        : Colors.white,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Spacer(),
                                        Icon(
                                          optionController.isFavourite
                                              ? CupertinoIcons.heart_fill
                                              : CupertinoIcons.heart,
                                          color: cnr.isFavourite
                                              ? Colors.red
                                              : const Color.fromARGB(
                                                  255, 36, 32, 32),
                                          size: context.screenSize * 0.12,
                                        ),
                                        const Spacer(),
                                        MyText(
                                          fontSize:
                                              context.screenSize * fourFont,
                                          text: cnr.isFavourite
                                              ? 'ازاله من المفضله'
                                              : 'اضف الي المفضله',
                                          direction: true,
                                        ),
                                        const Spacer(),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  Get.to(
                                    AddOrderView(productId),
                                  );
                                },
                                child: Container(
                                  width: context.screenWidth * 40,
                                  height: context.screenHeight * 7.5,
                                  decoration: const BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Spacer(),
                                        Icon(
                                          CupertinoIcons.cart_fill,
                                          color: Colors.black,
                                          size: context.screenSize * 0.12,
                                        ),
                                        const Spacer(),
                                        MyText(
                                          fontSize:
                                              context.screenSize * fourFont,
                                          text: 'اطلب الان',
                                          direction: true,
                                        ),
                                        const Spacer(),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const Spacer(
                                flex: 5,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
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
  bool direction;
  MyText({
    super.key,
    required this.text,
    required this.fontSize,
    required this.direction,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: direction ? Alignment.centerRight : Alignment.center,
      child: Text(
        text,
        // textDirection:TextDirection.rtl : TextDirection.ltr,
        style: TextStyle(
          fontSize: fontSize,
        ),
      ),
    );
  }
}
