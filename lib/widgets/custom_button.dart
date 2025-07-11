import 'package:airbnb/airbnb_global_imports.dart';

class CustomButton extends StatelessWidget {
  final ButtonTypes type;
  final VoidCallback onPressed;
  final String? text;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? height;
  final double? width;
  final TextStyle? textStyle;
  final bool isLoading;

  // outline button
  final IconData? leadingIcon;
  final ButtonStyle? outlineButtonStyle;
  // icon button
  final EdgeInsetsGeometry? padding;
  final ButtonStyle? iconButtonStyle;
  final Widget? icon;


  const CustomButton({
    super.key,
    required this.type,
    required this.onPressed,
    this.text,
    this.backgroundColor,
    this.foregroundColor,
    this.height,
    this.width,
    this.textStyle,
    this.leadingIcon,
    this.outlineButtonStyle,
    this.isLoading = false,
    this.padding,
    this.icon,
    this.iconButtonStyle,
  });

  @override
  Widget build(BuildContext context) {
    switch(type){
      case ButtonTypes.elevated:
        return ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? AppColor.pink,
            foregroundColor: foregroundColor ?? AppColor.white,
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
                  text ?? "",
                  style: textStyle,
                ),
        );
      case ButtonTypes.outlined:
        return OutlinedButton(
          onPressed: onPressed,
          style: outlineButtonStyle,
          child: Text(
            text ?? "",
            style: textStyle,
          ),
        );
      case ButtonTypes.icon:
        return IconButton(
          style: iconButtonStyle,
          onPressed: onPressed,
          padding: padding,
          icon: icon ?? SizedBox(),
        );
    }
  }
}
