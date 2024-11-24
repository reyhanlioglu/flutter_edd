part of 'hotel_selection_item_cubit.dart';

class HotelSelectionItemState {
  final bool isHighlighted;

  HotelSelectionItemState({required this.isHighlighted});

  HotelSelectionItemState copyWith({
    bool? isHighlighted,
  }) {
    return HotelSelectionItemState(
      isHighlighted: isHighlighted ?? this.isHighlighted,
    );
  }
}

