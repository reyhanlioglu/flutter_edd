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
      _checkForAwaitingEventsPreconditionsMet(event);
      _bus.add(event);
    }
    _processAwaitingEvents(event);
  }

  StreamSubscription listenEvent<BE extends BaseEvent>({
    required Function(BE event) onEventReceived,
    dynamic senderId,
    dynamic receiverId,
  }) {
    return _bus.listen((data) {
      if (data.runtimeType == BE && _canListen(data, senderId, receiverId)) {
        onEventReceived(data as BE);
      }
    });
  }

  StreamSubscription listenDataEvent<BDE extends BaseDataEvent, D>({
    required Function(D eventData) onEventReceived,
    dynamic senderId,
    dynamic receiverId,
  }) {
    return _bus.listen((data) {
      if (data.runtimeType == BDE && _canListen(data, senderId, receiverId)) {
        onEventReceived((data as BDE).data as D);
      }
    });
  }

  bool _canListen(data, dynamic senderId, dynamic receiverId) {
    return (senderId == null || (data.senderId != null && data.senderId == senderId)) &&
        ((receiverId == null && data.receiverId == null) || (data.receiverId != null && data.receiverId == receiverId));
  }

  void _checkForAwaitingEventsPreconditionsMet(BaseEvent event) {
    final awaitingEvents = _asyncEventQueue
        .where((element) => element.preconditionedEventId != null && element.preconditionedEventId == event.id)
        .toList();

    awaitingEvents.forEach((awaitingEvent) => awaitingEvent.setPreconditionsMet(true));
  }

  void _processAwaitingEvents(BaseEvent<dynamic, dynamic> event) {
    bool allAwaitingEventsProcessed = false;

    while (!allAwaitingEventsProcessed) {
      final awaitingEvents = _asyncEventQueue.where(
        (element) {
          return element.preconditionedEventId != null && element.isPreconditionsMet;
        },
      ).toList();

      if (awaitingEvents.isEmpty) {
        allAwaitingEventsProcessed = true;
      } else {
        final awaitingEvent = awaitingEvents.first;
        _checkForAwaitingEventsPreconditionsMet(awaitingEvent);
        _bus.add(awaitingEvent);
        _asyncEventQueue.remove(awaitingEvent);
      }
    }
  }
}
