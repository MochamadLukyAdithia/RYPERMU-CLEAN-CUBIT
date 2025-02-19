import 'package:flutter/material.dart';
import 'package:spotify_clean_arch/core/configs/theme/App_Pallete.dart';

class BasicButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double? height;
  final Color? color;
  final double? textSize;
  const BasicButton(
      {super.key,
      required this.onPressed,
      required this.title,
      this.height,
      this.color,
      this.textSize});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(
            height ?? 60,
          ),
          backgroundColor: color ?? AppPallete.primaryColor),
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: textSize ?? 18,
        ),
      ),
    );
  }
}
