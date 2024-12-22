import 'package:example/reusable_widgets/expandable_group_without_event_bus/expandable_ui_model.dart';
import 'package:flutter/material.dart';

class ExpandableV1 extends StatefulWidget {
  final ExpandableUIModel uiModel;
  final Function(bool)? onExpansionChanged;
  final ExpansionTileController controller;

  const ExpandableV1({super.key, required this.uiModel, required this.controller, this.onExpansionChanged});

  @override
  State<ExpandableV1> createState() => _ExpandableV1State();
}

class _ExpandableV1State extends State<ExpandableV1> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          ExpansionTile(
            controller: widget.controller,
            title: Text(widget.uiModel.title),
            trailing: Icon(isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down),
            initiallyExpanded: widget.uiModel.isExpanded,
            onExpansionChanged: (bool isExpanded) {
              widget.onExpansionChanged?.call(isExpanded);
              setState(() => this.isExpanded = isExpanded);
            },
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
            children: [
              ListTile(title: Text(widget.uiModel.content)),
            ],
          ),
        ],
      ),
    );
  }
}
