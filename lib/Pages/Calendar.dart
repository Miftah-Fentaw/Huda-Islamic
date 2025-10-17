import 'package:flutter/material.dart';
import 'package:jhijri_picker/jhijri_picker.dart';

class Calendar extends StatelessWidget {
  const Calendar({super.key});

  Widget _JHijriAsWidget(BuildContext context) {
    return JGlobalDatePicker(
      widgetType: WidgetType.JContainer,
      pickerType: PickerType.JHijri,
      buttons: const SizedBox(),
      primaryColor: Colors.blueAccent,
      calendarTextColor: Colors.white,
      backgroundColor: Colors.transparent,
      borderRadius: const Radius.circular(12),
      headerTitle: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.25),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Text(
            "Hijri Calendar",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      startDate: JDateModel(dateTime: DateTime.parse("1984-12-24")),
      selectedDate: JDateModel(dateTime: DateTime.now()),
      endDate: JDateModel(dateTime: DateTime.parse("2030-09-20")),
      pickerMode: DatePickerMode.day,
      pickerTheme: Theme.of(context),
      textDirection: TextDirection.ltr,
      onChange: (val) {
        debugPrint(val.toString());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

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
            child: Container(
              color: Colors.black.withOpacity(0.3),
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                          child: const Icon(
                            Icons.keyboard_return,
                            color: Colors.white,
                            size: 28,

                        ),
                      ),
                      const SizedBox(width: 16),
                      const Text(
                        'Hijri Calendar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                Expanded(
                  child: Center(
                    child: Container(
                      height: h * 0.7,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.25),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            blurRadius: 12,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: _JHijriAsWidget(context),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    "Use this calendar to track Hijri dates easily",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: w * 0.04,
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
