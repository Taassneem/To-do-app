import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/core/utils/app_color.dart';

// ignore: must_be_immutable
class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.backgroundColor = AppColors.primary});
  final String text;
  final Function() onPressed;
  Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: Theme.of(context).elevatedButtonTheme.style!.copyWith(backgroundColor: MaterialStateProperty.all(backgroundColor)),
        child: Text(text,
            style: GoogleFonts.lato(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            )));
  }
}
