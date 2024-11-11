import 'package:flutter/material.dart';
import '../common/color_extension.dart';

class TitleSubtitleCell extends StatelessWidget {
  final String title;
  final String subtitle;
  const TitleSubtitleCell({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    Color backgroundColor = isDarkMode ? Colors.grey[850]! : TColo.white;
    Color subtitleColor = isDarkMode ? Colors.grey[400]! : TColo.grey;
    Color shadowColor = isDarkMode ? Colors.black26 : Colors.black12;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(color: shadowColor, blurRadius: 2),
        ],
      ),
      child: Column(
        children: [
          ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (bounds) {
              return LinearGradient(
                colors: isDarkMode ? TColo.primaryG.map((color) => color.withOpacity(0.8)).toList() : TColo.primaryG,
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ).createShader(Rect.fromLTRB(0, 0, bounds.width, bounds.height));
            },
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            subtitle,
            style: TextStyle(
              color: subtitleColor,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}