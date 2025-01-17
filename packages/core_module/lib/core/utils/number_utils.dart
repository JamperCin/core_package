import 'package:flutter/material.dart';
import 'package:core_module/core/extensions/double_extension.dart';

class NumberUtils {
  static NumberUtils? _utils;

  NumberUtils._();

  factory NumberUtils() {
    return _utils ??= NumberUtils._();
  }

  String calcDiscountPercent(double price, double discount) {
    if (price == 0 || discount == 0) {
      return "0";
    }

    double percent = (discount / price) * 100;
    print("percent == $percent");
    return percent.toDecimalPlaces(dec: 0);
  }

  ///Parse money
  String parseIntMoney(String source) {
    int value = 0;
    try {
      if (!source.contains(".")) {
        value = parseInt(source);
      } else {
        int index = source.indexOf(".");
        String temp = source.replaceAll(".", "");
        value = parseInt(temp);

        if (value == 0) {
          //return "0";
        }

        print("SRC $source == IND $index == TEM $temp == VSL $value");

        List<String> list = temp.split("");
        int i = 0;
        temp = "";
        for (String str in list) {
          temp = temp + str;
          if (i == index - 1) {
            temp = temp + ".";
          }
          i++;
        }
        return temp;
      }
    } catch (e) {
      print("Error $e");
    }
    return "$value";
  }

  String moneyCurrencyFormat(dynamic price,
      {int dec = 0, String currency = "GHS"}) {
    if (price is String) {
      return "$currency ${moneyFormat(price, decPlace: dec)}";
    }

    if (price is double) {
      return "$currency ${moneyFormatDouble(price, decPlace: dec)}";
    }

    return "$currency 0.00";
  }

  String moneyFormat(dynamic price, {int decPlace = 0}) {
    if (price == null || (price is String && price.isEmpty)) {
      return "0.00";
    }

    if (price is double) {
      return moneyFormatDouble(price, decPlace: decPlace);
    }

    var value = price;
    double p = parseDouble(price);
    value = p.toStringAsFixed(decPlace);

    if (price.length > 2) {
      value = value.replaceAll(RegExp(r'\.D'), '');
      value = value.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ',');
      return value;
    }
    return value;
  }

  String moneyFormatDouble(double? price, {int decPlace = 0}) {
    if (price == null) {
      return "0.00";
    }

    try {
      var value = price.toStringAsFixed(decPlace);

      if (price.toString().length > 2) {
        value = value.replaceAll(RegExp(r'\.D'), '');
        value = value.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ',');
        return value;
      }
      return value;
    } catch (e) {
      debugPrint("Format ==> $e");
      return "0.00";
    }
  }

  double parseDouble(String amount) {
    double value = 0.0;
    try {
      value = amount.isEmpty ? 0.0 : double.parse(amount);
    } catch (e) {
      print("Error -- $amount ==> $e");
    }
    return value;
  }

  int parseInt(String source) {
    int value = 0;
    try {
      value = int.parse(source);
    } catch (e) {
      print("Error $e");
    }
    return value;
  }

  String cleanPhoneNumber(String phone) {
    return phone.trim().replaceAll("+", "").replaceAll(" ", "");
  }

  void formatPhone(String phone, String code, Function(String) call) {
    // try {
    //   PhoneNumberUtil().parse(phone, regionCode: code).then((value) {
    //     PhoneNumber p = value;
    //     call(p.e164);
    //   });
    // } catch (e) {
    //   call("");
    // }
  }

  void validatePhone(String phone, String code, Function(bool) call) {
    // try {
    //   PhoneNumberUtil phoneUtil = PhoneNumberUtil();
    //   phoneUtil.validate(phone, regionCode: code).then((value) {
    //     call(value);
    //   });
    // } catch (e) {
    //   call(false);
    // }
  }

  // void pickCountryCode(BuildContext c, Function(CountryModel) call) {
  //   showCountryPicker(
  //     context: c,
  //     showPhoneCode: true,
  //     onSelect: (Country c) {
  //       call(CountryModel(
  //         name: c.name,
  //         codeName: c.countryCode,
  //         codeNumber: c.phoneCode,
  //       ));
  //     },
  //   );
  // }

  String getCurrencyAmount(Object amnt,
      {int dec = 0, String currency = "GHS"}) {
    String amount = amnt is String
        ? amnt
        : amnt is double
            ? amnt.toString()
            : "0";
    return "$currency ${moneyFormat(amount, decPlace: dec)}";
  }

  String parseString(double val) {
    try {
      return val.toString();
    } catch (e) {
      return "";
    }
  }
}
