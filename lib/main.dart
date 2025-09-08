import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pomotime/core/navigation/app_router.dart';
import 'package:pomotime/core/theme/app_theme.dart';
import 'package:pomotime/features/auth/provider/auth_provider.dart';
import 'package:pomotime/features/auth/view/auth_wrapper.dart';
import 'package:pomotime/features/pomodoro/provider/timer_provider.dart';
import 'package:pomotime/features/user/provider/user_provider.dart';
import 'package:pomotime/firebase_options.dart';
import 'package:provider/provider.dart'; 

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
      ChangeNotifierProxyProvider<AuthProvider, UserProvider>(
        create: (context) => UserProvider(),
        update: (context, authProvider, previousUserProvider) {
          previousUserProvider?.updateUser(authProvider.user);
          return previousUserProvider!;
        },
      ),
      ChangeNotifierProxyProvider2<AuthProvider, UserProvider, TimerProvider>(
        create: (context) => TimerProvider(),
        update: (context, authProvider, userProvider, timerProvider) {
          timerProvider?.updateProviders(authProvider, userProvider);
          return timerProvider!;
        },
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
      onGenerateRoute: AppRouter.onGenerateRoute,
      home: const AuthWrapper(),
    );
  }
}
