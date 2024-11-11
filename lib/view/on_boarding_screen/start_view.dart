import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../common/color_extension.dart';
import '../../common_widget/round_button.dart';
import 'on_boarding_view.dart';

class StartedView extends StatefulWidget {
  const StartedView({super.key});

  @override
  State<StartedView> createState() => _StartedViewState();
}

class _StartedViewState extends State<StartedView> {
  bool isChangeColor = false;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : TColo.white,
      body: Container(
        width: media.width,
        decoration: BoxDecoration(
          gradient: isChangeColor
              ? LinearGradient(
            colors: TColo.primaryG,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ) : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              "Fitness",
              style: GoogleFonts.poppins(
                color: isDarkMode ? Colors.white : TColo.black,
                fontSize: 36,
                fontWeight: FontWeight.w700,
              )
            ),
            Text(
              "Everybody Can Train",
              style: GoogleFonts.poppins(
                color: isDarkMode ? Colors.white70 : TColo.grey,
                fontSize: 18,
              )
            ),
            const Spacer(),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: RoundButton(
                  title: "Get Started",
                  type: isChangeColor
                      ? RoundButtonType.textGradient
                      : RoundButtonType.bgGradient,
                  onPressed: () {
                    if (isChangeColor) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OnBoardingView(),
                        ),
                      );
                    } else {
                      setState(() {
                        isChangeColor = true;
                      });
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}