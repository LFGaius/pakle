import 'package:flutter/material.dart';
import 'package:pakle/code_verification_page.dart';
import 'package:pakle/login_page.dart';
import 'package:pakle/onboarding_screen.dart';
import 'package:pakle/sign_up_page.dart';
import 'package:pakle/start_page.dart';
import 'package:pakle/reset_password_page.dart';
import 'account_recovery_info_page.dart';
import 'choose_language_page.dart';

class RouteBuilder{
  static Route<dynamic> buidRoute(RouteSettings settings){
    final Map<String,dynamic> args=settings.arguments;

    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (_)=>StartPage());
      case '/onboarding':
        return MaterialPageRoute(builder: (_)=>OnboardingScreen());
      case '/login':
        return MaterialPageRoute(builder: (_)=>LoginPage());
      case '/signup':
        return MaterialPageRoute(builder: (_)=>SignUpPage());
      case '/verificationcode':
        return MaterialPageRoute(builder: (_)=>CodeVerificationPage(
                                                from: args['optype'],
                                                userData:args['userData']
                                              ));
      case '/recoveryinfopage':
        return MaterialPageRoute(builder: (_)=>AccountRecoveryInfoPage());
      case '/resetpassword':
        return MaterialPageRoute(builder: (_)=>ResetPasswordPage(userData:args['userData']));
      case '/chooselanguage':
        return MaterialPageRoute(builder: (_)=>ChooseLanguagePage());
      default: return errorRoute();
    }
  }

  static Route<dynamic> errorRoute(){
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Error'),
          ),
          body: Center(
            child: Text('ERROR'),
          ),
        );
      }
    );
  }
}