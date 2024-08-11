import 'dart:async';

import 'package:event_driven_design/core/event_bus/base_event_bus/base_event.dart';
import 'package:event_driven_design/core/event_bus/widget_event_bus/widget_id.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseEventBus<E extends BaseEvent> {
  final BehaviorSubject<E> _bus = BehaviorSubject();

  void sendEvent({required E event}) {
    _bus.add(event);
  }

  StreamSubscription listenEvent({
    required Function() onEventReceived,
    WidgetId? senderId,
    WidgetId? receiverId,
  }) {
    return _bus.listen((data) {
      if (data.runtimeType == E &&
          (senderId == null || senderId == data.senderId) &&
          (receiverId == null || receiverId == data.receiverId)) {
        onEventReceived();
      }
    });
  }

  StreamSubscription listenDataEvent<DE extends BaseDataEvent, D>({
    required Function(D eventData) onEventReceived,
    WidgetId? senderId,
    WidgetId? receiverId,
  }) {
    return _bus.listen((data) {
      if (data.runtimeType == DE &&
          (senderId == null || senderId == data.senderId) &&
          (receiverId == null || receiverId == data.receiverId)) {
        onEventReceived((data as DE).data as D);
      }
    });
  }
}
