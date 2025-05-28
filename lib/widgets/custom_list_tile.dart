import 'package:airbnb/airbnb_global_imports.dart';

class CustomListTile extends StatelessWidget{

  final IconData? leadingIcon;
  final double? iconSize;
  final IconData? trailingIcon;
  final String title;
  final TextStyle? titleTextStyle;
  final Widget? subtitle;
  final VisualDensity? visualDensity;
  final EdgeInsetsGeometry? contentPadding;

  const CustomListTile({
    super.key,
    this.leadingIcon,
    this.iconSize,
    this.trailingIcon,
    required this.title,
    this.titleTextStyle,
    this.subtitle,
    this.visualDensity,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leadingIcon != null ? Icon(leadingIcon,size: iconSize,) : null,
      trailing: trailingIcon != null ? Icon(trailingIcon) : null,
      title: Text(title,style: titleTextStyle,),
      subtitle: subtitle,
      visualDensity: visualDensity,
      contentPadding: contentPadding,
    );
  }
}