import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_health_ui/view/home_screen/home_view.dart';
import 'package:fitness_health_ui/view/login_screen/forgot_password.dart';
import 'package:fitness_health_ui/view/login_screen/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../common/color_extension.dart';
import '../../common_widget/round_button.dart';
import '../../firebase_auth_implementation/firebase_auth_services.dart';
import 'complete_profile_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  final FirebaseAuthServices _auth = FirebaseAuthServices();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    Color textColor = isDarkMode ? Colors.white : TColo.black;
    Color subTextColor = isDarkMode ? Colors.white70 : TColo.grey;
    Color fieldBackgroundColor = isDarkMode ? Colors.black54 : Colors.white;
    Color fieldTextColor = isDarkMode ? Colors.white : Colors.black;
    Color borderColor = isDarkMode ? Colors.white : Colors.grey;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : TColo.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SafeArea(
              child: Container(
                height: media.height * 0.9,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Hey there,",
                        style: GoogleFonts.poppins(
                            color: subTextColor, fontSize: 16),
                      ),
                      Text(
                        "Welcome Back",
                        style: GoogleFonts.poppins(
                            color: textColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: media.width * 0.05,
                      ),
                      SizedBox(
                        height: media.width * 0.04,
                      ),
                      TextFormField(
                        controller: _emailController,
                        style: TextStyle(color: fieldTextColor),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: fieldBackgroundColor,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(22),
                              borderSide: BorderSide(color: borderColor)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: borderColor),
                              borderRadius: BorderRadius.circular(22)),
                          hintText: "Email",
                          hintStyle: GoogleFonts.poppins(
                            color: borderColor,
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
                          filled: true,
                          fillColor: fieldBackgroundColor,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(22),
                              borderSide: BorderSide(color: borderColor)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: borderColor),
                              borderRadius: BorderRadius.circular(22)),
                          hintText: "Password",
                          hintStyle: GoogleFonts.poppins(
                            color: borderColor,
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ForgotPassword()));
                            },
                            child: Text(
                              "Forgot your password?",
                              style: GoogleFonts.poppins(
                                  color: subTextColor,
                                  fontSize: 10,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      RoundButton(
                          title: "Login",
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _signIn(context);
                            }
                          }
                      ),
                      SizedBox(
                        height: media.width * 0.04,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Container(
                                height: 1,
                                color: subTextColor.withOpacity(0.5),
                              )),
                          Text(
                            "  Or  ",
                            style:
                            GoogleFonts.poppins(color: textColor, fontSize: 12),
                          ),
                          Expanded(
                              child: Container(
                                height: 1,
                                color: subTextColor.withOpacity(0.5),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: media.width * 0.04,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildSocialLoginButton(
                              "assets/img/google.png", borderColor, media),
                          SizedBox(
                            width: media.width * 0.04,
                          ),
                          _buildSocialLoginButton(
                              "assets/img/facebook.png", borderColor, media),
                        ],
                      ),
                      SizedBox(
                        height: media.width * 0.04,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Don’t have an account yet? ",
                              style: GoogleFonts.poppins(
                                color: textColor,
                                fontSize: 14,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUpView()));
                              },
                              child: Text(
                                "Register",
                                style: GoogleFonts.poppins(
                                    color: textColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700),
                              ),
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

  Widget _buildSocialLoginButton(String asset, Color borderColor, Size media) {
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
            color: borderColor.withOpacity(0.4),
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Image.asset(
          asset,
          width: 20,
          height: 20,
        ),
      ),
    );
  }


  void _signIn(BuildContext context) async {
    setState(() {
      _isLoading = true;
    });

    String email = _emailController.text;
    String password = _passwordController.text;

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      setState(() {
        _isLoading = false;
      });

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const CompleteProfileView()),
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        _isLoading = false;
      });

      String errorMessage = "Your Email Or Password Is Incorrect";
      if (e.code == 'user-not-found') {
        errorMessage = "No user found with this email";
      } else if (e.code == 'wrong-password') {
        errorMessage = "Incorrect password";
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          action: SnackBarAction(
            label: 'OK',
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
          ),
        ),
      );
    } catch (e) {
      setState(() {
        _isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('An unexpected error occurred. Please try again later.'),
          action: SnackBarAction(
            label: 'OK',
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
          ),
        ),
      );
    }
  }
}