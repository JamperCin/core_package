import 'dart:math';

import 'package:flutter/material.dart';

final Map<String, Color> _namedColors = {
  'Red': Colors.red,
  'Pink': Colors.pink,
  'Purple': Colors.purple,
  'Deep Purple': Colors.deepPurple,
  'Indigo': Colors.indigo,
  'Blue': Colors.blue,
  'Light Blue': Colors.lightBlue,
  'Cyan': Colors.cyan,
  'Teal': Colors.teal,
  'Green': Colors.green,
  'Light Green': Colors.lightGreen,
  'Lime': Colors.lime,
  'Yellow': Colors.yellow,
  'Amber': Colors.amber,
  'Orange': Colors.orange,
  'Deep Orange': Colors.deepOrange,
  'Brown': Colors.brown,
  'Grey': Colors.grey,
  'Blue Grey': Colors.blueGrey,
  'Black': Colors.black,
  'White': Colors.white,
};

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    try {
      final buffer = StringBuffer();
      if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
      buffer.write(hexString.replaceFirst('#', ''));
      return Color(int.parse(buffer.toString(), radix: 16));
    } catch (e) {
      return Colors.white;
    }
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';


  String getClosestColorName() {
    String closestColorName = '';
    double minDistance = double.infinity;

    for (var entry in _namedColors.entries) {
      final namedColor = entry.value;
      double distance = _colorDistance(this, namedColor);
      if (distance < minDistance) {
        minDistance = distance;
        closestColorName = entry.key;
      }
    }

    return closestColorName;
  }

  double _colorDistance(Color c1, Color c2) {
    return sqrt(
      pow(c1.red - c2.red, 2) +
          pow(c1.green - c2.green, 2) +
          pow(c1.blue - c2.blue, 2),
    );
  }

}
