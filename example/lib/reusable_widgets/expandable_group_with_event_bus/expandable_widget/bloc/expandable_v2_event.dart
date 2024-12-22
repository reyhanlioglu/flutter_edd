import 'package:flutter_edd/flutter_edd.dart';

class ExpandableEventExpand extends BaseDataEvent<ExpandableEventDataExpand, dynamic, dynamic> {
  ExpandableEventExpand({required super.data});
}

class ExpandableEventDataExpand {
  final String expandedItemId;
  final String? groupId;

  ExpandableEventDataExpand({required this.expandedItemId, this.groupId});
}
