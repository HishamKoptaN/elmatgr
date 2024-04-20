import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<String> documents = []; // قائمة لتخزين المستندات

  // دالة لجلب المستند وتخزينه في القائمة
  Future<void> fetchDocument() async {
    try {
      // جلب المستند من Firestore
      DocumentSnapshot documentSnapshot = await _firestore
          .collection('your_collection') // اسم المجموعة
          .doc('your_document_id') // معرف المستند المطلوب
          .get();

      // التحقق مما إذا كان المستند موجودًا
      if (documentSnapshot.exists) {
        // تخزين المحتوى في القائمة
        setState(() {
          documents.add(documentSnapshot.data().toString());
        });
      } else {
        print('المستند غير موجود');
      }
    } catch (error) {
      print('حدث خطأ: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('تطبيق جلب المستند'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  fetchDocument(); // جلب المستند عند الضغط على الزر
                },
                child: Text('جلب المستند'),
              ),
              SizedBox(height: 20),
              // عرض المستندات في قائمة
              ListView.builder(
                shrinkWrap: true,
                itemCount: documents.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(documents[index]),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}
