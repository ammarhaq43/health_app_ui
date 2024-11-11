import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../common/color_extension.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    Color textColor = isDarkMode ? Colors.white : TColo.black;
    Color subtextColor = isDarkMode ? Colors.white : TColo.grey;
    Color iconBorderColor = isDarkMode ? Colors.blue : TColo.lightGrey;
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : TColo.white,
      appBar: AppBar(
        backgroundColor: isDarkMode ? Colors.black : TColo.white,
        title: Text(
          'Contact Us',
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
        child: ListView(
          children: [
            Text(
              "We're here to help!",
              style: GoogleFonts.poppins(
                color: textColor,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.phone, color: TColo.primaryColor1),
              title: Text(
                'Phone',
                style: GoogleFonts.poppins(
                  color: subtextColor,
                  fontSize: 14,
                ),
              ),
              subtitle: Text(
                '+1 (234) 567-890',
                style: GoogleFonts.poppins(
                  color: TColo.grey,
                  fontSize: 12,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.email, color: TColo.primaryColor1),
              title: Text(
                'Email',
                style: GoogleFonts.poppins(
                  color:subtextColor,
                  fontSize: 14,
                ),
              ),
              subtitle: Text(
                'support@fitnessapp.com',
                style: GoogleFonts.poppins(
                  color: TColo.grey,
                  fontSize: 12,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.location_on, color: TColo.primaryColor1),
              title: Text(
                'Office Address',
                style: GoogleFonts.poppins(
                  color: subtextColor,
                  fontSize: 14,
                ),
              ),
              subtitle: Text(
                '123 Fitness Street, Wellness City, WC 12345',
                style: GoogleFonts.poppins(
                  color: TColo.grey,
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Connect with us on social media:",
              style: GoogleFonts.poppins(
                color: textColor,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 50,
                  height: 40,
                  child: IconButton(
                    onPressed: () {},
                    icon: Image.asset("assets/img/facebook.png", width: 100, height: 100,),
                  ),
                ),
                SizedBox(
                  width: 50,
                  height: 70,
                  child: IconButton(
                    onPressed: () {},
                    icon: Image.asset("assets/img/instagram.png", width: 100, height: 100,),
                  ),
                ),
                SizedBox(
                  width: 50,
                  height: 60,
                  child: IconButton(
                    onPressed: () {},
                    icon: Image.asset("assets/img/twitter.png", width: 100, height: 100,),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              "Business Hours:",
              style: GoogleFonts.poppins(
                color: textColor,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Mon-Fri: 9:00 AM - 6:00 PM",
              style: GoogleFonts.poppins(
                color: TColo.grey,
                fontSize: 12,
              ),
            ),
            Text(
              "Sat-Sun: Closed",
              style: GoogleFonts.poppins(
                color: TColo.grey,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Frequently Asked Questions:",
              style: GoogleFonts.poppins(
                color: textColor,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            ExpansionTile(
              title: Text(
                "How do I reset my password?",
                style: GoogleFonts.poppins(
                  color: subtextColor,
                  fontSize: 12,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "To reset your password, go to the login page and click on 'Forgot Password'. Follow the instructions sent to your email.",
                    style: GoogleFonts.poppins(
                      color: subtextColor,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text(
                "Where can I download the app?",
                style: GoogleFonts.poppins(
                  color: subtextColor,
                  fontSize: 12,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "You can download the app from the Google Play Store or Apple App Store by searching for 'Fitness App'.",
                    style: GoogleFonts.poppins(
                      color: subtextColor,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text(
                "What should I do if I encounter a bug or issue in the app?",
                style: GoogleFonts.poppins(
                  color: subtextColor,
                  fontSize: 12,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "If you find a bug or issue while using the app, please contact our support team through the Contact Us page. Provide a detailed description of the issue, including screenshots if possible, and we’ll work on resolving it as soon as possible.",
                    style: GoogleFonts.poppins(
                      color: subtextColor,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text(
                "How do I delete my account?",
                style: GoogleFonts.poppins(
                  color: subtextColor,
                  fontSize: 12,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "If you wish to delete your account, please contact our support team via the Contact Us page, and we will guide you through the process of account deletion.",
                    style: GoogleFonts.poppins(
                      color: subtextColor,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text(
                "How can I report a fraudulent activity or security issue?",
                style: GoogleFonts.poppins(
                  color: subtextColor,
                  fontSize: 12,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "If you notice any fraudulent activity or have concerns about security, please report it immediately through our Contact Us page or email us directly at [support@yourapp.com].",
                    style: GoogleFonts.poppins(
                      color: subtextColor,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text(
                "Can I cancel or modify my subscription?",
                style: GoogleFonts.poppins(
                  color: subtextColor,
                  fontSize: 12,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Yes, you can cancel or modify your subscription anytime from your account settings. If you need further assistance, feel free to reach out to our support team.",
                    style: GoogleFonts.poppins(
                      color: subtextColor,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text(
                "Where can I find your privacy policy and terms of service?",
                style: GoogleFonts.poppins(
                  color: subtextColor,
                  fontSize: 12,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "You can find the Privacy Policy and Terms of Service links at the bottom of the app. These documents outline how we handle your data and your rights while using the app.",
                    style: GoogleFonts.poppins(
                      color: subtextColor,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text(
                "What platforms is your app available on?",
                style: GoogleFonts.poppins(
                  color:subtextColor,
                  fontSize: 12,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Our app is available for both Android and iOS platforms. You can download it from the Google Play Store or Apple App Store.",
                    style: GoogleFonts.poppins(
                      color: subtextColor,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text(
                "How do I contact customer support?",
                style: GoogleFonts.poppins(
                  color: subtextColor,
                  fontSize: 12,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "You can reach our customer support team by email at [support@yourapp.com] or by calling our support hotline at +1 (234) 567-890.",
                    style: GoogleFonts.poppins(
                      color: subtextColor,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text(
                "Is my personal data safe with your app?",
                style: GoogleFonts.poppins(
                  color: subtextColor,
                  fontSize: 12,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Yes, we take your privacy seriously. All your personal data is stored securely and encrypted. Please refer to our Privacy Policy for more details on how we protect your information.",
                    style: GoogleFonts.poppins(
                      color: subtextColor,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              "Or send us a message:",
              style: GoogleFonts.poppins(
                color: textColor,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: "Your Name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: "Your Email",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                labelText: "Your Message",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text("Submit Message", style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w700),),
              style: ElevatedButton.styleFrom(backgroundColor: TColo.primaryColor1),
            ),
          ],
        ),
      ),
    );
  }
}