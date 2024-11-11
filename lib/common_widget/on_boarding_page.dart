import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../common/color_extension.dart';

class OnBoardingPage extends StatelessWidget {
  final Map pObj;
  final Color textColor;

  const OnBoardingPage({
    Key? key,
    required this.pObj,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return SizedBox(
      width: media.width,
      height: media.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            pObj["image"].toString(),
            width: media.width,
            fit: BoxFit.fitWidth,
          ),
          SizedBox(
            height: media.width * 0.1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              pObj["title"].toString(),
              style: GoogleFonts.poppins(
                color: textColor,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              pObj["subtitle"].toString(),
              style: GoogleFonts.poppins(
                color: textColor.withOpacity(0.7),
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}