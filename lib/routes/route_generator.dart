import 'package:expense_2/components/transaction_form.dart';
import 'package:expense_2/demo/payment.dart';
import 'package:expense_2/routes/route_gaurd.dart';
import 'package:expense_2/ui/home.dart';
import 'package:expense_2/ui/signin.dart';
import 'package:expense_2/ui/signup.dart';
import 'package:flutter/cupertino.dart';

class RouteGenerator {
  Route? routeGenerate(RouteSettings settings) {
    switch(settings.name) {
      case '/home' : 
        return CupertinoPageRoute(
          builder: (context) => AsyncRouteGuard(
            routeName: settings.name!,
            child: const HomePage(),
          ),
        );
      case '/txnPage' : 
        return CupertinoPageRoute(
          builder: (context) => AsyncRouteGuard(
            routeName: settings.name!,
            child: const TxnForm(),
          ),
        );
      case '/login' : 
        return CupertinoPageRoute(
          builder: (context) => AsyncRouteGuard(
            routeName: settings.name!,
            child: const SignIn(),
          ),
        );
      case '/register' : 
        return CupertinoPageRoute(
          builder: (context) => AsyncRouteGuard(
            routeName: settings.name!,
            child: const SignUp(),
          ),
        );
      case '/demo' : 
        return CupertinoPageRoute(
          builder: (context) => AsyncRouteGuard(
            routeName: settings.name!,
            child: const PaymentScreen(),
          ),
        );
    }
    return null;
  }
}