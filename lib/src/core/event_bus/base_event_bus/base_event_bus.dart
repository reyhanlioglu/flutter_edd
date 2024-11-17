import 'dart:async';
import 'dart:collection';

import 'package:flutter_edd/src/core/event_bus/event_bus.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseEventBus {
  final BehaviorSubject<BaseEvent> _bus = BehaviorSubject();

  final Queue<BaseEvent> _asyncEventQueue = ListQueue();

  void sendEvent(BaseEvent event) {
    if (event.preconditionedEventId != null) {
      _asyncEventQueue.add(event);
    } else {
      _bus.add(event);
    }

    final awaitingEvents = _asyncEventQueue.where((element) => element.preconditionedEventId == event.id).toList();
    if (awaitingEvents.isNotEmpty) {
      for (final awaitingEvent in awaitingEvents) {
        _bus.add(awaitingEvent);
        _asyncEventQueue.remove(awaitingEvent);
      }
    }
  }

  StreamSubscription listenEvent<BE extends BaseEvent>({
    required Function() onEventReceived,
    int? senderId,
    int? receiverId,
  }) {
    return _bus.listen((data) {
      if (data.runtimeType == BE && _canListen(data, senderId, receiverId)) {
        onEventReceived();
      }
    });
  }

  StreamSubscription listenDataEvent<BDE extends BaseDataEvent, D>({
    required Function(D eventData) onEventReceived,
    int? senderId,
    int? receiverId,
  }) {
    return _bus.listen((data) {
      if (data.runtimeType == BDE && _canListen(data, senderId, receiverId)) {
        onEventReceived((data as BDE).data as D);
      }
    });
  }

  bool _canListen(data, int? senderId, int? receiverId) {
    return (senderId == null || (data.senderId != null && data.senderId == senderId)) &&
        ((receiverId == null && data.receiverId == null) || (data.receiverId != null && data.receiverId == receiverId));
  }
}
