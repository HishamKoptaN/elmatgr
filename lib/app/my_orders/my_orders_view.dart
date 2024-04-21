import 'package:elmatgr/helpers/media_query.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../helpers/constants.dart';
import 'my_orders_controller.dart';

class MyOrdersView extends StatefulWidget {
  const MyOrdersView({super.key});

  @override
  _MyOrdersViewState createState() => _MyOrdersViewState();
}

class _MyOrdersViewState extends State<MyOrdersView> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: StreamBuilder(
          stream: _firestore
              .collection('users')
              .doc('admin@gmail.com')
              .collection('my_orders')
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading");
            } else {
              return GetBuilder<MyOrdersController>(
                init: MyOrdersController(),
                builder: (cnr) {
                  return ListView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      DocumentSnapshot document = snapshot.data!.docs[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: context.screenHeight * 25,
                          width: context.screenWidth * 100,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(77, 196, 194, 194),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              bottomRight: Radius.circular(50),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                const Spacer(),
                                Column(
                                  children: [
                                    const Spacer(),
                                    MyText(
                                      fontSize: context.screenSize * threeFont,
                                      fieldName:
                                          'حالة الطلب : ${document['order_status']}',
                                      direction: true,
                                    ),
                                    const Spacer(),
                                    Image.network(
                                      document['product_image'],
                                      fit: BoxFit.cover,
                                      height: context.screenHeight * 20,
                                      width: context.screenWidth * 35,
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                                const Spacer(
                                  flex: 01,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Spacer(),
                                    MyText(
                                      fontSize: context.screenSize * threeFont,
                                      fieldName: '${document['product_name']}',
                                      direction: true,
                                    ),
                                    const Spacer(
                                      flex: 01,
                                    ),
                                    MyText(
                                      fontSize: context.screenSize * threeFont,
                                      fieldName:
                                          '\$سعر المنتج: ${document['product_price']}',
                                      direction: true,
                                    ),
                                    const Spacer(
                                      flex: 01,
                                    ),
                                    MyText(
                                      fontSize: context.screenSize * threeFont,
                                      fieldName:
                                          'عدد : ${document['product_count']}',
                                      direction: false,
                                    ),
                                    const Spacer(
                                      flex: 01,
                                    ),
                                  ],
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
