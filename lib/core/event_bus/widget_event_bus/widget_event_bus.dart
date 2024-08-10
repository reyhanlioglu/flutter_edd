import 'dart:async';


import 'package:event_driven_design/core/event_bus/widget_event_bus/widget_event.dart';
import 'package:event_driven_design/core/event_bus/widget_event_bus/widget_event_data.dart';
import 'package:event_driven_design/core/event_bus/widget_event_bus/widget_event_receiver_id.dart';
import 'package:event_driven_design/core/event_bus/widget_event_bus/widget_event_sender_id.dart';
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


  StreamSubscription listenEvent<E extends WidgetEvent>({
    required Function() onEventReceived,
    WidgetEventSenderId? senderId,
    WidgetEventReceiverId? receiverId,
  }) {
    return _bus.listen((data) {
      if (data.runtimeType == E &&
          (senderId == null || senderId == data.senderId) &&
          (receiverId == null || receiverId == data.receiverId)) {
        onEventReceived();
      }
    });
  }

  StreamSubscription listenDataEvent<E extends WidgetDataEvent, D extends WidgetEventData>({
    required Function(D eventData) onEventReceived,
    WidgetEventSenderId? senderId,
    WidgetEventReceiverId? receiverId,
  }) {
    return _bus.listen((data) {
      if (data.runtimeType == E &&
          (senderId == null || senderId == data.senderId) &&
          (receiverId == null || receiverId == data.receiverId)) {
        onEventReceived((data as E).data as D);
      }
    });
  }
}
