import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class MyDrawerController extends GetxController {
  var name = '';

  Future<void> getCurrentUserName() async {
    final currentUser = FirebaseAuth.instance.currentUser;

    DocumentSnapshot<Map<String, dynamic>> userSnapshot =
        await FirebaseFirestore.instance
            .collection('users')
            .doc(currentUser!.email)
            .get();
    name = userSnapshot.data()?['name'];
  }

  void goToInterest() {}

  void goToCustomerAnalysis() {}

  void goToPaylate() {}

  void goToAnalyzeIndividual() {}
}
