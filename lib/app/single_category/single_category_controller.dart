// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class SingleCategoryController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final List<dynamic> categories = [];

  Future<void> loadSingleCategories(String category) async {
    final querySnapshot = await _firestore.collection(category).get();
    categories.assignAll(querySnapshot.docs);
    update();
  }
}
