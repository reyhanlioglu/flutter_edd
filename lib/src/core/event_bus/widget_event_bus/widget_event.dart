import '../base_event_bus/base_event.dart';

abstract class WidgetEvent<WidgetId> extends BaseEvent<WidgetId> {
  WidgetEvent({super.id, super.senderId, super.receiverId, super.preconditionedEventId});
}

abstract class WidgetDataEvent<WidgetData, WidgetId> extends BaseDataEvent<WidgetData, WidgetId> {
  WidgetDataEvent({required super.data, super.id, super.senderId, super.receiverId, super.preconditionedEventId});
}
