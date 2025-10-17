import 'package:flutter/material.dart';
import 'package:huda/models/dua.dart';

class DuaDetailScreen extends StatelessWidget {
  final Dua dua;

  const DuaDetailScreen({Key? key, required this.dua}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        leading: GestureDetector(
          child: Icon(Icons.keyboard_return, color: Colors.white),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: Text(dua.title),
        backgroundColor: const Color(0xFF04173A),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image.svg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              dua.arabic,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              dua.english,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18, color: Colors.white60),
            ),
          ],
        ),
      ),
    );
  }
}
