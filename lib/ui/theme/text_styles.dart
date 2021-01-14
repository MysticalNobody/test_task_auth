part of 'theme.dart';

class AppStyles {
  static TextStyle _create({
    double fontSize = 14,
    AppFontWeight fontWeight = AppFontWeight.regular,
    Color color = AppColors.text,
    double height = 1.0,
  }) =>
      TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight.convert(),
        color: color,
        height: height,
      );

  static TextStyle text = _create();
  static TextStyle title = _create(fontSize: 16, fontWeight: AppFontWeight.medium);
}
