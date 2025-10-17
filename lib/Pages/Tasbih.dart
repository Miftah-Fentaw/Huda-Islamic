import 'dart:math';
import 'package:flutter/material.dart';

class TasbihRing extends StatefulWidget {
  final int beadCount;
  final double size;
  final double beadRadius;
  final Color baseColor;
  final Color filledColor;
  final Color strokeColor;
  final double strokeWidth;
  final ValueChanged<int>? onChanged;

  const TasbihRing({
    Key? key,
    this.beadCount = 33,
    this.size = 300,
    this.beadRadius = 10,
    this.baseColor = const Color.fromARGB(255, 159, 155, 155),
    this.filledColor = const Color.fromARGB(255, 20, 58, 130),
    this.strokeColor = Colors.black26,
    this.strokeWidth = 1.0,
    this.onChanged,
  }) : super(key: key);

  @override
  _TasbihRingState createState() => _TasbihRingState();
}

class _TasbihRingState extends State<TasbihRing> {
  int _current = -1;

  void _advance() {
    setState(() {
      _current = (_current + 1) % widget.beadCount;
    });
    widget.onChanged?.call(_current);
  }

  void reset() {
    setState(() {
      _current = -1;
    });
    widget.onChanged?.call(_current);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _advance,
        onPanEnd: (_) => _advance(),
        onLongPress: _advance,
        child: CustomPaint(
          painter: _TasbihPainter(
            beadCount: widget.beadCount,
            beadRadius: widget.beadRadius,
            currentIndex: _current,
            baseColor: widget.baseColor,
            filledColor: widget.filledColor,
            strokeColor: widget.strokeColor,
            strokeWidth: widget.strokeWidth,
          ),
        ),
      ),
    );
  }
}

class _TasbihPainter extends CustomPainter {
  final int beadCount;
  final double beadRadius;
  final int currentIndex;
  final Color baseColor;
  final Color filledColor;
  final Color strokeColor;
  final double strokeWidth;

  _TasbihPainter({
    required this.beadCount,
    required this.beadRadius,
    required this.currentIndex,
    required this.baseColor,
    required this.filledColor,
    required this.strokeColor,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final ringRadius = min(size.width, size.height) / 2 - beadRadius - 4.0;

    final paintFill = Paint()..style = PaintingStyle.fill;
    final paintStroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    for (int i = 0; i < beadCount; i++) {
      final angle = (2 * pi * i / beadCount) - pi / 2;
      final beadCenter = Offset(
        center.dx + ringRadius * cos(angle),
        center.dy + ringRadius * sin(angle),
      );

      paintFill.color = (currentIndex >= 0 && i <= currentIndex) ? filledColor : baseColor;
      paintStroke.color = strokeColor;

      canvas.drawCircle(beadCenter, beadRadius, paintFill);
      if (strokeWidth > 0) {
        canvas.drawCircle(beadCenter, beadRadius, paintStroke);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _TasbihPainter old) {
    return old.currentIndex != currentIndex ||
        old.baseColor != baseColor ||
        old.filledColor != filledColor ||
        old.beadCount != beadCount ||
        old.beadRadius != beadRadius;
  }
}

class Tasbih extends StatefulWidget {
  const Tasbih({super.key});

  @override
  State<Tasbih> createState() => _TasbihState();
}

class _TasbihState extends State<Tasbih> {
  int currentCount = -1;
  final GlobalKey<_TasbihRingState> _ringKey = GlobalKey<_TasbihRingState>();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final ringSize = min(screenSize.width * 0.8, screenSize.height * 0.5);
    final beadRadius = ringSize * 0.0375;
    final fontSize = screenSize.width * 0.0675;
    final iconSize = screenSize.width * 0.08;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/image.svg',
              fit: BoxFit.cover,
            ),
          ),

          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.35)),
          ),

          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),

                        child: Icon(Icons.keyboard_return, color: Colors.white, size: iconSize),
                      ),

                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  "${currentCount + 1}",
                  style: TextStyle(
                    fontSize: fontSize,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: const [
                      Shadow(color: Colors.black54, blurRadius: 4, offset: Offset(1, 1)),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                Expanded(
                  child: Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        TasbihRing(
                          key: _ringKey,
                          beadCount: 33,
                          size: ringSize,
                          beadRadius: beadRadius,
                          baseColor: const Color.fromARGB(255, 189, 189, 189),
                          filledColor: const Color(0xFF1A8D98),
                          strokeColor: Colors.black26,
                          onChanged: (val) {
                            setState(() => currentCount = val);
                          },
                        ),
                        Image.asset(
                          'assets/musebih.png',
                          fit: BoxFit.cover,
                          scale: 5,
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: ElevatedButton(
                    onPressed: () {
                      _ringKey.currentState?.reset();
                      setState(() => currentCount = -1);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1A8D98),
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                      elevation: 4,
                    ),
                    child: const Text(
                      "Reset",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
