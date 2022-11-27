import 'package:flutter/material.dart';

class CustomSocialElevatedButton extends StatelessWidget {
  const CustomSocialElevatedButton(
      {Key? key, required this.svgIcon, this.onPressed})
      : super(key: key);

  final Widget svgIcon;
  final onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: svgIcon,
    );
  }
}
