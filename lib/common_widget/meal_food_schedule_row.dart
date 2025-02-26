import 'package:flutter/material.dart';
import '../common/color_extension.dart';

class MealFoodScheduleRow extends StatelessWidget {
  final Map mObj;
  final int index;
  final bool isDarkMode;

  const MealFoodScheduleRow({
    super.key,
    required this.mObj,
    required this.index,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                color: index % 2 == 0
                    ? TColo.primaryColor2.withOpacity(0.4)
                    : TColo.secondaryColor2.withOpacity(0.4),
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: Image.asset(
                mObj["image"].toString(),
                width: 40,
                height: 40,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mObj["name"].toString(),
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : TColo.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  mObj["time"].toString(),
                  style: TextStyle(
                    color: isDarkMode ? Colors.white70 : TColo.grey,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              "assets/img/next_go.png",
              width: 25,
              height: 25,
            ),
          ),
        ],
      ),
    );
  }
}