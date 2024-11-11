import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../common/color_extension.dart';
import '../../common_widget/round_button.dart';

class FinishedWorkoutView extends StatefulWidget {
  const FinishedWorkoutView({super.key});

  @override
  State<FinishedWorkoutView> createState() => _FinishedWorkoutViewState();
}

class _FinishedWorkoutViewState extends State<FinishedWorkoutView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    Color primaryTextColor = isDarkMode ? Colors.lightBlue : TColo.black;
    Color secondaryTextColor = isDarkMode ? Colors.white : TColo.grey;
    Color maleTextColor = isDarkMode ? Colors.black45 : TColo.grey;
    Color borderColor = isDarkMode ? Colors.white : TColo.lightGrey;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20,),
              Image.asset(
                "assets/img/complete_workout.png",
                height: media.width * 0.8,
                fit: BoxFit.fitHeight,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Congratulations, You Have Finished Your Workout",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: primaryTextColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                )
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Exercises is king and nutrition is queen. Combine the two and you will have a kingdom",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: secondaryTextColor,
                  fontSize: 12,
                )
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "-Jack Lalanne",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: secondaryTextColor,
                  fontSize: 12,
                )
              ),
              const Spacer(),
              RoundButton(
                  title: "Back To Home",
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}