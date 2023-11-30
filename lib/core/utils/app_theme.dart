

import '../handling_flutter_imports/handling_flutter_imports_screen.dart';

ThemeData appTheme = ThemeData(
  primaryColor: AppColors.primaryColor,
  disabledColor: AppColors.lightGreyColor,
  fontFamily: AppConstants.fontFamily,
  hintColor: AppColors.greyColor,
  useMaterial3: true,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: AppColors.primaryColor,
  ),
  scaffoldBackgroundColor: Colors.white,
  textTheme: _getTextTheme(),
);
TextTheme _getTextTheme() => const TextTheme(
      displayLarge: TextStyle(
        fontSize: 22.0,
        color: AppColors.primaryColor,
      ),
      displayMedium: TextStyle(
        fontSize: 20.0,
        color: AppColors.foreignColor,
      ),
      displaySmall: TextStyle(
        fontSize: 18.0,
        color: AppColors.greyColor,
      ),
      titleMedium: TextStyle(
        fontSize: 16.0,
        color: AppColors.primaryColor,
        height: 1.3,
      ),
      titleSmall: TextStyle(
        fontSize: 10.0,
        color: AppColors.greyColor,
      ),
    );
