import 'package:equatable/equatable.dart';
import 'package:example/core/navigation/navigation_listener_event.dart';
import 'package:example/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_edd/flutter_edd.dart';

part 'navigation_listener_state.dart';

class NavigationListenerCubit extends Cubit<NavigationListenerState> with EventBusListener {
  NavigationListenerCubit() : super(const NavigationListenerState()) {
    _listenEventBus();
  }

  _listenEventBus() {
    listenEvent<EventBus, NavigationEvent>(onEventReceived: _handleNavigationEvent);
  }

  void _handleNavigationEvent(NavigationEvent event) {
    final navigationType = event.data.navigationType;
    switch (navigationType) {
      case NavigationTypePush():
        globalNavigatorKey.currentState?.pushNamed(navigationType.path, arguments: navigationType.arguments);

      case NavigationTypePop():
        globalNavigatorKey.currentState?.pop(navigationType.result);

      case NavigationTypePopUntil():
        globalNavigatorKey.currentState?.popUntil(ModalRoute.withName(navigationType.path));

      case NavigationTypePushReplacement():
        globalNavigatorKey.currentState?.pushReplacementNamed(navigationType.path);

      case NavigationTypePushAndRemoveUntil():
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
