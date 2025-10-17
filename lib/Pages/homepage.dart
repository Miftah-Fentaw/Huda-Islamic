import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:huda/Pages/Calendar.dart';
import 'package:huda/Pages/Duas.dart';
import 'package:huda/Pages/Help.dart';
import 'package:huda/Pages/Kitabs.dart';
import 'package:huda/Pages/Mosques.dart';
import 'package:huda/Pages/NamesofAllah.dart';
import 'package:huda/Pages/Prayers.dart';
import 'package:huda/Pages/Qibla.dart';
import 'package:huda/Pages/Quran.dart';
import 'package:huda/Pages/Tasbih.dart';
import 'package:huda/widgets/Tile.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget _buildTipCard(String text) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(text, fit: BoxFit.cover),
    );
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    final screenSize = MediaQuery.of(context).size;
    final double iconSize = screenSize.width * 0.1;

    List<String> title = [
      'Prayers',
      'Quran',
      'Mosques',
      'Duas',
      'Kitabs',
      'Tasbih',
      'Qibla',
      'Calendar',
      'Help',
    ];

    final List<Widget> screens = [
      Prayers(),
      QuranScreen(),
      Mosques(),
      Duas(),
      kitabs(),
      Tasbih(),
      Qibla(),
      Calendar(),
      Help(),
    ];

    const List<IconData> IslamicIcons = [
      FlutterIslamicIcons.sajadah,
      FlutterIslamicIcons.quran,
      FlutterIslamicIcons.mosque,
      FlutterIslamicIcons.prayer,
      Icons.menu_book_sharp,
      FlutterIslamicIcons.tasbihHand,
      FlutterIslamicIcons.qibla,
      FlutterIslamicIcons.calendar,
      Icons.help,
    ];

    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        width: screenSize.width * 0.75,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset('assets/image.svg', fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(
                        Icons.telegram,
                        color: Colors.white,
                        size: 20,
                      ),
                      title: Options(Title: 'Contact Developer'),
                      onTap: () async {
                        const url = 'https://t.me/Miftah_Fentaw';
                        final uri = Uri.parse(url);
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(
                            uri,
                            mode: LaunchMode.externalApplication,
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Could not launch Telegram'),
                            ),
                          );
                        }
                      },
                    ),

                    const Divider(),
                    ListTile(
                      leading: const Icon(
                        Icons.star_rate_sharp,
                        color: Colors.white,
                        size: 20,
                      ),
                      title: Options(Title: 'Rate Us'),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('About Huda App'),
                            content: const Text('Not deployed yet !!!'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Close'),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(
                        Icons.info_outline,
                        color: Colors.white,
                        size: 20,
                      ),
                      title: Options(Title: 'Info'),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('About Huda App'),
                            content: const Text(
                              'Huda App 2025\nAll rights reserved\nVersion 1.0\nThis app provides prayers, Quran reading, duaas, tasbih, qibla direction, and more.',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Close'),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(
                        Icons.all_inclusive,
                        color: Colors.white,
                        size: 20,
                      ),
                      title: Options(Title: '99 Names of Allah'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NamesOfallah(),
                          ),
                        );
                      },
                    ),
                    const Divider(),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 40,
              left: 20,
              child: const Text(
                '©️ 2025 Huda Official All Rights Reserved',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/image.svg', fit: BoxFit.cover),
          ),
          Positioned(
            top: 30,
            left: 16,
            child: GestureDetector(
              child: Icon(Icons.menu, color: Colors.white, size: iconSize),
              onTap: () => _scaffoldKey.currentState?.openDrawer(),
            ),
          ),
          Positioned(
            top: screenSize.height * 0.1,
            left: 20,
            right: 20,
            child: Column(
              children: [
                Text(
                  'Huda of Allah',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: screenSize.width * 0.09,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "And those who strive for Our cause – We will surely guide them to Our ways."
                  "\n— Surah Al-‘Ankabut (29:69)",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[300],
                    fontSize: screenSize.width * 0.04,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: screenSize.height * 0.28,
            left: 16,
            right: 16,
            child: SizedBox(
              height: screenSize.height * 0.2,
              child: PageView(
                physics: const BouncingScrollPhysics(),
                children: [
                  _buildTipCard("assets/pageview1.svg"),
                  _buildTipCard("assets/pageview2.svg"),
                  _buildTipCard("assets/pageview3.svg"),
                  _buildTipCard("assets/pageview4.svg"),
                  _buildTipCard("assets/pageview8.svg"),
                  _buildTipCard("assets/pageview5.svg"),
                  _buildTipCard("assets/pageview6.svg"),
                  _buildTipCard("assets/pageview7.svg"),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 16,
            right: 16,
            child: GridView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: IslamicIcons.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          IslamicIcons[index],
                          color: Colors.white,
                          size: screenSize.width * 0.12,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          title[index],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenSize.width * 0.035,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => screens[index]),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
