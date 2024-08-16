import '../base_event_bus/base_event.dart';

abstract class WidgetEvent<WidgetId> extends BaseEvent<WidgetId> {
  WidgetEvent({super.senderId, super.receiverId});
}

abstract class WidgetDataEvent<WidgetData, WidgetId> extends BaseDataEvent<WidgetData, WidgetId> {
  WidgetDataEvent({required super.data, super.senderId, super.receiverId});
}
