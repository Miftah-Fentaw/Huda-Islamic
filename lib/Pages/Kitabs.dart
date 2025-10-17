import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';

class kitabs extends StatefulWidget {
  const kitabs({Key? key}) : super(key: key);

  @override
  State<kitabs> createState() => _kitabsState();
}

class _kitabsState extends State<kitabs> {
final List<String> islamicBooks = [
  "Sahih al-Bukhari - صحيح البخاري",
  "Sahih Muslim - صحيح مسلم",
  "Riyadh as-Salihin - رياض الصالحين",
  "Tafsir Ibn Kathir - تفسير ابن كثير",
  "Al-Adab al-Mufrad - الأدب المفرد",
  "Ihya’ Ulum al-Din - إحياء علوم الدين",
  "Fiqh al-Sunnah - فقه السنة",
];

final List<String> islamicAuthors = [
  "Imam Muhammad al-Bukhari",
  "Imam Muslim ibn al-Hajjaj",
  "Imam Nawawi",
  "Ibn Kathir",
  "Imam Muhammad al-Bukhari",
  "Imam Al-Ghazali",
  "Sayyid Sabiq",
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF04173A),
      appBar: AppBar(
        title: Text('Kitabs', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          child: Icon(Icons.keyboard_return, color: Colors.white, size: 20),
          onTap: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/image.svg', fit: BoxFit.cover),
          ),
          ListView.builder(
            itemCount: islamicBooks.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                width: 200,
                height: 80,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFF2C3C97).withOpacity(0.2),
                      const Color(0xFF090B1D).withOpacity(0.1),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: Icon(
                    FlutterIslamicIcons.quran2,
                    color: Colors.white,
                  ),
                  title: Text(
                    "${islamicBooks[index]}",
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    "${islamicAuthors[index]}",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          backgroundColor: Colors.transparent,
                          child: Text(
                            'kitabs will be implemented soon ',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        );
                      },
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
