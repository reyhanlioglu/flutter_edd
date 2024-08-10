import 'dart:async';

import 'package:event_driven_design/core/event_bus/widget/widget_event_receiver_id.dart';
import 'package:event_driven_design/core/event_bus/widget/widget_event_sender_id.dart';
import 'package:event_driven_design/core/event_bus/widget/widget_event_type.dart';
import 'package:rxdart/rxdart.dart';

class WidgetEventBus {
  WidgetEventBus._();

  static WidgetEventBus instance = WidgetEventBus._();

  final BehaviorSubject<WidgetEvent> _bus = BehaviorSubject();

  void sendEvent({
    required WidgetEvent widgetEvent,
  }) {
    _bus.add(widgetEvent);
  }

  StreamSubscription listenEvent({
    required Type eventType,
    required Function(WidgetEvent event) onEventReceived,
    WidgetEventSenderId? senderId,
    WidgetEventReceiverId? receiverId,
  }) {
    return _bus.listen((data) {
      if (data.runtimeType == eventType &&
          (senderId == null || senderId == data.senderId) &&
          (receiverId == null || receiverId == data.receiverId)) {
        onEventReceived(data);
      }
    });
  }
}
