import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../event_bus/base_event_bus/base_event.dart';
import '../event_bus/base_event_bus/base_event_bus.dart';

mixin EventBusListener<T> on BlocBase<T> {
  final List<StreamSubscription> streamSubscriptionList = [];
  abstract final List<BaseEventBus> eventBuses;

  void sendEvent<B extends BaseEventBus>(BaseEvent event) {
    eventBuses.firstWhere((bus) => bus is B).sendEvent(event: event);
  }

  void listenEvent<B extends BaseEventBus, E extends BaseEvent>({
    required Function() onEventReceived,
    int? senderId,
    int? receiverId,
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
    int? senderId,
    int? receiverId,
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
