import 'package:core_module/core/model/local/base_object.dart';
import 'package:flutter/material.dart';

abstract class BaseImpl extends Widget {
  const BaseImpl({Key? key}) : super(key: key);

  ///Set a new model to this current Page
  void setModel(BaseObject baseObject);

  ///Get the current Model of this page
  BaseObject getModel();

  @override
  Element createElement() {
    // TODO: implement createElement
    throw UnimplementedError();
  }
}
