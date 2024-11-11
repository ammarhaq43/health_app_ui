import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../common/color_extension.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    Color iconBorderColor = isDarkMode ? Colors.blue : TColo.lightGrey;
    return Scaffold(
      appBar: AppBar(
        title: Text("Help & Support", style: GoogleFonts.poppins()
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Frequently Asked Questions",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.question_answer),
              title: Text("How to use the app?", style: GoogleFonts.poppins()),
              onTap: () {showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("How to use the app?", style: GoogleFonts.poppins()),
                    content: Text(
                      "This app provides various features to help manage your health. Navigate through the dashboard to access all features.",
                      style: GoogleFonts.poppins(),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("Close", style: GoogleFonts.poppins()),
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.question_answer),
              title: Text("How do I track my daily health metrics?", style: GoogleFonts.poppins()),
              onTap: () {
                // Display answer or navigate to detailed FAQ screen
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("How to track daily health metrics?", style: GoogleFonts.poppins()),
                    content: Text(
                      "Navigate to the 'Dashboard' section to view and track your daily health metrics like steps, heart rate, and calories burned.",
                      style: GoogleFonts.poppins(),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("Close", style: GoogleFonts.poppins()),
                      ),
                    ],
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.question_answer),
              title: Text("How to update my profile?", style: GoogleFonts.poppins()),
              onTap: () {
                // Display answer
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("How to update my profile?", style: GoogleFonts.poppins()),
                    content: Text(
                      "Go to the Settings page and select 'Edit Profile' to update your details.",
                      style: GoogleFonts.poppins(),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("Close", style: GoogleFonts.poppins()),
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            Text(
              "Need More Help?",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.email),
              title: Text("Contact Us", style: GoogleFonts.poppins()),
              subtitle: Text("support@example.com", style: GoogleFonts.poppins()),
              onTap: () {
                // Launch email app
                _launchURL('mailto:support@example.com');
              },
            ),
            ListTile(
              leading: Icon(Icons.link),
              title: Text("Visit Our Website", style: GoogleFonts.poppins()),
              subtitle: Text("www.example.com", style: GoogleFonts.poppins()),
              onTap: () {
                // Launch website
                _launchURL('https://www.example.com');
              },
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text("Call Us", style: GoogleFonts.poppins()),
              subtitle: Text("+1 123 456 7890", style: GoogleFonts.poppins()),
              onTap: () {
                // Launch phone dialer
                _launchURL('tel:+11234567890');
              },
            ),
          ],
        ),
      ),
    );
  }
}
