import 'package:flutter/material.dart';
import 'package:pomotime/core/navigation/routes.dart';
import 'package:pomotime/features/shell/view/main_shell.dart';                

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case pomodoroRoute:
        return MaterialPageRoute(
          builder: (_) => const MainShell(),
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