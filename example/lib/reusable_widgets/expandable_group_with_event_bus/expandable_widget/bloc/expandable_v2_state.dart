part of 'expandable_v2_cubit.dart';


class ExpandableV2State extends Equatable {
  final bool isExpanded;

  const ExpandableV2State({required this.isExpanded});

  @override
  List<Object> get props => [isExpanded];
}
