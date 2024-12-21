import 'package:example/reusable_widgets/expandable_group_without_event_bus/expandable_ui_model.dart';
import 'package:example/reusable_widgets/expandable_group_without_event_bus/expandable_widget/bloc/expandable_v1_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExpandableV1 extends StatelessWidget {
  final ExpandableUIModel uiModel;
  final Function(bool)? onExpansionChanged;
  final ExpansionTileController? controller;

  const ExpandableV1({super.key, required this.uiModel, this.onExpansionChanged, this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExpandableV1Cubit(expansionTileController: controller),
      child: BlocBuilder<ExpandableV1Cubit, ExpandableV1State>(
        builder: (context, state) {
          return Card(
            child: Column(
              children: <Widget>[
                ExpansionTile(
                  controller: controller,
                  title: Text(uiModel.title),
                  trailing: Icon(state.isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down),
                  initiallyExpanded: uiModel.isExpanded,
                  onExpansionChanged: (bool isExpanded) => onExpansionChanged?.call(isExpanded),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                  children: [
                    ListTile(title: Text(uiModel.content)),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
