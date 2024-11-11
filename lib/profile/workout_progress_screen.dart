import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../common/color_extension.dart';

class WorkoutProgressScreen extends StatelessWidget {
  const WorkoutProgressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    Color textColor = isDarkMode ? Colors.white : TColo.black;
    Color iconColor = isDarkMode ? Colors.white : Colors.black;
    Color iconBorderColor = isDarkMode ? Colors.blue : TColo.lightGrey;
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : TColo.white,
      appBar: AppBar(
        backgroundColor: isDarkMode ? Colors.black : TColo.white,
        title: Text(
          "Workout Progress",
          style: GoogleFonts.poppins(
            color: textColor,
            fontSize: 16,
            fontWeight: FontWeight.w700,
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
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Your Workout Progress",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.fitness_center, color: iconColor),
                    title: Text(
                      "Exercise ${index + 1}",
                      style: GoogleFonts.poppins(
                        color: textColor,
                        fontSize: 14,
                      ),
                    ),
                    subtitle: Text(
                      "Completed 5 sets • 10 reps each",
                      style: GoogleFonts.poppins(
                        color: textColor,
                        fontSize: 12,
                      ),
                    ),
                    trailing: Text(
                      "Duration: 30 mins",
                      style: GoogleFonts.poppins(
                        color: textColor,
                        fontSize: 12,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}