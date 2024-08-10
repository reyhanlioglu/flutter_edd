import 'package:event_driven_design/core/event_bus/widget/widget_event_bus.dart';
import 'package:event_driven_design/core/event_bus/widget/widget_event_receiver_id.dart';
import 'package:event_driven_design/core/event_bus/widget/widget_event_sender_id.dart';

sealed class WidgetEvent {
  final dynamic data;
  final WidgetEventSenderId? senderId;
  final WidgetEventReceiverId? receiverId;

  WidgetEvent({this.data, this.senderId, this.receiverId});
}

class WidgetEventButtonSetEnableStatus extends WidgetEvent {
  final bool isEnabled;

  WidgetEventButtonSetEnableStatus(this.isEnabled, {super.senderId, super.receiverId});
}

class WidgetEventButtonSetText extends WidgetEvent {
  final bool isEnabled;

  WidgetEventButtonSetText(this.isEnabled);
}

class WidgetEventTextSetText extends WidgetEvent {

  WidgetEventTextSetText({super.data});
}

extension WidgetEventTypeExtension on WidgetEvent {
  void send() {
    WidgetEventBus.instance.sendEvent(widgetEvent: this);
  }
}
