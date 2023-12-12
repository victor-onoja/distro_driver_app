import 'package:distro_driver_v2/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'app_dimensions.dart';

var normalTextStyle = GoogleFonts.lato(
  textStyle: const TextStyle(
    color: colorBlack,
    fontSize: 16,
  ),
);
var normalTextStyleUnderline = GoogleFonts.lato(
  textStyle: const TextStyle(
      color: colorBlack, fontSize: 16, decoration: TextDecoration.underline),
);
var silverTextStyle = GoogleFonts.lato(
  textStyle: const TextStyle(
    color: colorSilver,
    fontSize: 13,
  ),
);
var normalTextStyle2 = GoogleFonts.lato(
  textStyle: const TextStyle(
    color: colorMediumGrey,
    fontSize: 16,
  ),
);
var normalTextStyle3 = GoogleFonts.lato(
  textStyle: const TextStyle(
    color: colorMediumGrey,
    fontSize: 20,
  ),
);
var normalTextStyle4 = GoogleFonts.lato(
  textStyle: const TextStyle(
    color: colorBlack,
    fontSize: 20,
  ),
);

var normalPrimaryStyle = GoogleFonts.lato(
  textStyle: const TextStyle(
    color: colorPrimary,
    fontSize: 16,
  ),
);

var whiteTextStyle = GoogleFonts.lato(
  textStyle: const TextStyle(
    color: colorWhite,
    fontSize: 24,
    fontWeight: FontWeight.w600,
  ),
);

TextStyle headingTextStyle = GoogleFonts.lato(
  color: colorBlack,
  fontSize: 18.px,
  fontWeight: FontWeight.w600,
);
TextStyle headingTextStyle3 = GoogleFonts.lato(
  color: colorMediumGrey,
  fontSize: 18.px,
  fontWeight: FontWeight.w600,
);
TextStyle headingTextStyle2 = GoogleFonts.lato(
  color: colorBlack,
  fontSize: 32.px,
  fontWeight: FontWeight.w600,
);

var subHeadingTextStyle = GoogleFonts.lato(
  color: colorMediumGrey,
  fontSize: 14.px,
  fontWeight: FontWeight.w500,
);
var subHeadingTextStyle3 = GoogleFonts.lato(
  color: colorBlack,
  fontSize: 17.px,
  fontWeight: FontWeight.w400,
);
var deliveryTextStyle = GoogleFonts.lato(
  color: colorYellow,
  fontSize: 12.px,
  fontWeight: FontWeight.w400,
);
var paidTextStyle = GoogleFonts.lato(
  color: colorPrimary,
  fontSize: 12.px,
  fontWeight: FontWeight.w400,
);

///Home screen
var buttonTextStyle = GoogleFonts.lato(
    color: Colors.white,
    fontWeight: FontWeight.w600,
    fontSize: 16.sp,
    fontStyle: FontStyle.normal);

///Personal Info
var textButtonStyle = GoogleFonts.lato(
    fontWeight: FontWeight.w500, fontSize: 16.sp, color: colorPrimary);

///ChatRoom
var bodyTextStyle = TextStyle(
  fontFamily: 'Lato',
  fontSize: AppDimensions.height14,
  fontWeight: FontWeight.w400,
  color: colorMediumGrey,
);
