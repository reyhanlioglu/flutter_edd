import 'package:flutter_edd/flutter_edd.dart';

class WidgetEventSetEnableStatus<bool> extends WidgetDataEvent {
  WidgetEventSetEnableStatus({required super.data});
}

class WidgetEventSetText<String> extends WidgetDataEvent {
  WidgetEventSetText({required super.data, super.senderId, super.receiverId});
}
