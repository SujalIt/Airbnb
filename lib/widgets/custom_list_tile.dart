import 'package:airbnb/airbnb_global_imports.dart';
import 'package:flutter/services.dart';

class CustomListTile extends StatelessWidget{

  final IconData? leadingIcon;
  final double? iconSize;
  final IconData? trailingIcon;
  final String title;
  final TextStyle? titleTextStyle;
  final Widget? subtitle;
  final VisualDensity? visualDensity;
  final EdgeInsetsGeometry? contentPadding;
  final VoidCallback? onTap;

  const CustomListTile({
    super.key,
    this.leadingIcon,
    this.iconSize,
    this.trailingIcon,
    required this.title,
    this.onTap,
    this.titleTextStyle,
    this.subtitle,
    this.visualDensity,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: leadingIcon != null ? Icon(leadingIcon,size: iconSize,) : null,
      trailing: trailingIcon != null ? Icon(trailingIcon) : null,
      title: Text(title,style: titleTextStyle,),
      subtitle: subtitle,
      visualDensity: visualDensity,
      contentPadding: contentPadding,
    );
  }
}