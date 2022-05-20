import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color purple = Color(0xffb39ddb);
const Color clearGray = Color(0xffc4c4c4);
const Color gray = Color(0xFF8a8989);
const Color white = Color(0xFFfafafa);
const Color white2 = Color(0xFFB0AAA7);
const Color black = Color(0xFF09090a);
const Color red= Color(0xffaf2e2e);
const Color red2= Color(0xffcc6b6b);

const Color brownheigth=    Color(0xFF473D3A);
const Color brownlow=  Color(0xFFCEC7C4);
const Color gold=  Color(0xFFDAB68C);
const Color blackgreen=  Color(0xFF3A4742);




const LinearGradient redGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    stops: [.5, .9],
    colors: [red, red2]);


const LinearGradient blueGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    stops: [.1, .9],
    colors: [purple, purple]);





TextStyle labelStyle =
     TextStyle(
        fontSize: 28, fontWeight: FontWeight.w600, color: gray, height: .2);
TextStyle labelStyle2 =  TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: gray,
        height: 1.5);
TextStyle hintStyle = TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        color: gold,
        height: 1.5);
TextStyle buttonStyle =  TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold, color: white, height: 1.5);

TextStyle buttonStyle2 = TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold, color: clearGray, height: 1.5);

TextStyle appbarStyle =  TextStyle(
        fontSize: 24, fontWeight: FontWeight.w600, color: gray,);
TextStyle buttonTextStyle =  TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold, color: purple, height: 1.5);
TextStyle textstyles =  TextStyle(
        fontSize: 15, fontWeight: FontWeight.bold, color: gray, height: 1.5);
TextStyle hintStyle2 =  TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        color: clearGray,
        height: 1.5);

double sizeFromHeight(BuildContext context, double fraction,
    {bool hasAppBar = true}) {
  final screenHeight = MediaQuery.of(context).size.height;
  fraction = (hasAppBar ? (screenHeight - AppBar().preferredSize.
  height -
      MediaQuery.of(context).padding.top)
      : screenHeight) /
      fraction;
  return fraction;
}

double sizeFromWidth(BuildContext context, double fraction) {
  return MediaQuery.of(context).size.width / fraction;
}
