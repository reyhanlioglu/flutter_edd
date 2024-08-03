import 'package:event_driven_design/core/event_bus/widget/widget_event.dart';
import 'package:event_driven_design/core/event_bus/widget/widget_event_receiver_id.dart';
import 'package:event_driven_design/core/event_bus/widget/widget_event_sender_id.dart';
import 'package:rxdart/rxdart.dart';

class WidgetEventBus {
  WidgetEventBus._();

  static WidgetEventBus instance = WidgetEventBus._();

  final BehaviorSubject _bus = BehaviorSubject<_WidgetEventBusData>();

  void sendEvent({
    required WidgetEvent event,
    dynamic data,
    WidgetEventSenderId? senderId,
    WidgetEventReceiverId? receiverId,
  }) {
    _bus.add(_WidgetEventBusData(event: event, data: data, senderId: senderId, receiverId: receiverId));
  }
}

class _WidgetEventBusData {
  final WidgetEvent event;
  final dynamic data;
  final WidgetEventSenderId? senderId;
  final WidgetEventReceiverId? receiverId;

  _WidgetEventBusData({
    required this.event,
    required this.data,
    required this.senderId,
    required this.receiverId,
  });
}
