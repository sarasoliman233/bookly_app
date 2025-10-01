import 'package:flutter/material.dart';
import 'package:run_way/Core/utils/appText.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.backgroundColor, required this.textColor,  this.borderRadius, required this.text, this.onPressed});
final Color backgroundColor;
  final Color textColor;
  final BorderRadius? borderRadius;
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius:borderRadius ?? BorderRadius.circular(12)
            )
          ),
          child: AppText
            (text: text, fontSize: 18,
            fontFamily: 'poppins',
            fontWeight: FontWeight.w500,
            color: textColor,)),
    );
  }
}
