import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;

  //constructor
  const SquareTile({
    super.key,
    required this.imagePath,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey[200],
        ),
        child: Image.asset(
          imagePath,
          height: 40,
        ));
  }
}
