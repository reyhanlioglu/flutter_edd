import 'package:flutter_edd/src/core/event_bus/base_event_bus/base_event_bus.dart';

class EventBus extends BaseEventBus {
  EventBus._();

  static EventBus instance = EventBus._();
}
