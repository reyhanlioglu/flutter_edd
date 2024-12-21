part of 'expandable_v1_cubit.dart';


class ExpandableV1State extends Equatable {
  final bool isExpanded;

  const ExpandableV1State({required this.isExpanded});

  @override
  List<Object> get props => [isExpanded];
}
