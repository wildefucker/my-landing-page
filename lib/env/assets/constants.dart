part of '../env.dart';

class Constants {
  static const Curve curve = Curves.easeInOut;
  static const Duration duration = Duration(milliseconds: 300);
  static const double spacing = 20.0;
  static const double drawer = 250.0;
  static ThemeData lightTheme = ThemeData.light(useMaterial3: true).copyWith(
      dividerColor: Colors.transparent,
      textSelectionTheme: TextSelectionThemeData(
          selectionColor: Colors.black.withOpacity(0.15)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          unselectedLabelStyle: TextStyle(fontSize: 10.0, color: Colors.black),
          selectedLabelStyle:
              TextStyle(fontSize: 10.0, color: Color((0xff28213d)))),
      textTheme: TextTheme(
          titleLarge: const TextStyle(
              // fontFamily: Assets.fonts.vigaRegular,
              fontSize: 46.0,
              color: Colors.white),
          titleMedium: const TextStyle(
              // fontFamily: Assets.fonts.vigaRegular,
              fontSize: 18.0,
              color: Colors.white),
          bodyMedium: TextStyle(
              // fontFamily: Assets.fonts.vigaRegular,
              fontSize: 12.0,
              color: Colors.white.withValues(alpha: 0.5)),
          bodySmall: TextStyle(
            fontSize: 11.0,
            color: Colors.white.withValues(alpha: 0.5),
          )),
      colorScheme: const ColorScheme.light(
        error: Color(0xFFBF215A),
        //  primary: Color(0xff0D47A1),
        primary: Colors.black,
        surface: Colors.white, // Replace 'background' with 'surface'
        onPrimary: Colors.white,
        onSurface: Colors.black, // Replace 'onBackground' with 'onSurface'
        outline: Colors.grey,
      ));
}
