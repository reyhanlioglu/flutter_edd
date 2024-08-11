import 'package:event_driven_design/core/event_bus/base_event_bus/base_event_bus.dart';

class WidgetEventBus extends BaseEventBus {
  WidgetEventBus._();

  static WidgetEventBus instance = WidgetEventBus._();
}
