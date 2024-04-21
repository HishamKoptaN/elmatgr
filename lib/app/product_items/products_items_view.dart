import 'package:elmatgr/helpers/media_query.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../helpers/constants.dart';
import '../product_details/view/product_details_view.dart';
import 'offers.dart';
import 'products_items_contrller.dart';

class ProductItemsView extends StatefulWidget {
  const ProductItemsView({super.key});
  @override
  _ProductItemsViewState createState() => _ProductItemsViewState();
}

class _ProductItemsViewState extends State<ProductItemsView> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(child: Offers()),
          const Spacer(),
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15))),
            width: context.screenWidth * 100,
            height: context.screenHeight * 60,
            child: StreamBuilder(
              stream: _firestore.collection('products').snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text("Loading");
                } else {
                  return GetBuilder<ProductsItems>(
                    init: ProductsItems(),
                    builder: (cnr) {
                      return SizedBox(
                        child: GridView.builder(
                          padding: const EdgeInsets.all(10),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 8.0,
                            mainAxisExtent: context.screenHeight * 40,
                          ),
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (BuildContext context, int index) {
                            DocumentSnapshot document =
                                snapshot.data!.docs[index];
                            String proId = document.id;
                            return Container(
                              height: context.screenHeight * 80,
                              width: context.screenWidth * 60,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Stack(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        const Spacer(
                                          flex: 01,
                                        ),
                                        Container(
                                          color: const Color.fromARGB(
                                              77, 196, 194, 194),
                                          child: GestureDetector(
                                            onTap: () {
                                              Get.to(
                                                ProDetView(
                                                  proId,
                                                ),
                                              );
                                            },
                                            child: Image.network(
                                              document['product_image'],
                                              fit: BoxFit.cover,
                                              height: context.screenHeight * 25,
                                              width: context.screenWidth * 100,
                                            ),
                                          ),
                                        ),
                                        const Spacer(
                                          flex: 01,
                                        ),
                                        MyText(
                                          fontSize:
                                              context.screenSize * threeFont,
                                          fieldName:
                                              '${document['product_name']}',
                                        ),
                                        const Spacer(
                                          flex: 01,
                                        ),
                                        MyText(
                                          fontSize:
                                              context.screenSize * threeFont,
                                          fieldName:
                                              '\$${document['product_price']}',
                                        ),
                                        const Spacer(
                                          flex: 01,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MyText extends StatelessWidget {
  const MyText({
    super.key,
    required this.fieldName,
    required this.fontSize,
  });

  final double fontSize;
  final String fieldName;
  @override
  Widget build(BuildContext context) {
    return Text(
      fieldName,
      style: TextStyle(
          fontSize: fontSize, fontWeight: FontWeight.bold, color: Colors.black),
    );
  }
}
