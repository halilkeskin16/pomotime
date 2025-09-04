import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryRed = Color(0xFFEA5B5B);
  static const Color darkBlue = Color(0xFF3D5A80);

  static const Color background = Color(0xFFF7F7F7); 
  static const Color white = Color(0xFFFFFFFF);
  static const Color darkGrey = Color(0xFF2C2C2C);  
  static const Color mediumGrey = Color(0xFF8A8A8A); 
  static const Color lightGrey = Color(0xFFE0E0E0);  
}


class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: 'Poppins',
      primaryColor: AppColors.primaryRed,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primaryRed,
        secondary: AppColors.darkBlue,
        surface: AppColors.white,
        onPrimary: AppColors.white,
        onSecondary: AppColors.white,
        onSurface: AppColors.darkGrey,
      ),

      
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.darkGrey,
        centerTitle: true,
      ),

      textTheme: TextTheme(
        displayLarge: const TextStyle(color: AppColors.darkGrey, fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(color: AppColors.darkGrey.withValues(alpha: .9)),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryRed,
          foregroundColor: AppColors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),

      sliderTheme: const SliderThemeData(
        activeTrackColor: AppColors.primaryRed,
        inactiveTrackColor: AppColors.lightGrey,
        thumbColor: AppColors.primaryRed,
      ),

      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.white,
        selectedItemColor: AppColors.primaryRed,
        unselectedItemColor: AppColors.mediumGrey,
        elevation: 5,
        showUnselectedLabels: true,
      ),
    );
  }
}