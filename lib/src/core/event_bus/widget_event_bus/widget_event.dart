import '../base_event_bus/base_event.dart';

abstract class WidgetEvent<OwnerId, EventId> extends BaseEvent<OwnerId, EventId> {
  WidgetEvent({super.id, super.senderId, super.receiverId, super.preconditionedEventId});
}

abstract class WidgetDataEvent<WidgetData, OwnerId, EventId> extends BaseDataEvent<WidgetData, OwnerId, EventId> {
  WidgetDataEvent({required super.data, super.id, super.senderId, super.receiverId, super.preconditionedEventId});
}
