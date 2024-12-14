import 'package:example/dashboard/widgets/search_hotel_card/bloc/search_hotel_card_event.dart';
import 'package:example/common_events/event_ids.dart';
import 'package:flutter_edd/flutter_edd.dart';

class ProcessHotelSuggestionDeepLinkEventUseCase {
  void call(Map<String, dynamic> data) {
    final String? city = data['city'];
    final String? startDate = data['startDate'];
    final String? endDate = data['endDate'];
    final int? numberOfPeople = data['numberOfPeople'];

    WidgetEventBus.instance
      ..sendEvent(SearchHotelCardEventSearchHotels(preconditionedEventId: EventId.searchHotelCardEventAutofillFields))
      ..sendEvent(
        SearchHotelCardEventAutofillFields(
          data: SearchHotelCardEventDataAutofillFields(
            city: city,
            startEndDate: "$startDate - $endDate",
            numberOfPeople: numberOfPeople,
          ),
        ),
      );
  }
}
