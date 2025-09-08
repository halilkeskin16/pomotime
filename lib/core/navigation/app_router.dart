import 'package:flutter/material.dart';
import 'package:pomotime/core/navigation/routes.dart';
import 'package:pomotime/features/auth/view/login_screen.dart';
import 'package:pomotime/features/auth/view/register_screen.dart';
import 'package:pomotime/features/shell/view/main_shell.dart';                

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case shellRoute:
        return MaterialPageRoute(
          builder: (_) => const MainShell(),
        );
      case loginRoute:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case signUpRoute:
        return MaterialPageRoute(
          builder: (_) => const RegisterScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('Rota bulunamadı: ${settings.name}'),
            ),
          ),
        );
    }
  }
}