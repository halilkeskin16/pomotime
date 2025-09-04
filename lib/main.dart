import 'package:flutter/material.dart';
import 'package:pomotime/core/navigation/app_router.dart';
import 'package:pomotime/core/navigation/routes.dart';
import 'package:pomotime/core/theme/app_theme.dart';
import 'package:pomotime/features/pomodoro/provider/timer_provider.dart';
import 'package:provider/provider.dart'; 

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TimerProvider(),
        ),
      ],
      child: const MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Odak Pomo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: pomodoroRoute,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
