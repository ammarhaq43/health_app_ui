import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import '../common/color_extension.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool emailNotifications = true;
  bool autoSync = false;
  String selectedLanguage = 'English';
  final List<String> languages = ['English', 'Spanish', 'French'];

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
          'Settings',
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
        iconTheme: IconThemeData(color: textColor),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDropdownOption(
              title: "Language",
              value: selectedLanguage,
              items: languages,
              onChanged: (value) => setState(() => selectedLanguage = value!),
              textColor: textColor,
            ),
            const SizedBox(height: 20),
            _buildToggleOption(
              title: "Email Notifications",
              value: emailNotifications,
              onChanged: (value) => setState(() => emailNotifications = value),
              textColor: textColor,
            ),
            const SizedBox(height: 20),
            _buildToggleOption(
              title: "Enable Auto Sync",
              value: autoSync,
              onChanged: (value) => setState(() => autoSync = value),
              textColor: textColor,
            ),
            const SizedBox(height: 20),
            Text(
              'Privacy Policy',
              style: GoogleFonts.poppins(
                color: textColor,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Divider(),
            Text(
              "You can read our privacy policy for details on data handling.",
              style: TextStyle(color: subtextColor),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleOption({
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
    required Color textColor,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            color: textColor,
            fontSize: 14,
          ),
        ),
        AnimatedToggleSwitch<bool>.dual(
          current: value,
          first: false,
          second: true,
          onChanged: onChanged,
          indicatorSize: const Size(30, 30),
          iconBuilder: (value) => value
              ? const Icon(Icons.check, color: Colors.black)
              : const Icon(Icons.close, color: Colors.black),
          textBuilder: (value) => value ? const Text('On') : const Text('Off'),
        ),
      ],
    );
  }

  Widget _buildDropdownOption({
    required String title,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
    required Color textColor,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            color: textColor,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: value,
          items: items.map((item) {
            return DropdownMenuItem(
              value: item,
              child: Text(
                item,
                style: GoogleFonts.poppins(color: textColor),
              ),
            );
          }).toList(),
          onChanged: onChanged,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}