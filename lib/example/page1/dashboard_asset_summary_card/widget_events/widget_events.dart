import 'package:event_driven_design/core/event_bus/widget_event_bus/widget_event.dart';

class WidgetEventSetEnableStatus<bool> extends WidgetDataEvent {
  WidgetEventSetEnableStatus({required super.data});
}

class WidgetEventSetText<String> extends WidgetDataEvent {
  WidgetEventSetText({required super.data, super.senderId, super.receiverId});
}
