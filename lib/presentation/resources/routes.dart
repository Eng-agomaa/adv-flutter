

import 'package:advanced_flutter/presentation/forget_password/forget_password_screen.dart';
import 'package:advanced_flutter/presentation/onboarding/onboardingscreen/onboarding_screen.dart';
import 'package:advanced_flutter/presentation/resources/strings_manager.dart';
import 'package:advanced_flutter/presentation/splash/splash_screen.dart';
import 'package:advanced_flutter/presentation/store_details/store_details_screen.dart';
import 'package:flutter/material.dart';

import '../login/login_screen.dart';
import '../main/main_screen.dart';
import '../register/register_screen.dart';

class Routes {
  static const String splashRoute = '/';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String forgetPasswordRoute = '/forgetPassword';
  static const String onBoardingRoute = '/onBoarding';
  static const String storeDetailsRoute = '/storeDetails';
  static const String mainRoute = '/main';

}

class RouteGenerator{
  static Route<dynamic> getRoute(RouteSettings settings){
    switch (settings.name){
      case Routes.splashRoute :
        return MaterialPageRoute(builder: (_)=> const  SplashScreen());
          case Routes.loginRoute :
        return MaterialPageRoute(builder: (_)=> const  LoginScreen());
          case Routes.registerRoute :
        return MaterialPageRoute(builder: (_)=> const  RegisterScreen());

          case Routes.forgetPasswordRoute :
        return MaterialPageRoute(builder: (_)=> const  ForgetPasswordScreen());
               case Routes.onBoardingRoute :
        return MaterialPageRoute(builder: (_)=> const  OnBoardingScreen());

          case Routes.storeDetailsRoute:
        return MaterialPageRoute(builder: (_)=> const  StoreDetailsScreen());
          case Routes.mainRoute:
        return MaterialPageRoute(builder: (_)=> const  MainScreen());

        default :
    return unDefinedRoute ();

    }
  }
  static Route<dynamic> unDefinedRoute (){
    return MaterialPageRoute(builder: (_) =>Scaffold(
      appBar: AppBar(title: const Text(AppStrings.noRouteFound),),
      body: const Center(child: Text(AppStrings.noRouteFound)),
    ));
  }
}