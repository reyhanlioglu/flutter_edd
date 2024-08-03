import 'dart:async';

import 'package:event_driven_design/core/event_bus/widget/widget_event_type.dart';
import 'package:event_driven_design/core/event_bus/widget/widget_event_receiver_id.dart';
import 'package:event_driven_design/core/event_bus/widget/widget_event_sender_id.dart';
import 'package:rxdart/rxdart.dart';

class WidgetEventBus {
  WidgetEventBus._();

  static WidgetEventBus instance = WidgetEventBus._();

  final BehaviorSubject<WidgetEvent> _bus = BehaviorSubject();

  void sendEvent({
    required WidgetEventType eventType,
    dynamic data,
    WidgetEventSenderId? senderId,
    WidgetEventReceiverId? receiverId,
  }) {
    _bus.add(WidgetEvent(type: eventType, data: data, senderId: senderId, receiverId: receiverId));
  }

  StreamSubscription listenEvent({
    required WidgetEventType eventType,
    required Function(WidgetEvent event) onEventReceived,
    WidgetEventSenderId? senderId,
    WidgetEventReceiverId? receiverId,
  }) {
    return _bus.listen((data) {
      if (data.type == eventType &&
          (senderId == null || senderId == data.senderId) &&
          (receiverId == null || receiverId == data.receiverId)) {
        onEventReceived(data);
      }
    });
  }
}

class WidgetEvent {
  final WidgetEventType type;
  final dynamic data;
  final WidgetEventSenderId? senderId;
  final WidgetEventReceiverId? receiverId;

  WidgetEvent({
    required this.type,
    required this.data,
    required this.senderId,
    required this.receiverId,
  });
}
