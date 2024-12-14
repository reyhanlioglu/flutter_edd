import 'package:example/widget_events/event_ids.dart';
import 'package:flutter/material.dart';
import 'package:flutter_edd/flutter_edd.dart';

class NavigationEvent extends WidgetDataEvent<NavigationEventData, dynamic, EventId> {
  NavigationEvent({
    required super.data,
    super.preconditionedEventId,
  });
}

class NavigationEventData {
  final NavigationType navigationType;

  NavigationEventData({required this.navigationType});
}

sealed class NavigationType {
  const NavigationType();
}

class NavigationTypePush extends NavigationType {
  final String path;
  final Object? arguments;

  const NavigationTypePush({required this.path, this.arguments});
}

class NavigationTypePop extends NavigationType {
  final Object? result;

  const NavigationTypePop({this.result});
}

class NavigationTypePopUntil extends NavigationType {
  final String path;

  const NavigationTypePopUntil({required this.path});
}

class NavigationTypePushReplacement extends NavigationType {
  final String path;

  const NavigationTypePushReplacement({required this.path});
}

class NavigationTypePushAndRemoveUntil extends NavigationType {
  final String newRouteName;
  final RoutePredicate predicate;
  final Object? arguments;

  const NavigationTypePushAndRemoveUntil({
    required this.newRouteName,
    required this.predicate,
    this.arguments,
  });
}
