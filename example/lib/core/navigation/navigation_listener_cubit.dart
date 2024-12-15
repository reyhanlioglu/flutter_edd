import 'package:equatable/equatable.dart';
import 'package:example/core/navigation/navigation_listener_event.dart';
import 'package:example/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_edd/flutter_edd.dart';

part 'navigation_listener_state.dart';

class NavigationListenerCubit extends Cubit<NavigationListenerState> with EventBusListener {
  NavigationListenerCubit() : super(const NavigationListenerState()) {
    _listenWidgetEventBus();
  }

  _listenWidgetEventBus() {
    listenDataEvent<EventBus, NavigationEvent, NavigationEventData>(onEventReceived: _handleNavigationEvent);
  }

  void _handleNavigationEvent(NavigationEventData data) {
    switch (data.navigationType) {
      case NavigationTypePush():
        final navigationType = data.navigationType as NavigationTypePush;
        globalNavigatorKey.currentState?.pushNamed(navigationType.path, arguments: navigationType.arguments);

      case NavigationTypePop():
        final navigationType = data.navigationType as NavigationTypePop;
        globalNavigatorKey.currentState?.pop(navigationType.result);

      case NavigationTypePopUntil():
        final navigationType = data.navigationType as NavigationTypePopUntil;
        globalNavigatorKey.currentState?.popUntil(ModalRoute.withName(navigationType.path));

      case NavigationTypePushReplacement():
        final navigationType = data.navigationType as NavigationTypePushReplacement;
        globalNavigatorKey.currentState?.pushReplacementNamed(navigationType.path);

      case NavigationTypePushAndRemoveUntil():
        final navigationType = data.navigationType as NavigationTypePushAndRemoveUntil;
        globalNavigatorKey.currentState?.pushNamedAndRemoveUntil(
          navigationType.newRouteName,
          navigationType.predicate,
          arguments: navigationType.arguments,
        );
    }
  }

  @override
  List<BaseEventBus> get eventBuses => [EventBus.instance];
}
