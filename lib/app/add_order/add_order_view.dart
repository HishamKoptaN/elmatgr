import 'package:elmatgr/helpers/constants.dart';
import 'package:elmatgr/helpers/media_query.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'add_order_controller.dart';

class AddOrderView extends StatelessWidget {
  final String productId;
  const AddOrderView(this.productId, {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'طلب المنتج',
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
        child: GetBuilder<AddOrderController>(
          init: AddOrderController(),
          builder: (cnr) {
            cnr.getFavoritesList(productId);
            return FutureBuilder<DocumentSnapshot>(
              future: cnr.questionss.doc(productId).get(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                Map<String, dynamic> document =
                    snapshot.data!.data() as Map<String, dynamic>;
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return GetBuilder<AddOrderController>(
                    builder: (optionController) {
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
                                bold: true,
                              ),
                              const Spacer(),
                              MyText(
                                text: 'سعر المنتج',
                                fontSize: context.screenSize * fiveFont,
                                direction: true,
                                bold: true,
                              ),
                              const Divider(
                                indent: 250,
                                thickness: 3,
                              ),
                              MyText(
                                text: '\$${document['product_price']}',
                                fontSize: context.screenSize * fourFont,
                                direction: true,
                                bold: true,
                              ),
                              const Spacer(),
                              MyText(
                                text: 'وصف المنتج',
                                fontSize: context.screenSize * fiveFont,
                                direction: true,
                                bold: true,
                              ),
                              const Divider(
                                indent: 250,
                                thickness: 3,
                              ),
                              MyText(
                                fontSize: context.screenSize * fourFont,
                                text: '${document['product_description']}',
                                direction: true,
                                bold: false,
                              ),
                              const Spacer(),
                              MyText(
                                text: 'العدد',
                                fontSize: context.screenSize * fiveFont,
                                direction: false,
                                bold: true,
                              ),
                              const Divider(
                                indent: 100,
                                endIndent: 100,
                                thickness: 3,
                              ),
                              const Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      cnr.increament();
                                    },
                                    child: Container(
                                      width: context.screenWidth * 20,
                                      height: context.screenWidth * 20,
                                      decoration: BoxDecoration(
                                        color: Colors.black26,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: MyText(
                                        direction: false,
                                        fontSize: context.screenSize * thirteen,
                                        text: '+',
                                        bold: true,
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  Container(
                                    width: context.screenWidth * 20,
                                    height: context.screenWidth * 20,
                                    decoration: BoxDecoration(
                                      color: Colors.green[200],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: MyText(
                                      direction: false,
                                      fontSize: context.screenSize * eightFont,
                                      text: cnr.countOfProduct.toString(),
                                      bold: true,
                                    ),
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      cnr.decreament();
                                    },
                                    child: Container(
                                      width: context.screenWidth * 20,
                                      height: context.screenWidth * 20,
                                      decoration: BoxDecoration(
                                        color: Colors.black26,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: MyText(
                                        direction: false,
                                        fontSize: context.screenSize * thirteen,
                                        text: '-',
                                        bold: true,
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                ],
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  cnr.confirmOrCancel(productId);
                                },
                                child: Container(
                                  width: context.screenWidth * 40,
                                  height: context.screenHeight * 7.5,
                                  decoration: const BoxDecoration(
                                    color: Colors.green,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
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
                                          text: 'تاكيد الطلب',
                                          direction: true,
                                          bold: true,
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
  bool bold;

  MyText({
    super.key,
    required this.text,
    required this.fontSize,
    required this.direction,
    required this.bold,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: direction ? Alignment.centerRight : Alignment.center,
      child: Text(
        text,
        style: TextStyle(
            fontSize: fontSize, fontWeight: bold ? FontWeight.bold : null),
      ),
    );
  }
}
