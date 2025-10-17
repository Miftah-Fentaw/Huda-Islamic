import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Help extends StatelessWidget {
  const Help({super.key});

  Future<void> _launchTelegram(BuildContext context) async {
    const url = 'https://t.me/Miftah_Fentaw';
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not open Telegram')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final w = media.size.width;
    final h = media.size.height;

    final horizontalPadding = w * 0.06;
    final headingSize = (w * 0.07).clamp(18.0, 34.0);
    final bodySize = (w * 0.045).clamp(12.0, 18.0);
    final iconSize = (w * 0.06).clamp(20.0, 32.0);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/image.svg',
              fit: BoxFit.cover,
            ),
          ),

          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.35),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.of(context).maybePop(),
                          child: Icon(
                            Icons.keyboard_return,
                            color: Colors.white,
                            size: iconSize,

                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Need Help?',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: headingSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 18),

                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(minHeight: h * 0.6),
                        child: IntrinsicHeight(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Quick Tips for Using Huda App:',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: bodySize + 1,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 12),

                              _bulletItem(
                                  'Tap on any feature icon to open it.', bodySize),
                              _bulletItem(
                                  'Quran pages may take a second to load.', bodySize),
                              _bulletItem(
                                  'Enable device location for Qibla to work properly.',
                                  bodySize),
                              _bulletItem(
                                  'Tap anywhere to count for Tasbih; reset easily when needed.',
                                  bodySize),

                              const SizedBox(height: 18),
                              Divider(color: Colors.white24, height: 1),

                              const SizedBox(height: 18),
                              Text(
                                'Frequently Asked Questions:',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: bodySize + 1,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 12),
                              _faqItem(
                                  'Why is the quran not as same as the real one?',
                                  'we are working on it it will be solved soon',
                                  bodySize),
                                   _faqItem(
                                  'will you include other languages too',
                                  'wait for the upcoming release with more than 5 languages implemented',
                                  bodySize),
                              _faqItem(
                                  'How do I report a bug or request a feature?',
                                  'Use the Telegram button below to send a short description, screenshots optional.',
                                  bodySize),

                              const SizedBox(height: 18),
                              Divider(color: Colors.white24, height: 1),

                              const SizedBox(height: 18),
                              Text(
                                'Contact Developer:',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: bodySize + 1,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 12),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white.withOpacity(0.14),
                                    padding:
                                        EdgeInsets.symmetric(vertical: h * 0.02),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  onPressed: () => _launchTelegram(context),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.telegram,
                                          color: Colors.white, size: iconSize),
                                      const SizedBox(width: 10),
                                      Text(
                                        'Message on Telegram',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: bodySize,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              const SizedBox(height: 20),
                              Divider(color: Colors.white24, height: 1),

                              const SizedBox(height: 18),
                              Text(
                                'Remember:',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: bodySize + 1,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                '"And those who strive for Our cause – We will surely guide them to Our ways." (Surah Al-‘Ankabut 29:69)',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: bodySize,
                                  height: 1.4,
                                ),
                              ),

                              const Spacer(),

                              Padding(
                                padding: EdgeInsets.only(bottom: h * 0.02),
                                child: Text(
                                  '©️ 2025 Huda Official',
                                  style: TextStyle(
                                      color: Colors.white38,
                                      fontSize: bodySize - 2),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bulletItem(String text, double fontSize) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(color: Colors.white70)),
          Expanded(
            child: Text(
              text,
              style: TextStyle(color: Colors.white70, fontSize: fontSize),
            ),
          ),
        ],
      ),
    );
  }

  Widget _faqItem(String question, String answer, double fontSize) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(question,
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w600, fontSize: fontSize)),
          const SizedBox(height: 6),
          Text(answer, style: TextStyle(color: Colors.white70, fontSize: fontSize)),
        ],
      ),
    );
  }
}
