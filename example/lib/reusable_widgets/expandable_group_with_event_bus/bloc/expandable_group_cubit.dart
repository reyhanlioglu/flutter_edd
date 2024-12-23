import 'package:example/reusable_widgets/expandable_group_with_event_bus/bloc/expandable_group_event.dart';
import 'package:example/reusable_widgets/expandable_group_with_event_bus/expandable_widget/bloc/expandable_v2_event.dart';
import 'package:flutter_edd/flutter_edd.dart';

part 'expandable_group_state.dart';

class ExpandableGroupCubit extends Cubit<ExpandableGroupState> with EventBusListener {
  final String groupId;

  ExpandableGroupCubit({required this.groupId}) : super(ExpandableGroupState()) {
    _listenCollapseOthersEvent();
  }

  void _listenCollapseOthersEvent() {
    listenEvent<EventBus, ExpandableEventExpand>(
      onEventReceived: (event) {
        if (event.data.groupId == groupId) {
          sendEvent<EventBus>(
            ExpandableGroupEventCollapseOthers(
              data: ExpandableGroupEventDataCollapseOthers(
                expandedItemId: event.data.expandedItemId,
                groupId: groupId,
              ),
            ),
          );
        }
      },
    );
  }

  @override
  List<BaseEventBus> get eventBuses => [EventBus.instance];
}
