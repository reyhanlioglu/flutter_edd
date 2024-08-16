import '../base_event_bus/base_event_bus.dart';

class WidgetEventBus extends BaseEventBus {
  WidgetEventBus._();

  static WidgetEventBus instance = WidgetEventBus._();
}
