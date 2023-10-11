import 'package:flutter/material.dart';
import 'package:note_example_app/assets/constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.icon,
    this.radius,
    this.height,
    this.width,
    this.iconColor,
    this.backGround,
    this.iconSize,
  });

  final Function() onTap;
  final IconData icon;
  final double? radius;
  final double? height;
  final double? width;
  final Color? iconColor;
  final Color? backGround;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: backGround ?? AppColors.gray,
        borderRadius: BorderRadius.circular(radius ?? 10),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(radius ?? 10),
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(12),
            child: Icon(
              icon,
              color: iconColor ?? Colors.white,
              size: iconSize ?? 22,
            ),
          ),
        ),
      ),
    );
  }
}
