import 'package:flutter/material.dart';

class SingleQuestionWidget {
  Widget buildCorrectIcon() => const CircleAvatar(
        radius: 15,
        backgroundColor: Colors.white,
        child: Center(
          child: Icon(
            size: 50,
            Icons.check,
            color: Colors.green,
          ),
        ),
      );

  Widget buildWrongIcon() => const CircleAvatar(
        radius: 15,
        backgroundColor: Colors.red,
        child: Center(
          child: Icon(
            size: 50,
            Icons.close,
            color: Colors.white,
          ),
        ),
      );
}
