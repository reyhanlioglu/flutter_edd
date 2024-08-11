import 'package:event_driven_design/core/event_bus/base_event_bus/base_event.dart';
import 'package:event_driven_design/core/event_bus/widget_event_bus/widget_event_bus.dart';

abstract class WidgetEvent<WidgetId> extends BaseEvent<WidgetId> {
  WidgetEvent({super.senderId, super.receiverId});
}

abstract class WidgetDataEvent<WidgetData, WidgetId> extends BaseDataEvent<WidgetData, WidgetId> {
  WidgetDataEvent({required super.data, super.senderId, super.receiverId});
}

extension WidgetEventExtension on WidgetEvent {
  void send() {
    WidgetEventBus.instance.sendEvent(event: this);
  }
}

extension WidgetDataEventExtension on WidgetDataEvent {
  void send() {
    WidgetEventBus.instance.sendEvent(event: this);
  }
}
