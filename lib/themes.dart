import 'package:flutter/material.dart';
import 'package:analyseur/colors.dart';

ThemeData lightTheme(BuildContext context) {
  return ThemeData(
    appBarTheme: AppBarTheme(
      color: kPrimaryLightColor,
      elevation: 0.5,
    ),
    primaryColor: kPrimaryLightColor,
    accentColor: kAccentLightColor,
    scaffoldBackgroundColor: kBackgroundLightColor,
    backgroundColor: kBackgroundLightColor,
    colorScheme: ColorScheme.light(secondary: kSecondaryLightColor),
    iconTheme: IconThemeData(color: kBodyTextColorLight),
    accentIconTheme: IconThemeData(color: kAccentIconLightColor),
    primaryIconTheme: IconThemeData(color: kPrimaryIconLightColor),
  );
}

ThemeData darkTheme(BuildContext context) {
  return ThemeData.dark().copyWith(
    primaryColor: kPrimaryDarkColor,
    accentColor: kAccentDarkColor,
    scaffoldBackgroundColor: kBackgroundDarkColor,
    backgroundColor: kBackgroundDarkColor,
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: kBackgroundDarkColor,
    ),
    appBarTheme: AppBarTheme(
      color: kPrimaryDarkColor,
      elevation: 1,
      iconTheme: IconThemeData(color: kBodyTextColorDark),
      textTheme: TextTheme(headline6: TextStyle(fontSize: 20)).apply(bodyColor: kBodyTextColorDark),
    ),
    textTheme: TextTheme(bodyText1: TextStyle(), bodyText2: TextStyle()).apply(
      bodyColor: kBodyTextColorDark,
      displayColor: kBodyTextColorDark,
    ),
  );
}