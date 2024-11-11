import 'package:fitness_health_ui/view/home_screen/home_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../common/color_extension.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({super.key});

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    Color iconBorderColor = isDarkMode ? Colors.blue : TColo.lightGrey;
    return Scaffold(
          backgroundColor: isDarkMode ? Colors.black : TColo.white,
          appBar: AppBar(
          title: Text("Terms and Conditions", style: GoogleFonts.poppins(
          fontWeight: FontWeight.w500
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text("1. The content provided by this app is for informational purposes only and is not intended as a substitute for professional medical advice, diagnosis, or treatment. Always consult your healthcare provider for any health concerns.", style: GoogleFonts.poppins(
                  fontSize: 16
              ),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text("2. We value your privacy. Any personal or health-related data you provide will be stored securely and will not be shared with third parties without your consent, except as required by law.", style: GoogleFonts.poppins(
                fontSize: 16
              ),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text("3. You are responsible for ensuring that the information you provide to the app is accurate and up to date. The app is not liable for any consequences of inaccurate data input.", style: GoogleFonts.poppins(
                fontSize: 16
              ),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text("4. This app may include features that track health metrics. Please note that tracked data should be considered as supplemental and not definitive medical information.", style: GoogleFonts.poppins(
                fontSize: 16
              ),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text("5. This app does not offer emergency or urgent care services. In case of a medical emergency, please contact local emergency services immediately.", style: GoogleFonts.poppins(
                fontSize: 16
              ),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text("6. We are not liable for any injuries, losses, or damages that result from using this app. Use of the app is at your own risk.", style: GoogleFonts.poppins(
                fontSize: 16
              ),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text("7. We reserve the right to update these terms and conditions at any time. Continued use of the app constitutes acceptance of the updated terms.", style: GoogleFonts.poppins(
                fontSize: 16
              ),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text("8. Our app may integrate with third-party services (e.g., fitness trackers or health data sources) to provide enhanced features. We are not responsible for the accuracy or security of data from these third parties.", style: GoogleFonts.poppins(
                fontSize: 16
              ),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text("9. Users must be at least 18 years old or have permission from a parent or guardian to use this app. By using the app, you confirm that you meet this requirement.", style: GoogleFonts.poppins(
                fontSize: 16
              ),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text("10. Certain features of the app may require a subscription or additional fees. These will be clearly communicated to you, and by subscribing, you agree to any associated terms and costs.", style: GoogleFonts.poppins(
                fontSize: 16
              ),
                textAlign: TextAlign.left,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 297),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      backgroundColor: Colors.blue[200],
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Terms and conditions are accepted",
                            style: GoogleFonts.poppins(),
                          ),
                        ),
                      );
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeView()));
                    },
                    child: Text(
                      "Accept",
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
