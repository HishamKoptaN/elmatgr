import 'package:elmatgr/helpers/media_query.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../helpers/constants.dart';
import '../add_order/add_order_view.dart';
import 'my_favorties_cnr.dart';

class MyFavoritesView extends StatefulWidget {
  const MyFavoritesView({
    super.key,
  });

  @override
  _MyFavoritesViewState createState() => _MyFavoritesViewState();
}

class _MyFavoritesViewState extends State<MyFavoritesView> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: StreamBuilder(
          stream: _firestore
              .collection('users')
              .doc('admin@gmail.com')
              .collection('my_favorites')
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return GetBuilder<MyFavoritesController>(
                init: MyFavoritesController(),
                builder: (cnr) {
                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      DocumentSnapshot document = snapshot.data!.docs[index];
                      String productId = document.id;
                      return GetBuilder<MyFavoritesController>(
                        init: MyFavoritesController(),
                        builder: (cnr) {
                          cnr.getFavoritesList(productId);
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: context.screenHeight * 25,
                              width: context.screenWidth * 100,
                              decoration: BoxDecoration(
                                color: Colors.green[400],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Image.network(
                                      document['product_image'],
                                      fit: BoxFit.cover,
                                      height: context.screenHeight * 20,
                                      width: context.screenWidth * 35,
                                    ),
                                    const Spacer(
                                      flex: 01,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        MyText(
                                          fontSize:
                                              context.screenSize * threeFont,
                                          fieldName:
                                              '${document['product_name']}',
                                          direction: true,
                                        ),
                                        const Spacer(
                                          flex: 01,
                                        ),
                                        MyText(
                                          fontSize:
                                              context.screenSize * threeFont,
                                          fieldName:
                                              '\$سعر المنتج: ${document['product_price']}',
                                          direction: true,
                                        ),
                                        const Spacer(
                                          flex: 01,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                Get.to(AddOrderView(productId));
                                              },
                                              child: Container(
                                                width: context.screenWidth * 30,
                                                height:
                                                    context.screenHeight * 7.5,
                                                decoration: const BoxDecoration(
                                                  color: Colors.green,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(10),
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      const Spacer(),
                                                      Icon(
                                                        CupertinoIcons
                                                            .cart_fill,
                                                        color: Colors.black,
                                                        size:
                                                            context.screenSize *
                                                                0.12,
                                                      ),
                                                      const Spacer(),
                                                      MyText(
                                                        fontSize:
                                                            context.screenSize *
                                                                fourFont,
                                                        fieldName: 'اطلب الان',
                                                        direction: true,
                                                      ),
                                                      const Spacer(),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                cnr.addToFavsProductList(
                                                    productId);
                                              },
                                              child: Container(
                                                width: context.screenWidth * 15,
                                                height:
                                                    context.screenHeight * 7.5,
                                                decoration: BoxDecoration(
                                                  color: cnr.isFavorite
                                                      ? Colors.green
                                                      : Colors.white,
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    Radius.circular(10),
                                                  ),
                                                ),
                                                child: Icon(
                                                  Icons.delete,
                                                  color: Colors.black,
                                                  size:
                                                      context.screenSize * 0.10,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const Spacer(
                                      flex: 01,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

class MyText extends StatelessWidget {
  String fieldName = '';
  double fontSize = 0;
  bool direction;
  MyText({
    super.key,
    required this.fieldName,
    required this.fontSize,
    required this.direction,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: direction ? Alignment.centerRight : Alignment.center,
      child: Text(
        fieldName,
        // textDirection:TextDirection.rtl : TextDirection.ltr,
        style: TextStyle(
          fontSize: fontSize,
        ),
      ),
    );
  }
}
