import 'package:airbnb/airbnb_global_imports.dart';

class CustomButton extends StatelessWidget {
  final ButtonTypes type;
  final VoidCallback onPressed;
  final String text;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? height;
  final double? width;
  final TextStyle? textStyle;

  final IconData? leadingIcon;

  const CustomButton({
    super.key,
    this.type = ButtonTypes.elevated,
    required this.onPressed,
    required this.text,
    this.backgroundColor,
    this.foregroundColor,
    this.height,
    this.width,
    this.textStyle,
    this.leadingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return type == ButtonTypes.elevated
        ? ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor ?? Colors.pink,
              foregroundColor: foregroundColor ?? Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              minimumSize: Size(width ?? context.screenWidth * 0,
                  context.screenHeight * 0.065),
            ),
            child: Text(
              text,
              style: textStyle,
            ),
          )
        : OutlinedButton(
            onPressed: onPressed,
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
                side: BorderSide(color: Colors.black, width: 1),
              ),
              minimumSize: Size(width ?? context.screenWidth * 1,
                  context.screenHeight * 0.03),
            ),
            child: ListTile(
              title: Text(text),
              contentPadding: EdgeInsets.all(1),
              leading: Icon(
                leadingIcon,
                size: context.screenWidth * 0.06,
              ),
              visualDensity: VisualDensity(vertical: context.screenHeight * -0.0025),
            ),
          );
  }
}
