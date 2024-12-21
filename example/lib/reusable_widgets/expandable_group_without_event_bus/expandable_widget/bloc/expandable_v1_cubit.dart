import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_edd/flutter_edd.dart';

part 'expandable_v1_state.dart';

class ExpandableV1Cubit extends Cubit<ExpandableV1State> {
  final ExpansionTileController? expansionTileController;

  ExpandableV1Cubit({this.expansionTileController}) : super(const ExpandableV1State(isExpanded: false));


  void toggleExpansion() {
    if (state.isExpanded) {
      collapse();
    } else {
      expand();
    }
  }

  void expand() {
    expansionTileController?.expand();
    emit(const ExpandableV1State(isExpanded: true));
  }

  void collapse() {
    expansionTileController?.collapse();
    emit(const ExpandableV1State(isExpanded: false));

  }
}
