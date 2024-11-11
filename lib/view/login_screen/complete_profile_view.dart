import 'package:fitness_health_ui/view/login_screen/what_your_goal_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../common/color_extension.dart';
import '../../common_widget/round_button.dart';
import '../../common_widget/round_textfield.dart';

class CompleteProfileView extends StatefulWidget {
  const CompleteProfileView({super.key});

  @override
  State<CompleteProfileView> createState() => _CompleteProfileViewState();
}

class _CompleteProfileViewState extends State<CompleteProfileView> {
  TextEditingController txtDate = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  String? selectedGender;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    Color primaryTextColor = isDarkMode ? Colors.lightBlue : TColo.black;
    Color secondaryTextColor = isDarkMode ? Colors.grey : TColo.grey;
    Color borderColor = isDarkMode ? Colors.white : TColo.lightGrey;
    Color errorColor = Colors.red;

    return Theme(
      data: Theme.of(context).copyWith(
        inputDecorationTheme: InputDecorationTheme(
          errorStyle: TextStyle(color: errorColor, fontSize: 12),
        ),
      ),
      child: Scaffold(
        backgroundColor: isDarkMode ? Colors.black : TColo.white,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Image.asset(
                      "assets/img/complete_profile.png",
                      width: media.width,
                      fit: BoxFit.fitWidth,
                    ),
                    SizedBox(height: media.width * 0.05),
                    Text(
                      "Let’s complete your profile",
                      style: GoogleFonts.poppins(
                        color: primaryTextColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "It will help us to know more about you!",
                      style: GoogleFonts.poppins(color: secondaryTextColor, fontSize: 12),
                    ),
                    SizedBox(height: media.width * 0.05),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: borderColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width: 50,
                                  height: 50,
                                  padding: const EdgeInsets.symmetric(horizontal: 15),
                                  child: Image.asset(
                                    "assets/img/gender.png",
                                    width: 20,
                                    height: 20,
                                    fit: BoxFit.contain,
                                    color: secondaryTextColor,
                                  ),
                                ),
                                Expanded(
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButtonFormField<String>(
                                      value: selectedGender,
                                      items: ["Male", "Female", "Not Specified"]
                                          .map((name) => DropdownMenuItem(
                                        value: name,
                                        child: Text(
                                          name,
                                          style: GoogleFonts.poppins(
                                            color: secondaryTextColor,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ))
                                          .toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          selectedGender = value;
                                        });
                                      },
                                      isExpanded: true,
                                      hint: Text(
                                        "Gender",
                                        style: TextStyle(
                                          color: secondaryTextColor,
                                          fontSize: 14,
                                        ),
                                      ),
                                      validator: (value) => value == null ? 'Please select gender' : null,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                              ],
                            ),
                          ),
                          SizedBox(height: media.width * 0.04),
                          GestureDetector(
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime.now(),
                              );
                              if (pickedDate != null) {
                                String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                                setState(() {
                                  txtDate.text = formattedDate;
                                });
                              }
                            },
                            child: AbsorbPointer(
                              child: RoundTextField(
                                controller: txtDate,
                                hitText: "Date of Birth",
                                icon: "assets/img/date.png",
                                textColor: secondaryTextColor,
                                borderColor: borderColor,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please select your date of birth";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: media.width * 0.04),
                          Row(
                            children: [
                              Expanded(
                                child: RoundTextField(
                                  controller: weightController,
                                  hitText: "Your Weight",
                                  icon: "assets/img/weight.png",
                                  textColor: secondaryTextColor,
                                  borderColor: borderColor,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please enter your weight";
                                    }
                                    if (double.tryParse(value) == null) {
                                      return "Enter a valid number";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                width: 50,
                                height: 50,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: TColo.secondaryG,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Text(
                                  "KG",
                                  style: GoogleFonts.poppins(color: TColo.white, fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: media.width * 0.04),
                          Row(
                            children: [
                              Expanded(
                                child: RoundTextField(
                                  controller: heightController,
                                  hitText: "Your Height",
                                  icon: "assets/img/hight.png",
                                  textColor: secondaryTextColor,
                                  borderColor: borderColor,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please enter your height";
                                    }
                                    if (double.tryParse(value) == null) {
                                      return "Enter a valid number";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                width: 50,
                                height: 50,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: TColo.secondaryG,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Text(
                                  "CM",
                                  style: GoogleFonts.poppins(color: TColo.white, fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: media.width * 0.07),
                          RoundButton(
                            title: "Next >",
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const WhatYourGoalView(),
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
