import 'package:core_module/core/def/global_def.dart';

extension IntExtension on int{

  double dp(){
    return appDimen.dimen(toDouble());
  }
}