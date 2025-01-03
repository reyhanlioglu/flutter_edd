import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:flutter_edd/src/core/event_bus/base_event_bus/base_event.dart';
import 'package:flutter_edd/src/core/event_bus/base_event_bus/base_event_bus.dart';

mixin EventBusListener<T> on BlocBase<T> {
  final List<StreamSubscription> streamSubscriptionList = [];
  abstract final List<BaseEventBus> eventBuses;

  void sendEvent<B extends BaseEventBus>(BaseEvent event) {
    eventBuses.firstWhere((bus) => bus is B).sendEvent(event);
  }

  void listenEvent<B extends BaseEventBus, E extends BaseEvent>({
    required Function(E event) onEventReceived,
    dynamic senderId,
    dynamic receiverId,
  }) {
    final subscription = eventBuses.firstWhere((bus) => bus is B).listenEvent<E>(
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
