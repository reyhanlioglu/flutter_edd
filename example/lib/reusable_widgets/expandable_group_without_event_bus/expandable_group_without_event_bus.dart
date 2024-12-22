import 'package:example/reusable_widgets/expandable_group_without_event_bus/expandable_widget/expandable_v1.dart';
import 'package:example/reusable_widgets/expandable_group_without_event_bus/expandable_ui_model.dart';
import 'package:flutter/material.dart';

class ExpandableGroupWithoutEventBus extends StatefulWidget {
  final List<ExpandableUIModel> uiModels;

  const ExpandableGroupWithoutEventBus({super.key, required this.uiModels});

  @override
  State<ExpandableGroupWithoutEventBus> createState() => _ExpandableGroupWithoutEventBusState();
}

class _ExpandableGroupWithoutEventBusState extends State<ExpandableGroupWithoutEventBus> {
  late final controllers = List.generate(widget.uiModels.length, (index) => ExpansionTileController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        for (var i = 0; i < controllers.length; i++)
          ExpandableV1(
            controller: controllers[i],
            uiModel: widget.uiModels[i],
            onExpansionChanged: (isExpanded) {
              if (isExpanded) {
                for (var j = 0; j < controllers.length; j++) {
                  if (j != i) {
                    controllers[j].collapse();
                  }
                }
              }
            },
          ),
      ],
    );
  }
}
