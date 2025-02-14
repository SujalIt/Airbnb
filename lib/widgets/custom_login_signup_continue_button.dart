import 'package:airbnb/utils/extensions.dart';
import 'package:flutter/material.dart';

class CustomLoginSignupContinueButton extends StatelessWidget{
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color foregroundColor;
  final Widget leading;
  final double? height;
  final double? width;
  final double? fontSize;

  const CustomLoginSignupContinueButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.leading,
    this.backgroundColor = Colors.white,
    this.foregroundColor = Colors.black,
    this.height,
    this.width,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
            side : BorderSide(color: Colors.black,width: 1)
        ),
        minimumSize: Size(width ?? MediaQuery.of(context).size.width * 0.0, height ?? 52),
      ),
    child: ListTile(
        contentPadding: EdgeInsets.all(1),
        leading: leading,
        visualDensity: VisualDensity(vertical: context.screenHeight * -0.002),
        title: Text(text),
      ),
    );
  }
}