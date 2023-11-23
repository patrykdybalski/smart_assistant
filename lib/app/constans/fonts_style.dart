import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:primary_school/app/constans/colors.dart';

class TextStyles {
  static textStyle1(
    double size,
  ) {
    return GoogleFonts.domine(
      color: AppColors.secondaryColor,
      fontSize: size,
      fontWeight: FontWeight.w400,
    );
  }

  static textStyle2(
    double size,
  ) {
    return GoogleFonts.domine(
      color: AppColors.secondaryColor,
      fontSize: size,
      fontWeight: FontWeight.w800,
    );
  }

  static textStyleRed(
    double size,
  ) {
    return GoogleFonts.domine(
      color: AppColors.redColor,
      fontSize: size,
      fontWeight: FontWeight.w800,
    );
  }

  static textStyleWhite(
    double size,
  ) {
    return GoogleFonts.domine(
      color: AppColors.whiteColor,
      fontSize: size,
      fontWeight: FontWeight.w800,
    );
  }

  static textStyleWhite1(
    double size,
  ) {
    return GoogleFonts.domine(
      color: Colors.white,
      fontSize: size,
      fontWeight: FontWeight.w800,
    );
  }
}
