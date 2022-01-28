import 'dart:ui';

import 'package:flutter/material.dart';

class UiConstants {
  //COLORS

  static const Color primaryBlue = Color(0xff5E81F4);
  static const Color primaryBlack = Color(0xff1C1D21);
  static const Color primaryGrey = Color(0xff8181A5);

  static const Color secondaryYellow = Color(0xffF4BE5E);
  static const Color secondaryGreen = Color(0xff7CE7AC);
  static const Color secondaryRed = Color(0xffFF808B);
  static const Color secondaryBlue = Color(0xff9698D6);

  static const Color primaryBlue10 = Color(0x1A5E81F4);
  static const Color secondaryBlue10 = Color(0x1A40E1FA);
  static const Color secondaryGreen10 = Color(0x1A7CE7AC);
  static const Color secondaryYellow10 = Color(0x1AF4BE5E);
  static const Color secondaryRed10 = Color(0x1AFF808B);

  static const Color buttonHover = Color(0xff2B4EC1);

  static const Color outline = Color(0xFFF0F0F3);
  static const Color backgroundLight = Color(0xFFF5F5FA);
  static const Color background = Color(0xFFF6F6F6);
  static const Color backgroundWhite = Color(0xFFFFFFFF);
  static const Color outlineResting = Color(0xFFECECF2);

  // TEXTSTYLE
  static const TextStyle h1Bold = TextStyle(
      fontFamily: 'Lato',
      fontWeight: FontWeight.w700,
      fontSize: 32,
      color: primaryBlack);
  static const TextStyle h1BoldWhite = TextStyle(
      fontFamily: 'Lato',
      fontWeight: FontWeight.w700,
      fontSize: 32,
      color: backgroundWhite);
  static const TextStyle h2Bold = TextStyle(
      fontFamily: 'Lato',
      fontWeight: FontWeight.w700,
      fontSize: 26,
      color: primaryBlack);
  static const TextStyle h3Bold = TextStyle(
      fontFamily: 'Lato',
      fontWeight: FontWeight.w700,
      fontSize: 20,
      color: primaryBlack);
  static const TextStyle h4Bold = TextStyle(
      fontFamily: 'Lato',
      fontWeight: FontWeight.w700,
      fontSize: 18,
      color: primaryBlack);
  static const TextStyle h5Bold = TextStyle(
      fontFamily: 'Lato',
      fontWeight: FontWeight.w700,
      fontSize: 16,
      color: primaryBlack);
  static const TextStyle h3BoldBlue = TextStyle(
      fontFamily: 'Lato',
      fontWeight: FontWeight.w700,
      fontSize: 20,
      color: primaryBlue);
  static const TextStyle h4BoldBlue = TextStyle(
      fontFamily: 'Lato',
      fontWeight: FontWeight.w700,
      fontSize: 18,
      color: primaryBlue);
  static const TextStyle h5BoldBlue = TextStyle(
      fontFamily: 'Lato',
      fontWeight: FontWeight.w700,
      fontSize: 16,
      color: primaryBlue);
  static const TextStyle h3BoldGrey = TextStyle(
      fontFamily: 'Lato',
      fontWeight: FontWeight.w700,
      fontSize: 20,
      color: primaryGrey);
  static const TextStyle h4BoldGrey = TextStyle(
      fontFamily: 'Lato',
      fontWeight: FontWeight.w700,
      fontSize: 18,
      color: primaryGrey);
  static const TextStyle h5BoldGrey = TextStyle(
      fontFamily: 'Lato',
      fontWeight: FontWeight.w700,
      fontSize: 16,
      color: primaryGrey);
  static const TextStyle h5BoldWhite = TextStyle(
      fontFamily: 'Lato',
      fontWeight: FontWeight.w700,
      fontSize: 16,
      color: backgroundWhite);

  static const TextStyle captation = TextStyle(
      fontFamily: 'Lato',
      fontWeight: FontWeight.w900,
      fontSize: 14,
      color: primaryBlack);
  static const TextStyle captationBlue = TextStyle(
      fontFamily: 'Lato',
      fontWeight: FontWeight.w900,
      fontSize: 14,
      color: primaryBlue);
  static const TextStyle captationGrey = TextStyle(
      fontFamily: 'Lato',
      fontWeight: FontWeight.w900,
      fontSize: 14,
      color: primaryGrey);

  static const TextStyle buttonLabel14 = TextStyle(
      fontFamily: 'Lato',
      fontWeight: FontWeight.w700,
      fontSize: 14,
      color: primaryBlack);
  static const TextStyle buttonLabel14Blue = TextStyle(
      fontFamily: 'Lato',
      fontWeight: FontWeight.w700,
      fontSize: 14,
      color: primaryBlue);
  static const TextStyle buttonLabel14Grey = TextStyle(
      fontFamily: 'Lato',
      fontWeight: FontWeight.w700,
      fontSize: 14,
      color: primaryGrey);

  static const TextStyle buttonLabel12 = TextStyle(
      fontFamily: 'Lato',
      fontWeight: FontWeight.w700,
      fontSize: 12,
      color: primaryBlack);
  static const TextStyle buttonLabel12Blue = TextStyle(
      fontFamily: 'Lato',
      fontWeight: FontWeight.w700,
      fontSize: 12,
      color: primaryBlue);
  static const TextStyle buttonLabel12Grey = TextStyle(
      fontFamily: 'Lato',
      fontWeight: FontWeight.w700,
      fontSize: 12,
      color: primaryGrey);

  static const TextStyle regularTextBold14 = TextStyle(
      fontFamily: 'Lato',
      fontWeight: FontWeight.w700,
      fontSize: 14,
      color: primaryBlack);
  static const TextStyle regularText14 = TextStyle(
      fontFamily: 'Lato',
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: primaryBlack);
  static const TextStyle regularTextLight14 = TextStyle(
      fontFamily: 'Lato',
      fontWeight: FontWeight.w300,
      fontSize: 14,
      color: primaryBlack);

  static const TextStyle regularTextBold14White = TextStyle(
      fontFamily: 'Lato',
      fontWeight: FontWeight.w700,
      fontSize: 14,
      color: backgroundWhite);
  static const TextStyle regularText14White = TextStyle(
      fontFamily: 'Lato',
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: backgroundWhite);
  static const TextStyle regularTextLight14White = TextStyle(
      fontFamily: 'Lato',
      fontWeight: FontWeight.w300,
      fontSize: 14,
      color: backgroundWhite);

  static const TextStyle regularTextBold14Grey = TextStyle(
      fontFamily: 'Lato',
      fontWeight: FontWeight.w700,
      fontSize: 14,
      color: primaryGrey);
  static const TextStyle regularText14Grey = TextStyle(
      fontFamily: 'Lato',
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: primaryGrey);
  static const TextStyle regularTextLight14Grey = TextStyle(
      fontFamily: 'Lato',
      fontWeight: FontWeight.w300,
      fontSize: 14,
      color: primaryGrey);

  static const TextStyle regularTextBold12 = TextStyle(
      fontFamily: 'Lato',
      fontWeight: FontWeight.w700,
      fontSize: 12,
      color: primaryGrey);
  static const TextStyle regularText12 = TextStyle(
      fontFamily: 'Lato',
      fontWeight: FontWeight.w400,
      fontSize: 12,
      color: primaryGrey);
  static const TextStyle regularTextBold12Grey = TextStyle(
      fontFamily: 'Lato',
      fontWeight: FontWeight.w700,
      fontSize: 12,
      color: primaryGrey);
  static const TextStyle regularText12Grey = TextStyle(
      fontFamily: 'Lato',
      fontWeight: FontWeight.w400,
      fontSize: 12,
      color: primaryGrey);

  static const TextStyle secondaryTextBold14Red = TextStyle(
      fontFamily: 'Lato',
      fontWeight: FontWeight.w700,
      fontSize: 14,
      color: secondaryRed);
  static const TextStyle secondaryTextBold14PrimaryBlue = TextStyle(
      fontFamily: 'Lato',
      fontWeight: FontWeight.w700,
      fontSize: 14,
      color: primaryBlue);
  static const TextStyle secondaryTextBold14Green = TextStyle(
      fontFamily: 'Lato',
      fontWeight: FontWeight.w700,
      fontSize: 14,
      color: secondaryGreen);
  static const TextStyle secondaryTextBold14Blue = TextStyle(
      fontFamily: 'Lato',
      fontWeight: FontWeight.w700,
      fontSize: 14,
      color: secondaryBlue);
  static const TextStyle secondaryTextBold14Yellow = TextStyle(
      fontFamily: 'Lato',
      fontWeight: FontWeight.w700,
      fontSize: 14,
      color: secondaryYellow);

  static const TextStyle secondaryTextBold12Red = TextStyle(
      fontFamily: 'Lato',
      fontWeight: FontWeight.w700,
      fontSize: 12,
      color: secondaryRed);
  static const TextStyle secondaryTextBold12PrimaryBlue = TextStyle(
      fontFamily: 'Lato',
      fontWeight: FontWeight.w700,
      fontSize: 12,
      color: primaryBlue);
  static const TextStyle secondaryTextBold12Green = TextStyle(
      fontFamily: 'Lato',
      fontWeight: FontWeight.w700,
      fontSize: 12,
      color: secondaryGreen);
  static const TextStyle secondaryTextBold12Blue = TextStyle(
      fontFamily: 'Lato',
      fontWeight: FontWeight.w700,
      fontSize: 12,
      color: secondaryBlue);
  static const TextStyle secondaryTextBold12Yellow = TextStyle(
      fontFamily: 'Lato',
      fontWeight: FontWeight.w700,
      fontSize: 12,
      color: secondaryYellow);

  static const TextStyle secondaryText12Red = TextStyle(
      fontFamily: 'Lato',
      fontWeight: FontWeight.w400,
      fontSize: 12,
      color: secondaryRed);
  static const TextStyle secondaryText12PrimaryBlue = TextStyle(
      fontFamily: 'Lato',
      fontWeight: FontWeight.w400,
      fontSize: 12,
      color: primaryBlue);
  static const TextStyle secondaryText12Green = TextStyle(
      fontFamily: 'Lato',
      fontWeight: FontWeight.w400,
      fontSize: 12,
      color: secondaryGreen);
  static const TextStyle secondaryText12Blue = TextStyle(
      fontFamily: 'Lato',
      fontWeight: FontWeight.w400,
      fontSize: 12,
      color: secondaryBlue);
  static const TextStyle secondaryText12Yellow = TextStyle(
      fontFamily: 'Lato',
      fontWeight: FontWeight.w400,
      fontSize: 12,
      color: secondaryYellow);
}
