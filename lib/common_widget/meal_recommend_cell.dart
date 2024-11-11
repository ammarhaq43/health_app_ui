import 'package:fitness_health_ui/common_widget/round_button.dart';
import 'package:flutter/material.dart';
import '../common/color_extension.dart';

class MealRecommendCell extends StatelessWidget {
  final Map fObj;
  final int index;
  final Color subTextColor;

  const MealRecommendCell({
    super.key,
    required this.index,
    required this.fObj,
    required this.subTextColor,
  });

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    bool isEvent = index % 2 == 0;

    return Container(
      margin: const EdgeInsets.all(5),
      width: media.width * 0.5,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isEvent
              ? [
            TColo.primaryColor2.withOpacity(0.5),
            TColo.primaryColor1.withOpacity(0.5)
          ]
              : [
            TColo.secondaryColor2.withOpacity(0.5),
            TColo.secondaryColor1.withOpacity(0.5)
          ],
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            fObj["image"].toString(),
            width: media.width * 0.3,
            height: media.width * 0.25,
            fit: BoxFit.contain,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              fObj["name"],
              style: TextStyle(
                color: TColo.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "${fObj["size"]} | ${fObj["time"]} | ${fObj["kcal"]}",
              style: TextStyle(color: subTextColor, fontSize: 12),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SizedBox(
              width: 90,
              height: 35,
              child: RoundButton(
                fontSize: 12,
                type: isEvent
                    ? RoundButtonType.bgGradient
                    : RoundButtonType.bgSGradient,
                title: "View",
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}