import 'package:equatable/equatable.dart';
import 'package:example/reusable_widgets/expandable_group_with_event_bus/bloc/expandable_group_event.dart';
import 'package:example/reusable_widgets/expandable_group_with_event_bus/expandable_widget/bloc/expandable_v2_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_edd/flutter_edd.dart';
import 'package:uuid/uuid.dart';

part 'expandable_v2_state.dart';

class ExpandableV2Cubit extends Cubit<ExpandableV2State> with EventBusListener {
  final ExpansionTileController? expansionTileController;
  final String? groupId;

  late final _itemId = "$groupId-${const Uuid().v4()}";

  ExpandableV2Cubit({this.expansionTileController, this.groupId}) : super(const ExpandableV2State(isExpanded: false)) {
    _listenCollapseOthersEvent();
  }

  void _listenCollapseOthersEvent() {
    if (groupId == null) {
      return;
    }
    listenEvent<EventBus, ExpandableGroupEventCollapseOthers>(onEventReceived: (event) {
      if (event.data.expandedItemId != _itemId && event.data.groupId.startsWith(groupId!)) {
        _collapse();
      }
    });
  }

  void expand() {
    expansionTileController?.expand();
    sendEvent<EventBus>(
      ExpandableEventExpand(data: ExpandableEventDataExpand(expandedItemId: _itemId, groupId: groupId)),
    );
    emit(const ExpandableV2State(isExpanded: true));
  }

  void _collapse() {
    expansionTileController?.collapse();
    emit(const ExpandableV2State(isExpanded: false));
  }

  @override
  List<BaseEventBus> get eventBuses => [EventBus.instance];
}
