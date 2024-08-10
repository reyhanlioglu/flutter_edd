import 'dart:async';

import 'package:event_driven_design/core/event_bus/widget/widget_event_type.dart';
import 'package:event_driven_design/core/event_bus/widget/widget_event_bus.dart';
import 'package:event_driven_design/core/event_bus/widget/widget_event_receiver_id.dart';
import 'package:event_driven_design/core/event_bus/widget/widget_event_sender_id.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin WidgetEventListener<T> on Cubit<T> {
  final List<StreamSubscription> streamSubscriptionList = [];

  void listenEvent({
    required Type eventType,
    required Function(WidgetEvent event) onEventReceived,
    WidgetEventSenderId? senderId,
    WidgetEventReceiverId? receiverId,
  }) {
    final subscription = WidgetEventBus.instance.listenEvent(
      eventType: eventType,
      onEventReceived: onEventReceived,
      senderId: senderId,
      receiverId: receiverId,
    );
    streamSubscriptionList.add(subscription);
  }

  @override
  Future<void> close() {
    for (final subscription in streamSubscriptionList) {
      subscription.cancel();
    }
    return super.close();
  }
}
