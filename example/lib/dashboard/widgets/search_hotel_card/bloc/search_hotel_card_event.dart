import 'package:example/common_events/event_ids.dart';
import 'package:flutter_edd/flutter_edd.dart';

class SearchHotelCardEventAutofillFields
    extends WidgetDataEvent<SearchHotelCardEventDataAutofillFields, dynamic, EventId> {
  SearchHotelCardEventAutofillFields({
    required super.data,
    super.id = EventId.searchHotelCardEventAutofillFields,
    super.preconditionedEventId = EventId.displayWidgetSearchHotelCard,
  });
}

class SearchHotelCardEventDataAutofillFields {
  final String? city;
  final String? startEndDate;
  final int? numberOfPeople;

  SearchHotelCardEventDataAutofillFields({
    this.city,
    this.startEndDate,
    this.numberOfPeople,
  });
}

class SearchHotelCardEventSearchHotels extends WidgetEvent<dynamic, EventId> {
  SearchHotelCardEventSearchHotels({super.preconditionedEventId});
}
