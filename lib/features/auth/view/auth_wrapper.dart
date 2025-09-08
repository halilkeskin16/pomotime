import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pomotime/features/auth/provider/auth_provider.dart';
import 'package:pomotime/features/auth/view/login_screen.dart';
import 'package:pomotime/features/shell/view/main_shell.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    if (authProvider.isLoggedIn) {
      return const MainShell();
    } else {
      return const LoginScreen();
    }
  }
}