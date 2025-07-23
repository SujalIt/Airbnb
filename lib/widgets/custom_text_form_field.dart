import 'package:airbnb/airbnb_global_imports.dart';

class CustomTextFormField extends StatelessWidget {

  final String? hintText;
  final TextEditingController? controller;
  final String? validatorText;
  final bool? readOnly;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final Widget? suffixIcon;
  final String? labelText;

  const CustomTextFormField({
    super.key,
    required this.controller,
    this.hintText,
    this.validatorText,
    this.readOnly,
    this.keyboardType,
    this.obscureText,
    this.suffixIcon,
    this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller ?? TextEditingController(),
      obscureText: obscureText ?? false,
      readOnly: readOnly ?? false,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: hintText,
        labelText: labelText,
        suffixIcon: suffixIcon,
      ),
      keyboardType: keyboardType,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validatorText;
        }
        return null;
      },
    );
  }
}
