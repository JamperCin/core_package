import 'package:core_module/core/def/global_def.dart';

extension IntExt on int{

  double dp(){
    return appDimen.dimen(toDouble());
  }
}