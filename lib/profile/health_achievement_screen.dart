import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../common/color_extension.dart';

class HealthAchievementsScreen extends StatelessWidget {
  const HealthAchievementsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final achievements = [
      "10,000 Steps a Day",
      "5 Workouts This Week",
      "Balanced Diet for 7 Days",
      "8 Hours of Sleep Every Night",
      "Hydrated Daily for 2 Weeks",
    ];
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    Color iconBorderColor = isDarkMode ? Colors.blue : TColo.lightGrey;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Health Achievements",
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            height: 40,
            width: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: iconBorderColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              "assets/img/black_btn.png",
              width: 15,
              height: 15,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: achievements.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: Icon(Icons.star, color: Colors.orangeAccent),
              title: Text(
                achievements[index],
                style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ),
          );
        },
      ),
    );
  }
}