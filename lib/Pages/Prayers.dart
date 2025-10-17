

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:audioplayers/audioplayers.dart';

class Prayers extends StatefulWidget {
  const Prayers({super.key});

  @override
  State<Prayers> createState() => _PrayersState();
}

class _PrayersState extends State<Prayers> {
  List<bool> isMutedList = [false, false, false, false, false];
  final AudioPlayer player = AudioPlayer();
  Timer? timer;

  final List<String> azanFiles = [
    'assets/Azan/fajr.mp3',
    'assets/Azan/azan.mp3',
    'assets/Azan/azan.mp3',
    'assets/Azan/azan.mp3',
    'assets/Azan/azan.mp3',
  ];

  final List<String> times = ['06:35', '11:00', '15:30', '18:45', '10:28'];
  final List<String> salats = ['Fajr', 'Zhur', 'Asr', 'Meghrib', 'Isha'];

  @override
  void initState() {
    super.initState();
    startPrayerScheduler();
  }

  @override
  void dispose() {
    timer?.cancel();
    player.dispose();
    super.dispose();
  }

  void toggleSpeaker(int index) {
    setState(() {
      isMutedList[index] = !isMutedList[index];
    });

    if (!isMutedList[index]) {
      player.play(AssetSource(azanFiles[index]));
    } else {
      player.stop();
    }
  }

  void startPrayerScheduler() {
    timer = Timer.periodic(const Duration(seconds: 30), (_) {
      final now = TimeOfDay.now();

      for (int i = 0; i < times.length; i++) {
        final parts = times[i].split(':');
        final hour = int.parse(parts[0]);
        final minute = int.parse(parts[1]);

        if (now.hour == hour && now.minute == minute) {
          if (!isMutedList[i]) {
            player.play(AssetSource(azanFiles[i]));
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

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
                  child: const Icon(Icons.keyboard_return, color: Colors.white, size: 32),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      'assets/JSON/Prayer.json',
                      width: screenWidth * 0.5,
                      height: screenWidth * 0.5,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: screenHeight * 0.05),
                    Container(
                      width: screenWidth * 0.9,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              'Prayer Times',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          ...List.generate(salats.length, (index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    salats[index],
                                    style: const TextStyle(color: Colors.white, fontSize: 16),
                                  ),
                                  Text(
                                    times[index],
                                    style: const TextStyle(color: Colors.white, fontSize: 16),
                                  ),
                                  IconButton(
                                    onPressed: () => toggleSpeaker(index),
                                    icon: Icon(
                                      isMutedList[index] ? Icons.volume_off : Icons.volume_up,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                        ],
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














