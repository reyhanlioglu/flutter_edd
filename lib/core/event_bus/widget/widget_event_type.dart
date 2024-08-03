import 'package:event_driven_design/core/event_bus/widget/widget_event_bus.dart';
import 'package:event_driven_design/core/event_bus/widget/widget_event_receiver_id.dart';
import 'package:event_driven_design/core/event_bus/widget/widget_event_sender_id.dart';

enum WidgetEventType {
  buttonSetEnableStatus,
  buttonSetText,
  textFormFieldSetInputText,
  textSetText,
  ;
}

extension WidgetEventTypeExtension on WidgetEventType {
  void send({
    dynamic data,
    WidgetEventSenderId? senderId,
    WidgetEventReceiverId? receiverId,
  }) {
    WidgetEventBus.instance.sendEvent(eventType: this, data: data, senderId: senderId, receiverId: receiverId);
  }
}
