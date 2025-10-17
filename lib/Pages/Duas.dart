import 'package:flutter/material.dart';
import 'package:huda/Pages/dua_detail.dart';
import 'package:huda/models/dua.dart';

class Duas extends StatefulWidget {
  const Duas({super.key});

  @override
  State<Duas> createState() => _DuasState();
}

class _DuasState extends State<Duas> {
  List<String> Duas = [
    'Morning Dua',
    'Evening Dua',
    'Dua before Sleep',
    'Dua after Prayer',
    'Dua for Forgiveness',
    'Dua for Guidance',
    'Dua for Health',
    'Dua for Parents',
    'Dua for Children',
    'Dua for Success',
    'Dua for Protection',
    'Dua for Knowledge',
    'Dua for Peace',
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final scale = screenWidth / 400.0;
    final iconSize = (32 * scale).clamp(24.0, 32.0);
    final titleFontSize = (16 * scale).clamp(14.0, 20.0);

    return Scaffold(
      backgroundColor: const Color(0xFF04173A),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/image.svg', fit: BoxFit.cover),
          ),

          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.3)),
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

                const SizedBox(height: 12),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: GridView.builder(
                      itemCount: Duas.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        childAspectRatio: 1.2,
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            if (index < 4) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DuaDetailScreen(dua: duasList[index]),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Dua details not available yet',
                                  ),
                                ),
                              );
                            }
                          },

                          child: Container(
                            padding: const EdgeInsets.all(12),
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
                            child: Center(
                              child: Text(
                                Duas[index],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: titleFontSize,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
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
