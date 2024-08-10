import 'package:event_driven_design/core/event_bus/widget_event_bus/widget_event_bus.dart';
import 'package:event_driven_design/core/event_bus/widget_event_bus/widget_event_receiver_id.dart';
import 'package:event_driven_design/core/event_bus/widget_event_bus/widget_event_sender_id.dart';

abstract class WidgetEvent {
  final dynamic data;
  final WidgetEventSenderId? senderId;
  final WidgetEventReceiverId? receiverId;

  WidgetEvent({this.data, this.senderId, this.receiverId});
}

extension WidgetEventTypeExtension on WidgetEvent {
  void send() {
    WidgetEventBus.instance.sendEvent(widgetEvent: this);
  }
}
