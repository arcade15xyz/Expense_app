import 'package:flutter/material.dart';

import 'package:expense_app/widgets/expenses.dart';

// from seed make different shades of the seed color applied .
var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 152, 39, 216),
);

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData.light(useMaterial3: true).copyWith(
        colorScheme: kColorScheme,
        // Theme for appbar
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: const CardThemeData().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: kColorScheme.onSecondaryContainer,
            fontSize: 16,
          ),
        ),
      ),
      home: const Expenses(),
    ),
  );
}
