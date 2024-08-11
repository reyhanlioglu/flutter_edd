import 'dart:async';

import 'package:event_driven_design/core/event_bus/base_event_bus/base_event.dart';
import 'package:event_driven_design/core/event_bus/base_event_bus/base_event_bus.dart';
import 'package:event_driven_design/core/event_bus/widget_event_bus/widget_id.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin EventBusListener<T> on BlocBase<T> {
  final List<StreamSubscription> streamSubscriptionList = [];
  abstract final List<BaseEventBus> eventBuses;

  void listenEvent<B extends BaseEventBus, E extends BaseEvent>({
    required Function() onEventReceived,
    WidgetId? senderId,
    WidgetId? receiverId,
  }) {
    final subscription = eventBuses.firstWhere((bus) => bus is B).listenEvent(
          onEventReceived: onEventReceived,
          senderId: senderId,
          receiverId: receiverId,
        );
    streamSubscriptionList.add(subscription);
  }

  void listenDataEvent<B extends BaseEventBus, E extends BaseDataEvent, D>({
    required Function(D eventData) onEventReceived,
    WidgetId? senderId,
    WidgetId? receiverId,
  }) {
    final subscription = eventBuses.firstWhere((bus) => bus is B).listenDataEvent<E, D>(
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
