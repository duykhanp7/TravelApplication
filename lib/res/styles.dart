import 'package:flutter/material.dart';

class AppStyles {
  const AppStyles._();

  static const String fontFamily = 'Roboto';
  static const textBaseline = TextBaseline.alphabetic;
  static const leadingDistribution = TextLeadingDistribution.even;

  static const TextStyle displayLarge = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w400,
    fontFamily: AppStyles.fontFamily,
    textBaseline: AppStyles.textBaseline,
    leadingDistribution: AppStyles.leadingDistribution,
  );
  static const TextStyle displayMedium = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w400,
    fontFamily: AppStyles.fontFamily,
    textBaseline: AppStyles.textBaseline,
    leadingDistribution: AppStyles.leadingDistribution,
  );
  static const TextStyle displaySmall = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w400,
    fontFamily: AppStyles.fontFamily,
    textBaseline: AppStyles.textBaseline,
    leadingDistribution: AppStyles.leadingDistribution,
  );
  static const TextStyle headlineLarge = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    fontFamily: AppStyles.fontFamily,
    textBaseline: AppStyles.textBaseline,
    leadingDistribution: AppStyles.leadingDistribution,
  );
  static const TextStyle headlineMedium = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    fontFamily: AppStyles.fontFamily,
    textBaseline: AppStyles.textBaseline,
    leadingDistribution: AppStyles.leadingDistribution,
  );
  static const TextStyle headlineSmall = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    fontFamily: AppStyles.fontFamily,
    textBaseline: AppStyles.textBaseline,
    leadingDistribution: AppStyles.leadingDistribution,
  );
  static const TextStyle titleLarge = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w500,
    fontFamily: AppStyles.fontFamily,
    textBaseline: AppStyles.textBaseline,
    leadingDistribution: AppStyles.leadingDistribution,
  );
  static const TextStyle titleMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: AppStyles.fontFamily,
    textBaseline: AppStyles.textBaseline,
    leadingDistribution: AppStyles.leadingDistribution,
  );
  static const TextStyle titleSmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: AppStyles.fontFamily,
    textBaseline: AppStyles.textBaseline,
    leadingDistribution: AppStyles.leadingDistribution,
  );
  static const TextStyle labelLarge = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    fontFamily: AppStyles.fontFamily,
    textBaseline: AppStyles.textBaseline,
    leadingDistribution: AppStyles.leadingDistribution,
  );
  static const TextStyle labelMedium = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    fontFamily: AppStyles.fontFamily,
    textBaseline: AppStyles.textBaseline,
    leadingDistribution: AppStyles.leadingDistribution,
  );
  static const TextStyle labelSmall = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    fontFamily: AppStyles.fontFamily,
    textBaseline: AppStyles.textBaseline,
    leadingDistribution: AppStyles.leadingDistribution,
  );
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: AppStyles.fontFamily,
    textBaseline: AppStyles.textBaseline,
    leadingDistribution: AppStyles.leadingDistribution,
  );
  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: AppStyles.fontFamily,
    textBaseline: AppStyles.textBaseline,
    leadingDistribution: AppStyles.leadingDistribution,
  );
  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontFamily: AppStyles.fontFamily,
    textBaseline: AppStyles.textBaseline,
    leadingDistribution: AppStyles.leadingDistribution,
  );

  static TextTheme textTheme = const TextTheme(
    displayLarge: AppStyles.displayLarge,
    displayMedium: AppStyles.displayMedium,
    displaySmall: AppStyles.displaySmall,
    headlineLarge: AppStyles.headlineLarge,
    headlineMedium: AppStyles.headlineMedium,
    headlineSmall: AppStyles.headlineSmall,
    titleLarge: AppStyles.titleLarge,
    titleMedium: AppStyles.titleMedium,
    titleSmall: AppStyles.titleSmall,
    labelLarge: AppStyles.labelLarge,
    labelMedium: AppStyles.labelMedium,
    labelSmall: AppStyles.labelSmall,
    bodyLarge: AppStyles.bodyLarge,
    bodyMedium: AppStyles.bodyMedium,
    bodySmall: AppStyles.bodySmall,
  );
}
