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
  final bool isLoading;

  final IconData? leadingIcon;
  final ButtonStyle? outlineButtonStyle;

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
    this.outlineButtonStyle,
    this.isLoading = false,
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
              minimumSize: Size(
                width ?? context.screenWidth * 0,
                height ?? context.screenHeight * 0.065,
              ),
            ),
            child: isLoading
                ? SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      color: AppColor.white,
                      strokeWidth: 3,
                    ),
                  )
                : Text(
                    text,
                    style: textStyle,
                  ),
          )
        : OutlinedButton(
            onPressed: onPressed,
            style: outlineButtonStyle,
            child: Text(
              text,
              style: textStyle,
            ),
          );
  }
}
