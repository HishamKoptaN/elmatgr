import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class MyFavoritesController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');
  List favoritesList = [];
  bool isLoading = false;
  bool isFavorite = false;

  Future<void> getFavoritesList(String productId) async {
    try {
      QuerySnapshot querySnapshot = await usersCollection
          .doc('admin@gmail.com')
          .collection('my_favorites')
          .get();
      List fetchedTexts = querySnapshot.docs.map((doc) => doc.id).toList();
      favoritesList = fetchedTexts as List<String>;
      if (kDebugMode) {
        print(favoritesList);
      }
      if (favoritesList.contains(productId)) {
        isFavorite = true;
      } else {
        isFavorite = false;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> addToFavsProductList(String prdouctId) async {
    if (isFavorite == true) {
      try {
        await FirebaseFirestore.instance
            .collection('users')
            .doc('admin@gmail.com')
            .collection('my_favorites')
            .doc(prdouctId)
            .delete();
        if (kDebugMode) {
          print("deleted");
        }
        update();
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    } else if (isFavorite == false) {
      try {
        DocumentSnapshot documentSnapshot =
            await firestore.collection('products').doc(prdouctId).get();

        Map<String, dynamic> documentData =
            documentSnapshot.data() as Map<String, dynamic>;

        await firestore
            .collection('users')
            .doc('admin@gmail.com')
            .collection('my_favorites')
            .doc(prdouctId)
            .set(
          {
            'category_name': documentData['category_name'],
            'product_description': documentData['product_description'],
            'product_id': documentData['product_id'],
            'product_image': documentData['product_image'],
            'product_name': documentData['product_name'],
            'product_price': documentData['product_price'],
          },
        );
        if (kDebugMode) {
          print("added");
        }
        update();
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    }
  }
}
