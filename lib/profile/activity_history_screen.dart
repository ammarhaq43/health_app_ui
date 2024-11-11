import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../common/color_extension.dart';

class ActivityHistoryScreen extends StatelessWidget {
  const ActivityHistoryScreen({super.key});

  final List<Map<String, String>> activityHistory = const [
    {
      "activity": "Running",
      "date": "2024-11-01",
      "duration": "30 min",
    },
    {
      "activity": "Cycling",
      "date": "2024-10-29",
      "duration": "45 min",
    },
    {
      "activity": "Yoga",
      "date": "2024-10-25",
      "duration": "60 min",
    },
    {
      "activity": "Swimming",
      "date": "2024-10-20",
      "duration": "40 min",
    },
    {
      "activity": "Strength Training",
      "date": "2024-10-18",
      "duration": "50 min",
    },
    {
      "activity": "Hiking",
      "date": "2024-10-15",
      "duration": "90 min",
    },
    {
      "activity": "Rowing",
      "date": "2024-10-12",
      "duration": "35 min",
    },
    {
      "activity": "Boxing",
      "date": "2024-10-08",
      "duration": "45 min",
    },
    {
      "activity": "Dancing",
      "date": "2024-10-06",
      "duration": "30 min",
    },
    {
      "activity": "Elliptical",
      "date": "2024-10-04",
      "duration": "40 min",
    },
    {
      "activity": "Zumba",
      "date": "2024-10-02",
      "duration": "50 min",
    },
    {
      "activity": "Tennis",
      "date": "2024-09-30",
      "duration": "60 min",
    },
    {
      "activity": "Basketball",
      "date": "2024-09-28",
      "duration": "75 min",
    },
    {
      "activity": "CrossFit",
      "date": "2024-09-26",
      "duration": "50 min",
    },
  ];

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    Color textColor = isDarkMode ? Colors.white : TColo.black;
    Color iconColor = isDarkMode ? Colors.blueAccent : Colors.blueAccent;
    Color iconBorderColor = isDarkMode ? Colors.blue : TColo.lightGrey;
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : TColo.white,
      appBar: AppBar(
        backgroundColor: isDarkMode ? Colors.black : TColo.white,
        title: Text(
          "Activity History",
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
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: activityHistory.length,
          itemBuilder: (context, index) {
            var activity = activityHistory[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                leading: Icon(
                  Icons.fitness_center,
                  color: iconColor,
                ),
                title: Text(
                  activity["activity"]!,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: textColor,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Date: ${activity["date"]!}",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: textColor,
                      ),
                    ),
                    Text(
                      "Duration: ${activity["duration"]!}",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: textColor,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}