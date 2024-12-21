import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_edd/flutter_edd.dart';

part 'expandable_v1_state.dart';

class ExpandableV1Cubit extends Cubit<ExpandableV1State> {
  final ExpansionTileController? expansionTileController;

  ExpandableV1Cubit({this.expansionTileController}) : super(const ExpandableV1State(isExpanded: false));


  void toggleExpansion() {
    final newState = !state.isExpanded;
    if (newState) {
      expansionTileController?.expand();
    } else {
      expansionTileController?.collapse();
    }
    emit(ExpandableV1State(isExpanded: newState));
  }

  void expand() {
    emit(const ExpandableV1State(isExpanded: true));
  }

  void collapse() {
    emit(const ExpandableV1State(isExpanded: false));

  }
}
