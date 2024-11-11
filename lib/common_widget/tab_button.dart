import 'package:flutter/material.dart';

class TabButton extends StatelessWidget {
  final String icon;
  final String selectIcon;
  final bool isActive;
  final VoidCallback onTap;
  final Color activeColor;
  final Color inactiveColor;

  const TabButton({
    Key? key,
    required this.icon,
    required this.selectIcon,
    required this.isActive,
    required this.onTap,
    required this.activeColor,
    required this.inactiveColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(
          isActive ? activeColor : inactiveColor,
          BlendMode.srcIn,
        ),
        child: Image.asset(
          isActive ? selectIcon : icon,
          width: 24,
          height: 24,
        ),
      ),
    );
  }
}