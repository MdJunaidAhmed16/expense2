import 'package:expense_2/components/transaction_form.dart';
import 'package:expense_2/demo/payment.dart';
import 'package:expense_2/ui/home.dart';
import 'package:expense_2/ui/signin.dart';
import 'package:expense_2/ui/signup.dart';
import 'package:flutter/cupertino.dart';

class RouteGenerator {
  Route? routeGenerate(RouteSettings settings){

    //final args = settings.arguments;

    switch(settings.name){
      case '/' : return CupertinoPageRoute(builder: (context) => const HomePage());
      case '/txnPage' : return CupertinoPageRoute(builder: (context) => const TxnForm());
      case '/signin' : return CupertinoPageRoute(builder: (context) => const SignIn());
      case '/signup' : return CupertinoPageRoute(builder: (context) => const SignUp());
      case '/demo' : return CupertinoPageRoute(builder: (context) => const PaymentScreen());
    }
    return null;
  }
}