import 'package:flutter/material.dart';

class NamesOfallah extends StatelessWidget {
  const NamesOfallah({super.key});

  final List<String> names = const [
    'Ar-Rahman',
    'Ar-Rahim',
    'Al-Malik',
    'Al-Quddus',
    'As-Salam',
    'Al-Mu’min',
    'Al-Muhaymin',
    'Al-Aziz',
    'Al-Jabbar',
    'Al-Mutakabbir',
    'Al-Khaliq',
    'Al-Bari',
    'Al-Musawwir',
    'Al-Ghaffar',
    'Al-Qahhar',
    'Al-Wahhab',
    'Ar-Razzaq',
    'Al-Fattah',
    'Al-‘Alim',
    'Al-Qabid',
    'Al-Basit',
    'Al-Khafid',
    'Ar-Rafi',
    'Al-Mu’izz',
    'Al-Mudhill',
    'As-Sami',
    'Al-Basir',
    'Al-Hakam',
    'Al-‘Adl',
    'Al-Latif',
    'Al-Khabir',
    'Al-Halim',
    'Al-Azim',
    'Al-Ghafur',
    'Ash-Shakur',
    'Al-Ali',
    'Al-Kabir',
    'Al-Hafiz',
    'Al-Muqit',
    'Al-Hasib',
    'Al-Jalil',
    'Al-Karim',
    'Ar-Raqib',
    'Al-Mujib',
    'Al-Wasi',
    'Al-Hakim',
    'Al-Wadud',
    'Al-Majid',
    'Al-Ba’ith',
    'Ash-Shahid',
    'Al-Haqq',
    'Al-Wakil',
    'Al-Qawiyy',
    'Al-Matin',
    'Al-Wali',
    'Al-Hamid',
    'Al-Muhsi',
    'Al-Mubdi',
    'Al-Mu’id',
    'Al-Muhyi',
    'Al-Mumit',
    'Al-Hayy',
    'Al-Qayyum',
    'Al-Wajid',
    'Al-Majid',
    'Al-Wahid',
    'Al-Ahad',
    'As-Samad',
    'Al-Qadir',
    'Al-Muqtadir',
    'Al-Muqaddim',
    'Al-Mu’akhkhir',
    'Al-Awwal',
    'Al-Akhir',
    'Az-Zahir',
    'Al-Batin',
    'Al-Wali',
    'Al-Muta’ali',
    'Al-Barr',
    'At-Tawwab',
    'Al-Muntaqim',
    'Al-‘Afuww',
    'Ar-Ra’uf',
    'Malik-ul-Mulk',
    'Dhul-Jalali wal-Ikram',
    'Al-Muqsit',
    'Al-Jami',
    'Al-Ghani',
    'Al-Mughni',
    'Al-Mani’',
    'Ad-Darr',
    'An-Nafi',
    'An-Nur',
    'Al-Hadi',
    'Al-Badi',
    'Al-Baqi',
    'Al-Warith',
    'Ar-Rashid',
    'As-Sabur',
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final iconSize = screenSize.width * 0.08;
    final textSize = screenSize.width * 0.04;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/image.svg', fit: BoxFit.cover),
          ),

          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.35)),
          ),

          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.keyboard_return,
                        color: Colors.white,
                        size: iconSize,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  "99 Names of Allah",
                  style: TextStyle(
                    fontSize: screenSize.width * 0.06,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: const [
                      Shadow(
                        color: Colors.black54,
                        blurRadius: 4,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: GridView.builder(
                      itemCount: names.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 2.5,
                      ),
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 4,
                                offset: Offset(2, 2),
                              ),
                            ],
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            names[index],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: textSize,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 12),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
