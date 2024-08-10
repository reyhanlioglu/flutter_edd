import 'package:event_driven_design/core/event_bus/widget_event_bus/widget_event_bus.dart';
import 'package:event_driven_design/core/event_bus/widget_event_bus/widget_event_data.dart';
import 'package:event_driven_design/core/event_bus/widget_event_bus/widget_event_receiver_id.dart';
import 'package:event_driven_design/core/event_bus/widget_event_bus/widget_event_sender_id.dart';

abstract class WidgetEvent<T extends WidgetEventData> {
  final WidgetEventSenderId? senderId;
  final WidgetEventReceiverId? receiverId;

  WidgetEvent({this.senderId, this.receiverId});
}

abstract class WidgetDataEvent<T extends WidgetEventData> extends WidgetEvent<T> {
  final T data;

  WidgetDataEvent({required this.data, super.senderId, super.receiverId});
}

extension WidgetEventTypeExtension on WidgetEvent {
  void send() {
    WidgetEventBus.instance.sendEvent(widgetEvent: this);
  }
}
