import 'package:event_driven_design/core/event_bus/base_event_bus/base_event_bus.dart';

class NavigationEventBus extends BaseEventBus {
  NavigationEventBus._();

  static NavigationEventBus instance = NavigationEventBus._();
}
