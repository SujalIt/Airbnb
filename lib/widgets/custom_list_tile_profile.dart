import 'package:flutter/material.dart';

class CustomListTileProfile extends StatelessWidget{

  final Widget leading;
  final String text;

  const CustomListTileProfile({
    super.key,
    required this.leading,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      trailing: Icon(Icons.arrow_forward_ios),
      title: Text(text),
      visualDensity: VisualDensity(vertical: -4),
      contentPadding: EdgeInsets.all(1),
    );
  }
}
