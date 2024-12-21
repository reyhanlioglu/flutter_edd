import 'package:example/reusable_widgets/expandable_group_with_event_bus/expandable_widget/expandable_v2.dart';
import 'package:example/reusable_widgets/expandable_group_without_event_bus/expandable_ui_model.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class ExpandableGroupWithEventBus extends StatelessWidget {
  final List<ExpandableUIModel> uiModels;

  const ExpandableGroupWithEventBus({super.key, required this.uiModels});

  @override
  Widget build(BuildContext context) {
    final groupId = const Uuid().v1();
    return Column(
      children: uiModels.map((uiModel) => ExpandableV2(uiModel: uiModel, groupId: groupId)).toList(),
    );
  }
}