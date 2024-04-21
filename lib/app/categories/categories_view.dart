import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elmatgr/helpers/media_query.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../helpers/constants.dart';
import 'categories_controller.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({
    super.key,
  });
  @override
  _CategoriesViewState createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          width: context.screenWidth * 95,
          height: context.screenHeight * 85,
          child: StreamBuilder(
            stream: _firestore.collection('categories').snapshots(),
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
                return GetBuilder<CategoryController>(
                  init: CategoryController(),
                  builder: (cnr) {
                    return SizedBox(
                      child: GridView.builder(
                        padding: const EdgeInsets.all(10),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisSpacing: 8.0,
                          mainAxisExtent: context.screenHeight * 20,
                        ),
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (BuildContext context, int index) {
                          DocumentSnapshot document =
                              snapshot.data!.docs[index];
                          String proId = document.id;
                          return Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(35),
                                bottomLeft: Radius.circular(35),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Stack(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        decoration: const BoxDecoration(
                                          color:
                                              Color.fromARGB(77, 196, 194, 194),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                          ),
                                        ),
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: Image.network(
                                            document['category_image'],
                                            fit: BoxFit.contain,
                                            height: context.screenHeight * 15,
                                            width: context.screenWidth * 40,
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                      SizedBox(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Spacer(),
                                            MyText(
                                              fontSize: context.screenSize *
                                                  threeFont,
                                              fieldName:
                                                  '${document['category_name']}',
                                            ),
                                            Spacer(),
                                            SizedBox(
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: Container(
                                                      decoration:
                                                          const BoxDecoration(
                                                        color: Color.fromARGB(
                                                            77, 196, 194, 194),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  10),
                                                          topRight:
                                                              Radius.circular(
                                                                  10),
                                                        ),
                                                      ),
                                                      child: MyText(
                                                        fontSize:
                                                            context.screenSize *
                                                                twoFont,
                                                        fieldName:
                                                            '${document['category_description_one']}',
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: Container(
                                                      decoration:
                                                          const BoxDecoration(
                                                        color: Color.fromARGB(
                                                            77, 196, 194, 194),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  10),
                                                          topRight:
                                                              Radius.circular(
                                                                  10),
                                                        ),
                                                      ),
                                                      child: MyText(
                                                        fontSize:
                                                            context.screenSize *
                                                                twoFont,
                                                        fieldName:
                                                            '${document['category_description_two']}',
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: Container(
                                                      decoration:
                                                          const BoxDecoration(
                                                        color: Color.fromARGB(
                                                            77, 196, 194, 194),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  10),
                                                          topRight:
                                                              Radius.circular(
                                                                  10),
                                                        ),
                                                      ),
                                                      child: MyText(
                                                        fontSize:
                                                            context.screenSize *
                                                                twoFont,
                                                        fieldName:
                                                            '${document['category_description_three']}',
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: Container(
                                                      decoration:
                                                          const BoxDecoration(
                                                        color: Color.fromARGB(
                                                            77, 196, 194, 194),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  10),
                                                          topRight:
                                                              Radius.circular(
                                                                  10),
                                                        ),
                                                      ),
                                                      child: MyText(
                                                        fontSize:
                                                            context.screenSize *
                                                                twoFont,
                                                        fieldName:
                                                            '${document['category_description_four']}',
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Spacer(),
                                          ],
                                        ),
                                      ),
                                      Spacer(),
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
