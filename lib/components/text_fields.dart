import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  const DefaultTextField(
      {super.key,
      this.margin,
      this.width,
      required this.controller,
      required this.hint,
      required this.label,
      this.surrfix,
      this.contentPadding,
      this.validator,
      this.onEnter,
      this.passwdVisible,
      this.enable = true});
  final EdgeInsets? margin;
  final bool enable;
  final EdgeInsets? contentPadding;
  final double? width;
  final TextEditingController controller;
  final String label;
  final String hint;
  final Widget? surrfix;
  final String? Function(String?)? validator;
  final bool? passwdVisible;
  final Function(String)? onEnter;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: margin ?? EdgeInsets.zero,
        width: width,
        child: TextFormField(
          enabled: enable,
          controller: controller,
          validator: validator,
          onFieldSubmitted: onEnter,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: contentPadding,
            suffixIcon: surrfix,
            labelText: label,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: hint,
            
            border: const OutlineInputBorder(),
          ),
          obscureText: passwdVisible ?? false,
        ));
  }
}
