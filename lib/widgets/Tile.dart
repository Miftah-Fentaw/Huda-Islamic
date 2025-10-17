import 'package:flutter/material.dart';

class Options extends StatelessWidget {
  final String Title;
  const Options({super.key, required this.Title});

  @override
  Widget build(BuildContext context) {
    return Text(
      Title,
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
    );
  }
}
