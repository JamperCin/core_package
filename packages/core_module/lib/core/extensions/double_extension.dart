import 'package:core_module/core/def/global_def.dart';

extension DoubleExt on double {
  String toDecimalPlaces({int dec = 2}) {
    return toStringAsFixed(dec);
  }

  double dp(){
    return appDimen.dimen(this);
  }


}
