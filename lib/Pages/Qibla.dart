import 'package:flutter/material.dart';

class Qibla extends StatelessWidget {
  const Qibla({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final scale = screenWidth / 400.0;
    final imageSize = (screenWidth * 0.5).clamp(150.0, 200.0);
    final iconSize = (32 * scale).clamp(24.0, 32.0);
    final titleFontSize = (24 * scale).clamp(18.0, 24.0);
    final buttonFontSize = (18 * scale).clamp(14.0, 18.0);
    final buttonHorizontalPadding = (40 * scale).clamp(30.0, 40.0);
    final buttonVerticalPadding = (16 * scale).clamp(12.0, 16.0);
    final dialogFontSize = (20 * scale).clamp(16.0, 20.0);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image.svg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 16),
              child: Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  child: Icon(Icons.keyboard_return, color: Colors.white, size: iconSize),
                  onTap: () => Navigator.pop(context),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: imageSize,
                      height: imageSize,
                      child: Image.asset('assets/qibla.png'),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Qibla Direction Finder',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 40),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: buttonHorizontalPadding, vertical: buttonVerticalPadding),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: Colors.blue,
                        elevation: 5,
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              backgroundColor: Colors.transparent,
                              child: Text(
                                'Qibla finder not implemented',
                                style: TextStyle(color: Colors.white, fontSize: dialogFontSize),
                              ),
                            );
                          },
                        );
                      },
                      child: Text(
                        'Find Qibla',
                        style: TextStyle(fontSize: buttonFontSize, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
