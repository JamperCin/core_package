extension StringExtension on String {

  double toDouble() {
    return  double.parse(this);
  }


  String maskNumber({int numberOfLength = 4}) {
    if (length <= numberOfLength) return this;
    return '*' * (length - numberOfLength) + substring(length - numberOfLength);
  }

}
