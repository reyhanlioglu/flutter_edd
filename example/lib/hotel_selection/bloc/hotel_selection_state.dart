part of 'hotel_selection_cubit.dart';

sealed class HotelSelectionState extends Equatable {
  const HotelSelectionState();
}

class HotelSelectionStateLoading extends HotelSelectionState {
  @override
  List<Object> get props => [];
}

class HotelSelectionStateLoaded extends HotelSelectionState {
  final List<HotelSelectionItemModel> hotels;

  const HotelSelectionStateLoaded({required this.hotels});

  @override
  List<Object> get props => [hotels];
}
