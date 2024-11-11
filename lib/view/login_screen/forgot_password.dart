import 'package:fitness_health_ui/common/color_extension.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../common_widget/round_button.dart';
import 'login_view.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool isPasswordVisible = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    Color textColor = isDarkMode ? Colors.white : TColo.black;
    return Scaffold(
        backgroundColor: isDarkMode ? Colors.black : TColo.white,
      body:  SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 70, left: 10),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text(
                  "Create your new password",
                  style: GoogleFonts.poppins(
                      color: textColor,
                      fontSize: 23,
                      fontWeight: FontWeight.w700
                  )
                ),
                SizedBox(
                  height: media.width * 0.26,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 9),
                  child: TextFormField(
                    obscureText: !isPasswordVisible,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(22),
                            borderSide: BorderSide(
                              color: Colors.grey,
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey
                            ),
                            borderRadius: BorderRadius.circular(22)
                        ),
                        hintText: "Your Old Password",
                        hintStyle: GoogleFonts.poppins(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset(
                            'assets/img/lock.png',
                            width: 20,
                            height: 20,
                          ),
                        ),
                        suffixIcon: IconButton(
                            onPressed: (){
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                              });
                            },
                            icon: Icon(
                              isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                              color: Colors.grey,
                            )
                        )
                    ),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Please Enter Your Old Password";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 9),
                  child: TextFormField(
                    obscureText: !isPasswordVisible,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(22),
                            borderSide: BorderSide(
                              color: Colors.grey,
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey
                            ),
                            borderRadius: BorderRadius.circular(22)
                        ),
                        hintText: "Your New Password",
                        hintStyle: GoogleFonts.poppins(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset(
                            'assets/img/lock.png',
                            width: 20,
                            height: 20,
                          ),
                        ),
                        suffixIcon: IconButton(
                            onPressed: (){
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                              });
                            },
                            icon: Icon(
                              isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                              color: Colors.grey,
                            )
                        )
                    ),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Please Enter New Password";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 9),
                  child: TextFormField(
                    obscureText: !isPasswordVisible,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(22),
                            borderSide: BorderSide(
                              color: Colors.grey,
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey
                            ),
                            borderRadius: BorderRadius.circular(22)
                        ),
                        hintText: "Confirm Your Password",
                        hintStyle: GoogleFonts.poppins(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset(
                            'assets/img/lock.png',
                            width: 20,
                            height: 20,
                          ),
                        ),
                        suffixIcon: IconButton(
                            onPressed: (){
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                              });
                            },
                            icon: Icon(
                              isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                              color: Colors.grey,
                            )
                        )
                    ),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Please Confirm Your Password";
                      }
                      return null;
                    },
                  ),
                ),
              SizedBox(
                height: media.width * 0.04,
              ),
            Padding(
              padding: const EdgeInsets.only(top: 17),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: RoundButton(
                    title: "Done",
                    onPressed: () {
                      if (_formKey.currentState!.validate()){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginView()));
                      }
                    }),
              ),
            ),
                    ]),
          ),
      ),
    ));
  }
}