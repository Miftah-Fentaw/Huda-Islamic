import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';

class IconsContainer extends StatelessWidget {
  const IconsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final List<IconData> IslamicIcons = [
      FlutterIslamicIcons.tasbihHand,
      FlutterIslamicIcons.qibla,
      FlutterIslamicIcons.quran,
      FlutterIslamicIcons.prayer,
      FlutterIslamicIcons.mosque,
      FlutterIslamicIcons.muslim,
    ];
    return Container(
      padding: const EdgeInsets.only(bottom: 32, left: 16, right: 16),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: IslamicIcons.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(16),
            ),
            child: GestureDetector(
              child: Icon(IslamicIcons[index], color: Colors.white, size: 40),
              onTap: () {
                
              },
            ),
          );
        },
      ),
    );
  }
}
