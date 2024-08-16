import 'dart:async';

import 'package:rxdart/rxdart.dart';

import 'base_event.dart';

abstract class BaseEventBus {
  final BehaviorSubject<BaseEvent> _bus = BehaviorSubject();

  void sendEvent({required BaseEvent event}) {
    _bus.add(event);
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
