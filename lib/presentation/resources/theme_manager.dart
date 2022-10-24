import 'package:advanced_flutter/presentation/resources/color_manager.dart';
import 'package:advanced_flutter/presentation/resources/font_manager.dart';
import 'package:advanced_flutter/presentation/resources/styles_manager.dart';
import 'package:advanced_flutter/presentation/resources/value_manager.dart';
import 'package:flutter/material.dart';

ThemeData getThemeData() {
  return ThemeData(
    // Main Color                                                       COMMENT
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,

    // CardView                                                         COMMENT
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),
    // app bar theme                                                    COMMENT
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.white,
      elevation: AppSize.s4,
      shadowColor: ColorManager.grey,
      titleTextStyle: getRegularStyle(
        color: ColorManager.white,
        fontSize: FontSize.s16,
      ),
    ),

    // button them                                                      COMMENT

    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManager.grey1,
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.lightPrimary,
    ),

    //  elevated Button                                                 COMMENT
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      textStyle: getRegularStyle(
        color: ColorManager.white,
        fontSize: FontSize.s17,
      ),
      primary: ColorManager.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s12),
      ),
    )),
    // Text Theme                                                       COMMENT
textTheme: TextTheme(
  displayLarge: getSemiBoldStyle(color: ColorManager.darkGrey,fontSize: FontSize.s16),
  headlineLarge: getSemiBoldStyle(color: ColorManager.darkGrey,fontSize: FontSize.s16),
  headlineMedium: getRegularStyle(color: ColorManager.darkGrey,fontSize: FontSize.s14),
  titleMedium: getMediumStyle(color: ColorManager.primary,fontSize: FontSize.s16),
  bodyMedium: getRegularStyle(color: ColorManager.grey1,),
  bodyLarge: getRegularStyle(color: ColorManager.grey),
),
    // input decoration them ( text form field )                         COMMENT
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      // hint Style
      hintStyle: getRegularStyle(color: ColorManager.grey,fontSize: FontSize.s14),
      labelStyle: getMediumStyle(color: ColorManager.grey,fontSize: FontSize.s14),
      //enable Border
      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorManager.grey,width: AppSize.s1),
      borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8),),),
  // focused border
  focusedBorder: OutlineInputBorder(
  borderSide: BorderSide(color: ColorManager.grey,width: AppSize.s1),
  borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8),),),
  // error border
  errorBorder: OutlineInputBorder(
  borderSide: BorderSide(color: ColorManager.error,width: AppSize.s1),
  borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8),),),

  // focused error border
  focusedErrorBorder: OutlineInputBorder(
  borderSide: BorderSide(color: ColorManager.primary,width: AppSize.s1),
  borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8),),),
    ),
  );
}
