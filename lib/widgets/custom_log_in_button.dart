import 'package:flutter/material.dart';

class CustomLogInButton extends StatelessWidget{
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color foregroundColor;
  final double? height;
  final double? width;
  final double? fontSize;

  const CustomLogInButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.backgroundColor = Colors.pink,
    this.foregroundColor = Colors.white,
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        minimumSize: Size(width ?? MediaQuery.of(context).size.width * 0.0, height ?? 52),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04,),
      ),
    );
  }
}