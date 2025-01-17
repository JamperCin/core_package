import 'package:flutter/cupertino.dart';

extension TextControllerExt on TextEditingController{

  String getData(){
    return text.trim();
  }

}