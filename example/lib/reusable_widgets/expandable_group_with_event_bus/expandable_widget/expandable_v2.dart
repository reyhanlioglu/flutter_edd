import 'package:example/reusable_widgets/expandable_group_with_event_bus/expandable_widget/bloc/expandable_v2_cubit.dart';
import 'package:example/reusable_widgets/expandable_group_without_event_bus/expandable_ui_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExpandableV2 extends StatelessWidget {
  final ExpandableUIModel uiModel;

  const ExpandableV2({super.key, required this.uiModel});

  @override
  Widget build(BuildContext context) {
    final expansionTileController = ExpansionTileController();
    return BlocProvider(
      create: (context) => ExpandableV2Cubit(expansionTileController: expansionTileController),
      child: BlocBuilder<ExpandableV2Cubit, ExpandableV2State>(
        builder: (context, state) {
          return Card(
            child: Column(
              children: <Widget>[
                ExpansionTile(
                  controller: expansionTileController,
                  title: Text(uiModel.title),
                  trailing: Icon(state.isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down),
                  initiallyExpanded: uiModel.isExpanded,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                  onExpansionChanged: (bool isExpanded) {
                    if (isExpanded) {
                      context.read<ExpandableV2Cubit>().expand();
                    }
                  },
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
