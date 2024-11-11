import 'package:fitness_health_ui/profile/activity_history_screen.dart';
import 'package:fitness_health_ui/profile/contact_us_screen.dart';
import 'package:fitness_health_ui/profile/health_achievement_screen.dart';
import 'package:fitness_health_ui/profile/personal_data_screen.dart';
import 'package:fitness_health_ui/profile/privacy_policy_screen.dart';
import 'package:fitness_health_ui/profile/workout_progress_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../common_widget/round_button.dart';
import '../../common_widget/setting_row.dart';
import '../../common_widget/title_subtitle_cell.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import '../common/color_extension.dart';
import 'settings_screen.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  bool positive = false;

  List accountArr = [
    {"image": "assets/img/p_personal.png", "name": "Personal Data", "tag": "1"},
    {"image": "assets/img/p_achi.png", "name": "Achievement", "tag": "2"},
    {"image": "assets/img/p_activity.png", "name": "Activity History", "tag": "3"},
    {"image": "assets/img/p_workout.png", "name": "Workout Progress", "tag": "4"}
  ];

  List otherArr = [
    {"image": "assets/img/p_contact.png", "name": "Contact Us", "tag": "5"},
    {"image": "assets/img/p_privacy.png", "name": "Privacy Policy", "tag": "6"},
    {"image": "assets/img/p_setting.png", "name": "Settings", "tag": "7"},
  ];

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
        centerTitle: true,
        elevation: 0,
        leadingWidth: 0,
        title: Text(
          "Profile",
          style: GoogleFonts.poppins(
              color: textColor, fontSize: 16, fontWeight: FontWeight.w700
          ),
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
                  borderRadius: BorderRadius.circular(10)),
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
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      "assets/img/u2.png",
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Stefani Wong",
                          style: GoogleFonts.poppins(
                            color: textColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "Lose a Fat Program",
                          style: GoogleFonts.poppins(
                            color: subtextColor,
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 70,
                    height: 25,
                    child: RoundButton(
                      title: "Edit",
                      type: RoundButtonType.bgGradient,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      onPressed: () {},
                    ),
                  )
                ],
              ),
              const SizedBox(height: 15),
              const Row(
                children: [
                  Expanded(
                    child: TitleSubtitleCell(
                      title: "180cm",
                      subtitle: "Height",
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: TitleSubtitleCell(
                      title: "65kg",
                      subtitle: "Weight",
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: TitleSubtitleCell(
                      title: "22yo",
                      subtitle: "Age",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              _buildSection("Account", accountArr),
              const SizedBox(height: 25),
              _buildNotificationSection(),
              const SizedBox(height: 25),
              _buildSection("Other", otherArr),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title, List items) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    Color backgroundColor = isDarkMode ? Colors.grey[850]! : TColo.white;
    Color titleColor = isDarkMode ? Colors.white : TColo.black;
    Color shadowColor = isDarkMode ? Colors.black26 : Colors.black12;
    Color settingTextColor = isDarkMode ? Colors.white : TColo.black;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(color: shadowColor, blurRadius: 2),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              color: titleColor,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (context, index) {
              var iObj = items[index] as Map? ?? {};
              return SettingRow(
                icon: iObj["image"].toString(),
                title: iObj["name"].toString(),
                titleColor: settingTextColor,
                onPressed: () {
                  switch (iObj["tag"]) {
                    case "2":
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HealthAchievementsScreen()));
                      break;
                    case "4":
                      Navigator.push(context, MaterialPageRoute(builder: (context) => WorkoutProgressScreen()));
                      break;
                    case "3":
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ActivityHistoryScreen()));
                      break;
                    case "1":
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PersonalDataScreen()));
                      break;
                    case "7":
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsScreen()));
                      break;
                    case "6":
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const PrivacyPolicyScreen()));
                      break;
                    case "5":
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const ContactUsScreen()));
                      break;
                    default:
                      break;
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationSection() {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    Color backgroundColor = isDarkMode ? Colors.grey[850]! : TColo.white;
    Color titleColor = isDarkMode ? Colors.white : TColo.black;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Notification",
            style: GoogleFonts.poppins(
              color: titleColor,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 30,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/img/p_notification.png",
                    height: 15, width: 15, fit: BoxFit.contain),
                const SizedBox(width: 15),
                Expanded(
                  child: Text(
                    "Pop-up Notification",
                    style: GoogleFonts.poppins(
                      color: titleColor,
                      fontSize: 12,
                    ),
                  ),
                ),
                Container(
                  color: backgroundColor,
                  child: AnimatedToggleSwitch<bool>.dual(
                    current: positive,
                    first: false,
                    second: true,
                    height: 30,
                    onChanged: (bool value) => setState(() => positive = value),
                    indicatorSize: const Size(30, 30),
                    iconBuilder: (value) => value
                        ? const Icon(Icons.check, color: Colors.white)
                        : const Icon(Icons.close, color: Colors.white),
                    textBuilder: (value) => value
                        ? const Center(child: Text('On', style: TextStyle(color: Colors.white)))
                        : const Center(child: Text('Off', style: TextStyle(color: Colors.white))),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}