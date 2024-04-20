import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';

import '../../utils/colors.dart';
import '../custom_snackbar.dart';

class AddOrderController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  int countOfProduct = 1;
  String currentLevelID = "1";
  CollectionReference questionss =
      FirebaseFirestore.instance.collection('products');
  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');
  List favoritesList = [];
  bool isLoading = false;
  bool isFavourite = false;
  void increament() {
    countOfProduct++;
    update();
  }

  void decreament() {
    if (countOfProduct > 1) {
      countOfProduct--;
    }

    update();
  }

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
        isFavourite = true;
      } else {
        isFavourite = false;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> addOrder(String prdouctId) async {
    try {
      DocumentSnapshot documentSnapshot =
          await firestore.collection('products').doc(prdouctId).get();

      if (documentSnapshot.exists) {
        Map<String, dynamic> documentData =
            documentSnapshot.data() as Map<String, dynamic>;

        await firestore
            .collection('users')
            .doc('admin@gmail.com')
            .collection('my_orders')
            .add(
          {
            'category_name': documentData['category_name'],
            'product_description': documentData['product_description'],
            'product_id': documentData['product_id'],
            'product_image': documentData['product_image'],
            'product_name': documentData['product_name'],
            'product_price': documentData['product_price'],
            'product_count': countOfProduct,
            'order_status': 'جاري التوصيل',
          },
        );

        CustomSnackBar.showCustomSnackBar(
          title: 'تمت الاضافة',
          message: 'تم اضافة طلبك بنجاح ',
        );
      }
    } catch (error) {
      if (kDebugMode) {
        print('حدث خطأ: $error');
      }
    }
  }

  void confirmOrCancel(String prdouctId) {
    Dialogs.materialDialog(
      context: Get.context!,
      titleStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      msgStyle: const TextStyle(
        fontSize: 17,
      ),
      actions: [
        IconsOutlineButton(
          onPressed: () async => Get.back(),
          text: 'الغاء ',
          iconData: Icons.done_sharp,
          textStyle: const TextStyle(color: Colors.black),
          iconColor: Colors.red[200],
        ),
        IconsOutlineButton(
          onPressed: () async {
            Get.back();
            await addOrder(prdouctId);
          },
          text: 'تأكيد الطلب ؟',
          iconData: Icons.cancel_rounded,
          textStyle: const TextStyle(color: Colors.black),
          color: AppColors.whiteColor,
          iconColor: Colors.green,
        ),
      ],
    );
  }
}
