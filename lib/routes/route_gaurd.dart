// lib/routes/route_guard.dart
import 'package:flutter/cupertino.dart';
import 'package:expense_2/services/auth_service.dart';
import 'package:flutter/material.dart';

class AsyncRouteGuard extends StatelessWidget {
  final String routeName;
  final Widget child;
  final AuthService _authService = AuthService();

  AsyncRouteGuard({
    super.key, 
    required this.routeName,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _authService.isLoggedIn(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
  

        final isAuthenticated = snapshot.data ?? false;
        final isAuthRoute = routeName == '/login' || routeName == '/register';

        if (!isAuthenticated && !isAuthRoute && routeName != '/') {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.of(context).pushReplacementNamed('/login');
          });
          return Container(); // Placeholder while redirecting
        }

        if (isAuthenticated && isAuthRoute) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.of(context).pushReplacementNamed('/home');
          });
          return Container(); // Placeholder while redirecting
        }

        return child;
      },
    );
  }
}