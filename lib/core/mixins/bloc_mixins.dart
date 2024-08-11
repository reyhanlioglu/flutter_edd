import 'dart:async';

import 'package:event_driven_design/core/event_bus/widget_event_bus/widget_event.dart';
import 'package:event_driven_design/core/event_bus/widget_event_bus/widget_event_bus.dart';
import 'package:event_driven_design/core/event_bus/widget_event_bus/widget_id.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin WidgetEventListener<T> on BlocBase<T> {
  final List<StreamSubscription> streamSubscriptionList = [];

  void listenEvent<E extends WidgetEvent>({
    required Function() onEventReceived,
    WidgetId? senderId,
    WidgetId? receiverId,
  }) {
    final subscription = WidgetEventBus.instance.listenEvent(
      onEventReceived: onEventReceived,
      senderId: senderId,
      receiverId: receiverId,
    );
    streamSubscriptionList.add(subscription);
  }

  void listenDataEvent<E extends WidgetDataEvent, D>({
    required Function(D eventData) onEventReceived,
    WidgetId? senderId,
    WidgetId? receiverId,
  }) {
    final subscription = WidgetEventBus.instance.listenDataEvent<E, D>(
      onEventReceived: onEventReceived,
      senderId: senderId,
      receiverId: receiverId,
    );
    streamSubscriptionList.add(subscription);
  }

  @override
  Future<void> close() {
    for (final subscription in streamSubscriptionList) {
      subscription.cancel();
    }
    return super.close();
  }
}
