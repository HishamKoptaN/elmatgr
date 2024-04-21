import 'package:flutter/material.dart';

void main() {
  runApp(MyAppTest());
}

class MyAppTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.amber,
        appBar: AppBar(
          title: const Text('Display PNG Image Example'),
        ),
        body: GestureDetector(
          child: Stack(
            children: [
              Column(
                children: [
                  Positioned(
                    child: Image.asset(
                      'assets/home_pic.png',
                      width: 200,
                      height: 150,
                    ),
                  ),
                  Positioned(
                    child: Image.asset(
                      'assets/shirt3.png',
                      width: 200,
                      height: 150,
                    ),
                  ),
                  Positioned(
                    child: Image.asset(
                      'assets/black_car_new.png',
                      width: 200,
                      height: 150,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
