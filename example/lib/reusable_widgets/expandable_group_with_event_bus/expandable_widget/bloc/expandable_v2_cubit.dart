import 'package:equatable/equatable.dart';
import 'package:example/common_events/widget_ids.dart';
import 'package:example/reusable_widgets/expandable_group_with_event_bus/expandable_widget/bloc/expandable_v2_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_edd/flutter_edd.dart';
import 'package:uuid/uuid.dart';

part 'expandable_v2_state.dart';

class ExpandableV2Cubit extends Cubit<ExpandableV2State> with EventBusListener {
  final ExpansionTileController? expansionTileController;
  final widgetId = const Uuid().v4();

  ExpandableV2Cubit({this.expansionTileController}) : super(const ExpandableV2State(isExpanded: false)) {
    listenEvent<EventBus, ExpandableWidgetEventCollapseOthers>(onEventReceived: (event) {
      print('ExpandableV2Cubit: event.senderId: ${event.senderId}, widgetId: $widgetId');
      if (event.senderId != widgetId) {
        _collapse();
      }
    });
  }

  void expand() {
    expansionTileController?.expand();
    sendEvent<EventBus>(ExpandableWidgetEventCollapseOthers(senderId: widgetId));
    emit(const ExpandableV2State(isExpanded: true));
  }

  void _collapse() {
    expansionTileController?.collapse();
    emit(const ExpandableV2State(isExpanded: false));
  }

  @override
  List<BaseEventBus> get eventBuses => [EventBus.instance];
}
