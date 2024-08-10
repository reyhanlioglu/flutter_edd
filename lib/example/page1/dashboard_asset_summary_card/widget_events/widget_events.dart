
import 'package:event_driven_design/core/event_bus/widget_event_bus/widget_event.dart';

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