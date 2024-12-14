import 'package:example/dashboard/widgets/search_hotel_card/bloc/search_hotel_card_event.dart';
import 'package:example/common_events/event_ids.dart';
import 'package:example/hotel_selection/widgets/hotel_selection_item_widget/event_bus/hotel_selection_item_bus_data_models.dart';
import 'package:example/hotel_selection/widgets/hotel_selection_item_widget/event_bus/hotel_selection_item_bus_events.dart';
import 'package:flutter_edd/flutter_edd.dart';

class ProcessHotelSuggestionDeepLinkEventUseCase {
  void call(Map<String, dynamic> data) {
    final String? city = data['city'];
    final String? startDate = data['startDate'];
    final String? endDate = data['endDate'];
    final int? numberOfPeople = data['numberOfPeople'];
    final int hotelId = int.parse(data['suggestedHotelId'] ?? "");

    WidgetEventBus.instance
      ..sendEvent(SearchHotelCardEventSearchHotels(preconditionedEventId: EventId.searchHotelCardEventAutofillFields))
      ..sendEvent(
        SearchHotelCardEventAutofillFields(
          id: EventId.searchHotelCardEventAutofillFields,
          data: SearchHotelCardEventDataAutofillFields(
            city: city,
            startEndDate: "$startDate - $endDate",
            numberOfPeople: numberOfPeople,
          ),
        ),
      )
      ..sendEvent(
        HotelSelectionItemHighlightForSuggestionBusEvent(
          preconditionedEventId: EventId.displayPageHotelSelection,
          data: HotelSelectionItemHighlightForSuggestionBusEventData(hotelId: hotelId),
        ),
      );
  }
}
