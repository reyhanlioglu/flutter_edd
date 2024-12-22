import 'package:flutter_edd/flutter_edd.dart';

class ExpandableGroupEventCollapseOthers
    extends BaseDataEvent<ExpandableGroupEventDataCollapseOthers, dynamic, dynamic> {
  ExpandableGroupEventCollapseOthers({required super.data});
}

class ExpandableGroupEventDataCollapseOthers {
  final String expandedItemId;
  final String groupId;

  ExpandableGroupEventDataCollapseOthers({required this.expandedItemId, required this.groupId});
}
