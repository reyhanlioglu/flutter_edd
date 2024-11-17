import 'package:flutter_edd/flutter_edd.dart';

class WidgetEventSetEnableStatus<bool> extends WidgetDataEvent {
  WidgetEventSetEnableStatus({required super.data});
}

class WidgetEventSetText<String> extends WidgetDataEvent {
  WidgetEventSetText({required super.data, super.senderId, super.receiverId});
}

class WidgetEventCompleteLogin<WidgetId> extends WidgetEvent<WidgetId> {
  WidgetEventCompleteLogin() : super(id: "complete_login" as WidgetId?);

  @override
  WidgetId? get id => "complete_login" as WidgetId?;
}

class WidgetEventNavigateToAccountDetails<WidgetId> extends WidgetEvent<WidgetId> {
  WidgetEventNavigateToAccountDetails() : super(preconditionedEventId: "complete_login" as WidgetId?);
}
