import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({Key? key}) : super(key: key);

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  Map<String, dynamic>? quranData;

  @override
  void initState() {
    super.initState();
    loadQuran();
  }

  Future<void> loadQuran() async {
    final String response = await rootBundle.loadString(
      'assets/JSON/quran_uthmani.json',
    );
    final Map<String, dynamic> data = json.decode(response);
    setState(() {
      quranData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (quranData == null) {
      return const Center(child: CircularProgressIndicator(color: Colors.blue));
    }
    return Scaffold(
      backgroundColor: const Color(0xFF04173A),
      appBar: AppBar(
        title: Text('Quran', style: TextStyle(color: Colors.white)),
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
            itemCount: quranData!.length,
            itemBuilder: (context, index) {
              final surahKey = quranData!.keys.elementAt(index);
              final surah = quranData![surahKey];
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
                    'Surah ${surahKey}: ${surah['name']}',
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    'Ayahs: ${surah['ayahs'].length}',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SurahDetailScreen(
                          surah: surah,
                          surahNumber: surahKey,
                        ),
                      ),
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

class SurahDetailScreen extends StatelessWidget {
  final Map surah;
  final String surahNumber;

  const SurahDetailScreen({
    required this.surah,
    required this.surahNumber,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ayahs = surah['ayahs'] as List;

    return Scaffold(
      backgroundColor: const Color(0xFFFCF7ED),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2C3C97),
        title: Text(
          '${surah['name']} - Surah $surahNumber',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.keyboard_return, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: ListView.builder(
          itemCount: ayahs.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            final ayah = ayahs[index];
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 6),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.6),
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 2,
                    offset: Offset(1, 1),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    ayah['text'],
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      fontSize: 26,
                      fontFamily: 'Amiri',
                      height: 2,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE8E3D8),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        ayah['ayah'].toString(),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
