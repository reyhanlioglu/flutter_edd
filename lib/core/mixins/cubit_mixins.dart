import 'dart:async';

import 'package:event_driven_design/core/event_bus/widget_event_bus/widget_event.dart';
import 'package:event_driven_design/core/event_bus/widget_event_bus/widget_event_bus.dart';
import 'package:event_driven_design/core/event_bus/widget_event_bus/widget_event_receiver_id.dart';
import 'package:event_driven_design/core/event_bus/widget_event_bus/widget_event_sender_id.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin WidgetEventListener<T> on Cubit<T> {
  final List<StreamSubscription> streamSubscriptionList = [];

  void listenEvent<E extends WidgetEvent>({
    required Function() onEventReceived,
    WidgetEventSenderId? senderId,
    WidgetEventReceiverId? receiverId,
  }) {
    final subscription = WidgetEventBus.instance.listenEvent<E>(
      onEventReceived: onEventReceived,
      senderId: senderId,
      receiverId: receiverId,
    );
    streamSubscriptionList.add(subscription);
  }

  void listenDataEvent<E extends WidgetDataEvent, D>({
    required Function(D eventData) onEventReceived,
    WidgetEventSenderId? senderId,
    WidgetEventReceiverId? receiverId,
  }) {
    final subscription = WidgetEventBus.instance.listenDataEvent<E, D>(
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
