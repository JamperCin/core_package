extension DoubleExtension on double {
  String toDecimalPlaces({int dec = 2}) {
    return toStringAsFixed(dec);
  }
}
