import 'package:flutter/material.dart';

import '../colors.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton(
      {Key? key,
      this.fontSize,
      this.text,
      required this.press,
      this.height,
      this.width,
      this.buttonColor,
      this.padding})
      : super(key: key);
  final String? text;
  final Function press;
  final double? height;
  final double? width;
  final Color? buttonColor;
  final double? fontSize;
  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: padding ?? EdgeInsets.zero,
      width: width ?? double.infinity,
      height: height ?? 55,
      child: TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            primary: Colors.white,
            backgroundColor: buttonColor ?? Theme.of(context).primaryColor,
          ),
          onPressed: press as void Function()?,
          child: Text(
            text ?? "확인",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: fontSize ?? 16,
              color: Colors.white,
            ),
          )),
    );
  }
}

class DefaultPaddingButton extends StatelessWidget {
  const DefaultPaddingButton(
      {Key? key,
      this.fontSize,
      this.text,
      required this.press,
      this.padding,
      this.buttonColor,
      this.margin})
      : super(key: key);
  final String? text;
  final Function press;
  final Color? buttonColor;
  final double? fontSize;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.zero,
      child: TextButton(
          style: TextButton.styleFrom(
            minimumSize: Size.zero,
            padding: padding,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            primary: Colors.white,
            backgroundColor: buttonColor ?? Theme.of(context).primaryColor,
          ),
          onPressed: press as void Function()?,
          child: Text(
            text ?? "확인",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: fontSize ?? 16,
              color: Colors.white,
            ),
          )),
    );
  }
}

class DefaultOutlineButton extends StatelessWidget {
  const DefaultOutlineButton(
      {Key? key,
      this.fontSize,
      this.text,
      required this.press,
      this.height,
      this.width,
      this.buttonColor,
      this.padding})
      : super(key: key);
  final String? text;
  final Function press;
  final double? height;
  final double? width;
  final Color? buttonColor;
  final double? fontSize;
  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: padding ?? EdgeInsets.zero,
      width: width ?? double.infinity,
      height: height ?? 55,
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
              side: const BorderSide(width: 1, color: kIconColor),
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
              foregroundColor: Colors.grey),
          onPressed: press as void Function()?,
          child: Text(
            text ?? "확인",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: fontSize ?? 16,
              color: kGreyColor,
            ),
          )),
    );
  }
}

class ToggleButton extends StatelessWidget {
  const ToggleButton(
      {super.key,
      required this.press,
      required this.text,
      required this.activate});
  final Function press;
  final String text;

  final bool activate;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 76,
      height: 32,
      child: TextButton(
          style: activate
              ? TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  side: const BorderSide(color: Color(0xffFFE3CC), width: 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                  primary: kIconColor,
                  backgroundColor: const Color(0xffFFF1E5),
                )
              : TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                  primary: kIconColor,
                  backgroundColor: const Color(0xffF7F8FA),
                ),
          onPressed: press as void Function()?,
          child: Container(
            alignment: Alignment.center,
            child: FittedBox(
                fit: BoxFit.cover,
                child: Text(
                  text,
                  style: activate
                      ? TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).primaryColor)
                      : const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: kTextColor),
                )),
          )),
    );
  }
}
