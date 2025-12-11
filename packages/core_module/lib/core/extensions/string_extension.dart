extension StringExt on String {

  double toDouble() {
    return  double.parse(this);
  }


  String maskNumber({int numberOfLength = 4}) {
    if (length <= numberOfLength) return this;
    return '*' * (length - numberOfLength) + substring(length - numberOfLength);
  }

  String toDecimalPlaces({int dec = 2}) {
    return toDouble().toStringAsFixed(dec);
  }
}
