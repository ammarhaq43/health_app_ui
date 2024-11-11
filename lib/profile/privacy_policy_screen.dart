import 'package:fitness_health_ui/common/color_extension.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    Color textColor = isDarkMode ? Colors.white : TColo.black;
    Color iconBorderColor = isDarkMode ? Colors.blue : TColo.lightGrey;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDarkMode ? Colors.black : TColo.white,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Privacy Policy",
          style: GoogleFonts.poppins(
              color: textColor, fontSize: 16, fontWeight: FontWeight.w700),
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
        child: ListView(
          children: [
            Text(
              "Privacy Policy",
              style: GoogleFonts.poppins(
                  fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            Text(
              "1. Data Collection",
              style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 5),
            Text(
              "We collect personal data to provide a better experience for our users. "
                  "This may include name, email, height, weight, and other health-related data.",
              style: GoogleFonts.poppins(fontSize: 14),
            ),
            const SizedBox(height: 15),
            Text(
              "2. Data Usage",
              style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 5),
            Text(
              "Your data is used to improve the app's features and functionality. "
                  "We ensure your data is used solely for this purpose and will not be shared without consent.",
              style: GoogleFonts.poppins(fontSize: 14),
            ),
            const SizedBox(height: 15),
            Text(
              "3. Data Protection",
              style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 5),
            Text(
              "We employ various security measures to protect your data from unauthorized access, "
                  "alteration, or deletion.",
              style: GoogleFonts.poppins(fontSize: 14),
            ),
            const SizedBox(height: 15),
            Text(
              "4. User Rights",
              style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 5),
            Text(
              "You have the right to request access to your personal data and can request its deletion "
                  "at any time.",
              style: GoogleFonts.poppins(fontSize: 14),
            ),
            SizedBox(height: 15,),
            Text(
              "5. Third-Party Services",
              style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 5),
            Text(
              "This app may integrate third-party services (e.g., Google Fit) for enhanced functionalities. Please refer to their privacy policies to understand their data practices. ",
              style: GoogleFonts.poppins(fontSize: 14),
            ),
            SizedBox(height: 15,),
            Text(
              "6. User Consent",
              style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 5),
            Text(
              "By using this app, you consent to our privacy policy. If you disagree, please discontinue the app's use.",
              style: GoogleFonts.poppins(fontSize: 14),
            ),
            SizedBox(height: 15,),
            Text(
              "7. Data Retention",
              style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 5),
            Text(
              "Your personal data will be retained only for as long as necessary to provide you with our services and fulfill legal obligations.",
              style: GoogleFonts.poppins(fontSize: 14),
            ),
            SizedBox(height: 15,),
            Text(
              "8. Access and Control",
              style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 5),
            Text(
              "You have the right to access, update, or delete your personal data within the app. For assistance, please contact support.",
              style: GoogleFonts.poppins(fontSize: 14),
            ),
            SizedBox(height: 15,),
            Text(
              "9. Cookies and Tracking",
              style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 5),
            Text(
              "We may use cookies to track app usage and improve your experience. You can control cookie settings from your device's settings.",
              style: GoogleFonts.poppins(fontSize: 14),
            ),
            SizedBox(height: 15,),
            Text(
              "10. Changes to Privacy Policy",
              style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 5),
            Text(
              "We may update our privacy policy occasionally. Users will be notified of significant changes through an app notification or email.",
              style: GoogleFonts.poppins(fontSize: 14),
            ),
            SizedBox(height: 15,),
            Text(
              "11. Contact Information",
              style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 5),
            Text(
              "For any questions or concerns about this privacy policy, please contact us at your contact email.",
              style: GoogleFonts.poppins(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}