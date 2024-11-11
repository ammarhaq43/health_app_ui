import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../common_widget/icon_title_next_row.dart';
import '../../common_widget/round_button.dart';
import '../common/color_extension.dart';

class SleepAddAlarmView extends StatefulWidget {
  final DateTime date;
  const SleepAddAlarmView({super.key, required this.date});

  @override
  State<SleepAddAlarmView> createState() => _SleepAddAlarmViewState();
}

class _SleepAddAlarmViewState extends State<SleepAddAlarmView> {
  bool positive = false;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    Color textColor = isDarkMode ? Colors.white : TColo.black;
    Color iconBorderColor = isDarkMode ? Colors.blue : TColo.lightGrey;
    Color backgroundColor = isDarkMode ? Colors.grey[850]! : TColo.white;
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : TColo.white,
      appBar: AppBar(
        backgroundColor: isDarkMode ? Colors.black : TColo.white,
        centerTitle: true,
        elevation: 0,
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
              "assets/img/closed_btn.png",
              width: 15,
              height: 15,
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: Text(
          "Add Alarm",
          style: GoogleFonts.poppins(
            color: textColor,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          )
        ),
        actions: [
          InkWell(
            onTap: () {},
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
                "assets/img/more_btn.png",
                width: 15,
                height: 15,
                fit: BoxFit.contain,
              ),
            ),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            IconTitleNextRow(
              icon: "assets/img/Bed_Add.png",
              title: "Bedtime",
              time: "09:00 PM",
              color: backgroundColor,
              onPressed: () {},
            ),
            const SizedBox(height: 10),
            IconTitleNextRow(
              icon: "assets/img/HoursTime.png",
              title: "Hours of sleep",
              time: "8 hours 30 minutes",
              color: backgroundColor,
              onPressed: () {},
            ),
            const SizedBox(height: 10),
            IconTitleNextRow(
              icon: "assets/img/Repeat.png",
              title: "Repeat",
              time: "Mon to Fri",
              color: backgroundColor,
              onPressed: () {},
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 15),
                  Container(
                    width: 30,
                    height: 30,
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/img/Vibrate.png",
                      width: 18,
                      height: 18,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Vibrate When Alarm Sound",
                      style: TextStyle(color: TColo.grey, fontSize: 12),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    child: Transform.scale(
                      scale: 0.7,
                      child: CustomAnimatedToggleSwitch<bool>(
                        current: positive,
                        values: [false, true],
                        indicatorSize: const Size.square(30.0),
                        animationDuration: const Duration(milliseconds: 200),
                        animationCurve: Curves.linear,
                        onChanged: (bool newValue) {
                          setState(() {
                            positive = newValue;
                          });
                        },
                        iconBuilder: (context, local, global) {
                          return const SizedBox();
                        },
                        iconsTappable: false,
                        wrapperBuilder: (context, global, child) {
                          return Stack(
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                left: 10.0,
                                right: 10.0,
                                height: 30.0,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: TColo.secondaryG,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(50.0),
                                    ),
                                  ),
                                ),
                              ),
                              child,
                            ],
                          );
                        },
                        foregroundIndicatorBuilder: (context, global) {
                          return SizedBox.fromSize(
                            size: const Size(10, 10),
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: TColo.white,
                                borderRadius:
                                const BorderRadius.all(Radius.circular(50.0)),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black38,
                                    spreadRadius: 0.05,
                                    blurRadius: 1.1,
                                    offset: Offset(0.0, 0.8),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            RoundButton(title: "Add", onPressed: () {}),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}