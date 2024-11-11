import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../common/color_extension.dart';
import '../../common_widget/round_button.dart';
import '../../main_tab/main_tab_view.dart';


class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    Color textColor = isDarkMode ? Colors.lightBlue : TColo.black;
    Color subtextColor = isDarkMode ? Colors.white : TColo.grey;
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : TColo.white,
      body: SafeArea(
        child: Container(
          width: media.width,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: media.width * 0.1,
              ),
              Image.asset(
                "assets/img/welcome.png",
                width: media.width * 0.75,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(
                height: media.width * 0.1,
              ),
              Text(
                "Welcome, Stefani",
                style: GoogleFonts.poppins(
                    color: textColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w700
                )
              ),
              Text(
                "You are all set now, let’s reach your\ngoals together with us",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(color: subtextColor, fontSize: 12),
              ),
              const Spacer(),

              RoundButton(
                  title: "Go To Home",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainTabView()));
                  }),

            ],
          ),
        ),

      ),
    );
  }
}