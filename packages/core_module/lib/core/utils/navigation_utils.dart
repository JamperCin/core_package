import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:core_module/core/model/local/base_object.dart';
import 'package:core_module/core_ui/base_screen/base_impl.dart';
import 'package:core_module/core_ui/base_screen/base_screen_impl.dart';

class NavUtils {
  static NavUtils? _navUtils;
  final String? loginScreen;
  final String? homePage;

  NavUtils._({this.loginScreen, this.homePage});

  factory NavUtils({String? loginScreen, String? homePage}) {
    return _navUtils ??= NavUtils._(
      loginScreen: loginScreen,
      homePage: homePage,
    );
  }

  void fireEvent(Event event) {
    //iterate through the event action
    switch (event.action ?? EventAction.NAV_TO) {
      case EventAction.LOG_OUT:
        if (loginScreen != null) {
          Get.offAllNamed('/$loginScreen', arguments: event.model);
        }
        break;
      case EventAction.NAV_TO:
        if (event.target != null) {
          Get.to(
            () => event.target!,
            preventDuplicates: false,
            routeName: '${event.target?.toStringShort()}',
            transition: event.transition ?? Transition.cupertino,
            arguments: event.model,
          )?.then((value) {
            if (event.call != null) {
              event.call!();
            }
          });
        } else {
          // SnackBarApi.snackBarInfo("No target defined");
        }
        break;
      case EventAction.BACK:
        if (event.target == null) {
          Get.back();
        } else {
          Get.until((route) =>
              Get.currentRoute == '/${event.target?.toStringShort()}');
        }
        break;
      case EventAction.NAV_HOME:
        if (homePage != null) {
          Get.offAllNamed('/$homePage',arguments: event.model);
        }
        break;
      case EventAction.NAV_OFF:
        if (event.target != null) {
          Get.offAll(() => event.target!, arguments: event.model);
        } else {
          // SnackBarApi.snackBarInfo("No target defined");
        }
        break;
      case EventAction.SUCCESS:
        // // if (event.model == null) {
        // //   event.setModel(SuccessModel());
        // // }
        // event.setTarget(SuccessScreen());
        //
        // SuccessModel model = event.model as SuccessModel;
        // if (model.clearMemory) {
        //   Get.offAll(
        //     () => event.target!,
        //     routeName: '${event.target?.toStringShort()}',
        //   );
        // } else {
        //   Get.to(
        //     () => event.target!,
        //     routeName: '${event.target?.toStringShort()}',
        //   );
        // }

        break;
    }

    if (event.target != null) {
      event.target!.setModel(event.model ?? BaseObject());
    }
  }

  fireSuccess() {
    fireEvent(Event(action: EventAction.SUCCESS));
  }

  void fire(
      {BaseImpl? target,
      EventAction? action,
      BaseObject? model,
      Function? call}) {
    fireEvent(Event(target: target, model: model, action: action, call: call));
  }

  fireTarget(
    BaseImpl? target, {
    BaseObject? model,
    Function? call,
    Transition? trans,
  }) {
    fireEvent(Event(
      target: target,
      model: model,
      call: call,
      transition: trans,
    ));
  }

  void fireTargetHome({BaseObject? model}) {
    fireEvent(Event(
      target: null,
      model: model,
      action: EventAction.NAV_HOME,
    ));
  }

  void fireLogOut() {
    fireEvent(Event(
      target: null,
      action: EventAction.LOG_OUT,
    ));
  }

  void fireTargetOff(BaseImpl? target, {BaseObject? model}) {
    fireEvent(Event(target: target, model: model, action: EventAction.NAV_OFF));
  }

  void fireAction(EventAction action) {
    fireEvent(Event(action: action));
  }

  void fireBack() {
    fireAction(EventAction.BACK);
  }
}

class Event {
  BaseImpl? target;
  EventAction? action;
  BaseObject? model;
  Function? call;
  Transition? transition;

  Event({this.action, this.target, this.model, this.call, this.transition});

  void setTarget(BaseScreenImpl target) {
    this.target = target;
  }

  void setModel(BaseObject model) {
    this.model = model;
  }
}

enum EventAction {
  LOG_OUT,
  NAV_TO,
  BACK,
  NAV_HOME,
  NAV_OFF,
  SUCCESS,
}
