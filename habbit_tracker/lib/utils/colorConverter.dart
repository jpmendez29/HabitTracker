import 'dart:ui';

class ColorConverter {
  static Color convertToColorType(String colorString) {
    int colorValue = int.parse(colorString.substring(2),
        radix: 16); // Convertir cadena hexadecimal a entero
    Color color = Color(colorValue); // Convertir entero a objeto Color
    return color;
  }

  static String convertToStringType(Color color) {
    String colorString =
        '0x' + color.value.toRadixString(16).padLeft(8, '0').toUpperCase();
    return colorString;
  }
}
