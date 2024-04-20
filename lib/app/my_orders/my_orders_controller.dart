// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class MyOrdersController extends GetxController {
  List favorits = [];
  bool isLoading = false;
  bool isFavourite = false;

  Future<void> addToFavsProductList(String prdouctId) async {
    try {
      await FirebaseFirestore.instance
          .collection('products')
          .doc(prdouctId)
          .update(
        {
          'fav': FieldValue.arrayUnion(
            ['admin@gmail.com'],
          )
        },
      );
      addProductToFavs(prdouctId);
      if (kDebugMode) {
        print("added");
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    await FirebaseFirestore.instance
        .collection('products')
        .doc(prdouctId)
        .update(
      {
        'fav': FieldValue.arrayUnion(
          ['admin@gmail.com'],
        )
      },
    );
  }

  Future<void> addProductToFavs(String prdouctId) async {
    try {
      await FirebaseFirestore.instance
          .collection('products')
          .doc(prdouctId)
          .update(
        {
          'fav': FieldValue.arrayUnion(
            [prdouctId],
          )
        },
      );
      if (kDebugMode) {
        print("added");
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    await FirebaseFirestore.instance
        .collection('users')
        .doc('admin@gmail.com')
        .update(
      {
        'favorites': FieldValue.arrayUnion(
          [prdouctId],
        )
      },
    );
  }

  Future<void> removeProductFromFavList(String prdouctId) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc('admin@gmail.com')
          .update(
        {
          'favorites': FieldValue.arrayRemove(
            [prdouctId],
          )
        },
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
