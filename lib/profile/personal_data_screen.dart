import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../common/color_extension.dart';
import '../../common_widget/round_button.dart';

class PersonalDataScreen extends StatefulWidget {
  const PersonalDataScreen({super.key});

  @override
  State<PersonalDataScreen> createState() => _PersonalDataScreenState();
}

class _PersonalDataScreenState extends State<PersonalDataScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _emailAddressController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _bloodTypeController = TextEditingController();

  String? _selectedGender;
  final List<String> _genderOptions = ['Male', 'Female', 'Not Specified'];

  String? _selectedOccupation;
  final List<String> _occupationOptions = [
    'Software Engineer',
    'Computer Engineer',
    'Electrical Engineer',
    'Mechanical Engineer',
    'Civil Engineer',
    'Chemical Engineer',
    'Aerospace Engineer',
    'Industrial Engineer',
    'Doctor (Physician)',
    'Surgeon',
    'Nurse',
    'Pharmacist',
    'Dentist',
    'Radiologist',
    'Medical Researcher',
    'Physician Assistant (PA)',
    'Civil Servant',
    'Public Health Administrator',
    'Urban Planner',
    'Social Worker',
    'Diplomat',
    'Law Enforcement Officer',
    'Biochemist',
    'Biotechnology Researcher',
    'Pharmacologist',
    'Toxicologist',
    'Geneticist',
    'Forensic Scientist',
    'Molecular Biologist',
    'Pharmacy Technician',
    'Research Pharmacist',
    'Pharmacy Educator',
    'Compounding Pharmacist'
  ];

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    Color iconBorderColor = isDarkMode ? Colors.blue : TColo.lightGrey;
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : TColo.white,
      appBar: AppBar(
        backgroundColor: isDarkMode ? Colors.black : TColo.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Personal Data",
          style: GoogleFonts.poppins(
            color: isDarkMode ? Colors.white : Colors.black,
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
      ),
     body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTextField("Name", _nameController, isDarkMode),
                const SizedBox(height: 15),
                _buildTextField("Age", _ageController, isDarkMode),
                const SizedBox(height: 15),
                _buildTextField("Height (cm)", _heightController, isDarkMode),
                const SizedBox(height: 15),
                _buildTextField("Weight (kg)", _weightController, isDarkMode),
                const SizedBox(height: 15),
                _buildTextField("Email Address", _emailAddressController, isDarkMode),
                const SizedBox(height: 15),
                IntlPhoneField(
                  decoration: InputDecoration(
                    labelText: "Phone No.",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                _buildGenderDropdown(isDarkMode),
                const SizedBox(height: 15),
                _buildTextField("Address", _addressController, isDarkMode),
                const SizedBox(height: 15),
                _buildOccupationDropdown(isDarkMode),
                const SizedBox(height: 15),
                IntlPhoneField(
                  decoration: InputDecoration(
                    labelText: "Emergency Contact No.",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                _buildTextField("Blood Type", _bloodTypeController, isDarkMode),
                const SizedBox(height: 25),
                Center(
                  child: RoundButton(
                    title: "Save",
                    type: RoundButtonType.bgGradient,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: isDarkMode ? Colors.white : Colors.black,
                            content: Text(
                              "Personal data saved successfully!",
                              style: TextStyle(color: isDarkMode ? Colors.black : Colors.white),
                            ),
                          ),
                        );
                        _nameController.clear();
                        _ageController.clear();
                        _heightController.clear();
                        _weightController.clear();
                        _emailAddressController.clear();
                        _addressController.clear();
                        _bloodTypeController.clear();
                        _selectedGender = null;
                        _selectedOccupation = null;
                        setState(() {});
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, bool isDarkMode) {
    return TextFormField(
      controller: controller,
      validator: (value) => value!.isEmpty ? "$label is required" : null,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.poppins(
            fontSize: 14, color: isDarkMode ? Colors.white70 : TColo.grey
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      style: GoogleFonts.poppins(
          fontSize: 14, color: isDarkMode ? Colors.white : TColo.black
      ),
    );
  }

  Widget _buildGenderDropdown(bool isDarkMode) {
    return DropdownButtonFormField<String>(
      value: _selectedGender,
      validator: (value) => value == null ? "Gender is required" : null,
      items: _genderOptions.map((String gender) {
        return DropdownMenuItem<String>(
          value: gender,
          child: Text(
            gender,
            style: GoogleFonts.poppins(
              fontSize: 14, color: isDarkMode ? Colors.white : TColo.black,
            ),
          ),
        );
      }).toList(),
      onChanged: (newValue) {
        setState(() {
          _selectedGender = newValue;
        });
      },
      decoration: InputDecoration(
        labelText: "Gender",
        labelStyle: GoogleFonts.poppins(
          fontSize: 14, color: isDarkMode ? Colors.white : TColo.grey,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget _buildOccupationDropdown(bool isDarkMode) {
    return DropdownButtonFormField<String>(
      value: _selectedOccupation,
      validator: (value) => value == null ? "Occupation is required" : null,
      items: _occupationOptions.map((String occupation) {
        return DropdownMenuItem<String>(
          value: occupation,
          child: Text(
            occupation,
            style: GoogleFonts.poppins(
              fontSize: 14, color: isDarkMode ? Colors.white : TColo.black,
            ),
          ),
        );
      }).toList(),
      onChanged: (newValue) {
        setState(() {
          _selectedOccupation = newValue;
        });
      },
      decoration: InputDecoration(
        labelText: "Occupation",
        labelStyle: GoogleFonts.poppins(
          fontSize: 14, color: isDarkMode ? Colors.white70 : TColo.grey,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      dropdownColor: isDarkMode ? Colors.black : Colors.white,
    );
  }
}