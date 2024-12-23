import 'package:example/reusable_widgets/expandable_group_with_event_bus/bloc/expandable_group_cubit.dart';
import 'package:example/reusable_widgets/expandable_group_with_event_bus/expandable_widget/expandable_v2.dart';
import 'package:example/reusable_widgets/expandable_group_without_event_bus/expandable_ui_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

class ExpandableGroupWithEventBus extends StatelessWidget {
  final List<ExpandableUIModel> uiModels;

  ExpandableGroupWithEventBus({required this.uiModels, super.key});

  final String groupId = const Uuid().v1();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExpandableGroupCubit(groupId: groupId),
      child: BlocBuilder<ExpandableGroupCubit, ExpandableGroupState>(
        builder: (context, state) {
          return Column(
            children: uiModels.map((uiModel) => ExpandableV2(uiModel: uiModel, groupId: groupId)).toList(),
          );
        },
      ),
    );
  }
}
