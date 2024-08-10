import 'package:event_driven_design/core/event_bus/widget_event_bus/widget_event.dart';
import 'package:event_driven_design/core/event_bus/widget_event_bus/widget_event_data.dart';

class WidgetEventButtonSetEnableStatus extends WidgetEvent {
  final bool isEnabled;

  WidgetEventButtonSetEnableStatus(this.isEnabled, {super.senderId, super.receiverId});
}

class WidgetEventButtonSetText extends WidgetEvent {
  final bool isEnabled;

  WidgetEventButtonSetText(this.isEnabled);
}

class WidgetEventTextSetText<WidgetEventTextSetTextData> extends WidgetDataEvent {
  WidgetEventTextSetText({required super.data});
}

class WidgetEventTextSetTextData extends WidgetEventData {
  final String text;

  WidgetEventTextSetTextData(this.text);
}
