import 'package:example/common_events/event_ids.dart';
import 'package:example/dashboard/widgets/search_hotel_card/bloc/search_hotel_card_event.dart';
import 'package:example/hotel_selection/widgets/hotel_selection_item_widget/bloc/hotel_selection_item_event.dart';
import 'package:example/personal_information/bloc/personal_information_event.dart';
import 'package:flutter_edd/flutter_edd.dart';

class ProcessHotelSuggestionDeepLinkEventUseCase {
  void call(Map<String, dynamic> data) {
    final String? city = data['city'];
    final String? startDate = data['startDate'];
    final String? endDate = data['endDate'];
    final int? numberOfPeople = data['numberOfPeople'];
    final int hotelId = int.parse(data['suggestedHotelId'] ?? "");
    final String? fullName = data['fullName'];
    final String? email = data['email'];
    final String? phoneNumber = data['phoneNumber'];

    EventBus.instance
      ..sendEvent(SearchHotelCardEventSearchHotels(preconditionedEventId: EventId.searchHotelCardEventAutofillFields))
      ..sendEvent(
        SearchHotelCardEventAutofillFields(
          data: SearchHotelCardEventDataAutofillFields(
            city: city,
            startEndDate: "$startDate - $endDate",
            numberOfPeople: numberOfPeople,
          ),
        ),
      )
      ..sendEvent(
        HotelSelectionItemEventHighlightForSuggestion(
          preconditionedEventId: EventId.displayPageHotelSelection,
          data: HotelSelectionItemEventDataHighlightForSuggestion(hotelId: hotelId),
        ),
      )
      ..sendEvent(
        PersonalInformationEventSetPhoneNumber(
          id: EventId.personalInformationEventSetPhoneNumber,
          preconditionedEventId: EventId.personalInformationEventSetEmail,
          data: phoneNumber ?? "",
        ),
      )
      ..sendEvent(
        PersonalInformationEventSetEmail(
          id: EventId.personalInformationEventSetEmail,
          preconditionedEventId: EventId.personalInformationEventSetFullName,
          data: email ?? "",
        ),
      )
      ..sendEvent(
        PersonalInformationEventSetFullName(
          id: EventId.personalInformationEventSetFullName,
          preconditionedEventId: EventId.displayPagePersonalInformation,
          data: fullName ?? "",
        ),
      );
  }
}
