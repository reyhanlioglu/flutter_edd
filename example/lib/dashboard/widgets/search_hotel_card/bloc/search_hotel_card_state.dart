part of 'search_hotel_card_cubit.dart';

class SearchHotelCardState extends Equatable {
  final String? city;
  final String? startEndDate;
  final int? numberOfPeople;

  const SearchHotelCardState({this.city, this.startEndDate, this.numberOfPeople});

  @override
  List<Object?> get props => [city, startEndDate, numberOfPeople];

  SearchHotelCardState copyWith({
    String? city,
    String? startEndDate,
    int? numberOfPeople,
  }) {
    return SearchHotelCardState(
      city: city ?? this.city,
      startEndDate: startEndDate ?? this.startEndDate,
      numberOfPeople: numberOfPeople ?? this.numberOfPeople,
    );
  }
}
