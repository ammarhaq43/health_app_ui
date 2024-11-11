import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_health_ui/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../common/color_extension.dart';
import '../../common_widget/round_button.dart';
import 'login_view.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  bool isCheck = false;
  bool isPasswordVisible = false;
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuthServices _auth = FirebaseAuthServices();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    Color primaryTextColor = isDarkMode ? Colors.white : TColo.black;
    Color secondaryTextColor = isDarkMode ? Colors.white70 : TColo.grey;
    Color fieldTextColor = isDarkMode ? Colors.white : Colors.black;
    Color fieldBackgroundColor = isDarkMode ? Colors.grey[800]! : Colors.white;
    Color borderColor = isDarkMode ? Colors.white : Colors.grey;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : TColo.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Hey there,",
                        style: GoogleFonts.poppins(
                          color: secondaryTextColor,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "Create an Account",
                        style: GoogleFonts.poppins(
                          color: primaryTextColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: media.width * 0.05,
                      ),
                      TextFormField(
                        controller: _firstNameController,
                        style: TextStyle(color: fieldTextColor),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(22),
                              borderSide: BorderSide(
                                  color: Colors.white
                              )
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: borderColor
                              ),
                              borderRadius: BorderRadius.circular(22)),
                          hintText: "First Name",
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 15,
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Image.asset(
                              'assets/img/user_text.png',
                              width: 20,
                              height: 20,
                              color: borderColor,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your first name';
                          }
                        },
                      ),
                      SizedBox(
                        height: media.width * 0.04,
                      ),
                      TextFormField(
                          controller: _lastNameController,
                          style: TextStyle(color: fieldTextColor),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white
                              ),
                              borderRadius: BorderRadius.circular(22),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: borderColor
                                ),
                                borderRadius: BorderRadius.circular(22)),
                            hintText: "Last Name",
                            hintStyle: GoogleFonts.poppins(
                              fontSize: 15,
                            ),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/img/user_text.png',
                                width: 20,
                                height: 20,
                                color: borderColor,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your last name';
                            }
                          }
                      ),
                      SizedBox(
                        height: media.width * 0.04,
                      ),
                      TextFormField(
                        controller: _emailController,
                        style: TextStyle(color: fieldTextColor),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.white
                            ),
                            borderRadius: BorderRadius.circular(22),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: borderColor
                              ),
                              borderRadius: BorderRadius.circular(22)),
                          hintText: "Email",
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 15,
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Image.asset(
                              'assets/img/email.png',
                              width: 20,
                              height: 20,
                              color: borderColor,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                              .hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: media.width * 0.04,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        style: TextStyle(color: fieldTextColor),
                        obscureText: !isPasswordVisible,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(22),
                              borderSide: BorderSide(color: borderColor)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: borderColor),
                              borderRadius: BorderRadius.circular(22)),
                          hintText: "Password",
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 15,
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Image.asset(
                              'assets/img/lock.png',
                              width: 20,
                              height: 20,
                              color: borderColor,
                            ),
                          ),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isPasswordVisible = !isPasswordVisible;
                                });
                              },
                              icon: Icon(
                                isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: borderColor,
                              )),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter Your Password";
                          }
                          return null;
                        },
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                isCheck = !isCheck;
                              });
                            },
                            icon: Icon(
                              isCheck
                                  ? Icons.check_box_outlined
                                  : Icons.check_box_outline_blank_outlined,
                              color: secondaryTextColor,
                              size: 20,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "By continuing you accept our Privacy Policy and\nTerms of Use",
                              style: GoogleFonts.poppins(
                                color: secondaryTextColor,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: media.width * 0.4,
                      ),
                      RoundButton(
                        title: "Register",
                        onPressed: () {
                          if (_formKey.currentState!.validate() && isCheck) {
                            _signUp();
                          } else if (!isCheck) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Please accept the terms and conditions"),
                              ),
                            );
                          }
                        },
                      ),
                      SizedBox(
                        height: media.width * 0.04,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Container(
                                height: 1,
                                color: secondaryTextColor.withOpacity(0.5),
                              )),
                          Text(
                            "  Or  ",
                            style: GoogleFonts.poppins(
                              color: primaryTextColor,
                              fontSize: 12,
                            ),
                          ),
                          Expanded(
                              child: Container(
                                height: 1,
                                color: secondaryTextColor.withOpacity(0.5),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: media.width * 0.04,
                      ),
                      _buildSocialLoginButtons(media, fieldBackgroundColor, isDarkMode),
                      SizedBox(
                        height: media.width * 0.04,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginView(),
                            ),
                          );
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Already have an account? ",
                              style: GoogleFonts.poppins(
                                color: primaryTextColor,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              "Login",
                              style: GoogleFonts.poppins(
                                color: primaryTextColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: media.width * 0.04,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (_isLoading)
            Container(
              color: Colors.black.withOpacity(0.5),
              child: const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String hintText,
    required String icon,
    required Color textColor,
    bool obscureText = false,
    Widget? suffixIcon,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(22),
        ),
        filled: true,
        hintText: hintText,
        hintStyle: GoogleFonts.poppins(
          color: textColor.withOpacity(0.6),
          fontSize: 15,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset(icon, width: 20, height: 20),
        ),
        suffixIcon: suffixIcon,
      ),
      style: GoogleFonts.poppins(color: textColor),
      validator: validator,
    );
  }

  Widget _buildSocialLoginButtons(Size media, Color color, bool isDarkMode) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _socialLoginButton("assets/img/google.png", color, isDarkMode),
        SizedBox(width: media.width * 0.04),
        _socialLoginButton("assets/img/facebook.png", color, isDarkMode),
      ],
    );
  }

  Widget _socialLoginButton(String asset, Color borderColor, bool isDarkMode) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 50,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            width: 1,
            color: isDarkMode ? Colors.white : borderColor.withOpacity(0.4),
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Image.asset(asset, width: 20, height: 20),
      ),
    );
  }
  void _signUp() async{
    setState(() {
      _isLoading = true;
    });
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);
    if(user != null){
      print("User is successfully created");
      setState(() {
        _isLoading = false;
      });
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginView()));
    }else{
      print("Some error occured");
    }
  }
}