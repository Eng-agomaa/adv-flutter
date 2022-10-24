
import 'package:advanced_flutter/presentation/resources/font_manager.dart';
import 'package:flutter/material.dart';


TextStyle _getTextStyle (double fontSize,FontWeight fontWeight, Color color){
  return TextStyle(
    fontSize: fontSize,
    fontFamily: FontConstants.fontFamily,
    fontWeight: fontWeight,
    color: color,
  );
}
//           //         //             //    Regular

TextStyle getRegularStyle ({double fontSize = FontSize.s12,required Color color}){
  return _getTextStyle(
      fontSize, FontWeightManager.regular,color,);
}

//           //         //             //    medium

TextStyle getMediumStyle ({double fontSize = FontSize.s12,required Color color}){
  return _getTextStyle(
    fontSize, FontWeightManager.medium,color,);
}

//           //         //             //    light

TextStyle getLightStyle ({double fontSize = FontSize.s12,required Color color}){
  return _getTextStyle(
    fontSize, FontWeightManager.light,color,);
}

//           //         //             //    bold

TextStyle getBoldStyle ({double fontSize = FontSize.s12,required Color color}){
  return _getTextStyle(
    fontSize, FontWeightManager.bold,color,);
}

//           //         //             //    bold

TextStyle getSemiBoldStyle ({double fontSize = FontSize.s12,required Color color}){
  return _getTextStyle(
    fontSize, FontWeightManager.samiBold,color,);
}